import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ImagePostScreen extends StatelessWidget {
  final String imageUrl;

  const ImagePostScreen({super.key, required this.imageUrl});

  void _shareImage() {
    Share.share('Check out this amazing image! $imageUrl');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sample Image Post',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            LayoutBuilder(
              builder: (context, constraints) {
                // Dynamically calculate container dimensions based on screen size
                double containerWidth = constraints.maxWidth * 0.8;
                double containerHeight = containerWidth * (9 / 16); // Maintain aspect ratio

                return Container(
                  width: containerWidth,
                  height: containerHeight,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _shareImage,
              child: const Text('Share'),
            ),
          ],
        ),
      ),
    );
  }
}
