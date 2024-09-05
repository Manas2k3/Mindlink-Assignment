// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class TextPostScreen extends StatelessWidget {
  final String textContent;

  const TextPostScreen({super.key, required this.textContent});

  void _shareContent(BuildContext context) async {
    Share.share('Checkout this text post, $textContent');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sample Text Post',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'In 2012, a University of Toronto research team used artificial neural networks and deep learning \ntechniques to lower the error rate below 25% for the first time during the ImageNet challenge for object recognition in computer vision.....',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _shareContent(context),
            child: Text('Share'),
          ),
        ],
      ),
    );
  }
}
