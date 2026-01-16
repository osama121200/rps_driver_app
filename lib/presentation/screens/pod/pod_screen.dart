import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';
import '../../widgets/slide_to_confirm.dart';

class PodScreen extends StatefulWidget {
  final String tripId;
  const PodScreen({super.key, required this.tripId});

  @override
  State<PodScreen> createState() => _PodScreenState();
}

class _PodScreenState extends State<PodScreen> {
  final SignatureController _signatureController = SignatureController(penStrokeWidth: 3, penColor: Colors.black);
  File? _photo;
  bool _uploading = false;

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  Future<void> _pickPhoto() async {
    final picker = ImagePicker();
    final xfile = await picker.pickImage(source: ImageSource.camera, imageQuality: 85);
    if (xfile != null) {
      setState(() => _photo = File(xfile.path));
    }
  }

  Future<void> _upload() async {
    // TODO: render signature to file and call upload usecase
    setState(() => _uploading = true);
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() => _uploading = false);
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preuve de livraison')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey.shade200),
              child: _photo == null
                  ? Center(
                      child: TextButton.icon(onPressed: _pickPhoto, icon: const Icon(Icons.camera_alt), label: const Text('Prendre une photo')),
                    )
                  : Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.file(_photo!, fit: BoxFit.cover)),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: IconButton.filledTonal(onPressed: () => setState(() => _photo = null), icon: const Icon(Icons.close)),
                        ),
                      ],
                    ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 180,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(borderRadius: BorderRadius.circular(12), child: Signature(controller: _signatureController, backgroundColor: Colors.white)),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () => _signatureController.clear(),
              icon: const Icon(Icons.refresh),
              label: const Text('Effacer la signature'),
            ),
          ),
          const SizedBox(height: 16),
          if (_uploading)
            const Center(child: CircularProgressIndicator())
          else
            SlideToConfirm(label: 'Glisser pour envoyer', onConfirmed: _upload),
        ],
      ),
    );
  }
}

