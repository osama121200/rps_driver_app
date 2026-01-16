import 'package:flutter/material.dart';

class BarcodePreviewScreen extends StatelessWidget {
  const BarcodePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scanner (UI only)')),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black,
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 2,
                        color: Colors.redAccent,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Camera preview placeholder', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.qr_code_scanner),
              label: const Text('Simulate Scan'),
            ),
          ),
        ],
      ),
    );
  }
}

