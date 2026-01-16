import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/slide_to_confirm.dart';

class IncidentScreen extends StatefulWidget {
  final String tripId;
  const IncidentScreen({super.key, required this.tripId});

  @override
  State<IncidentScreen> createState() => _IncidentScreenState();
}

class _IncidentScreenState extends State<IncidentScreen> {
  String _type = 'delay';
  final TextEditingController _commentController = TextEditingController();
  File? _photo;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _pickPhoto() async {
    final x = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 85);
    if (x != null) setState(() => _photo = File(x.path));
  }

  void _submit() async {
    // TODO: call report incident usecase
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Incident')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DropdownButtonFormField<String>(
            value: _type,
            items: const [
              DropdownMenuItem(value: 'delay', child: Text('Retard')),
              DropdownMenuItem(value: 'damage', child: Text('Dégât')),
              DropdownMenuItem(value: 'other', child: Text('Autre')),
            ],
            onChanged: (v) => setState(() => _type = v ?? 'delay'),
            decoration: const InputDecoration(labelText: 'Type d’incident'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _commentController,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(labelText: 'Commentaire'),
          ),
          const SizedBox(height: 12),
          if (_photo == null)
            OutlinedButton.icon(onPressed: _pickPhoto, icon: const Icon(Icons.camera_alt), label: const Text('Ajouter une photo'))
          else
            Stack(
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.file(_photo!, height: 160, fit: BoxFit.cover)),
                Positioned(
                  right: 8,
                  top: 8,
                  child: IconButton.filledTonal(onPressed: () => setState(() => _photo = null), icon: const Icon(Icons.close)),
                ),
              ],
            ),
          const SizedBox(height: 24),
          SlideToConfirm(label: 'Glisser pour envoyer', onConfirmed: _submit),
        ],
      ),
    );
  }
}

