// ignore_for_file: prefer_const_constructors

import 'dart:io' show Platform; // Only needed for non-web platforms

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:mindlink_assignment/services/dynamic_link_service.dart';
import 'package:mindlink_assignment/services/dynamic_link_service_web.dart';
import 'package:mindlink_assignment/views/navbar/image_post_screen.dart';
import 'package:mindlink_assignment/views/navbar/text_post_screen.dart';
import 'package:mindlink_assignment/views/navbar/video_post_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    TextPostScreen(
      textContent: 'https://en.wikipedia.org/wiki/AI_boom',
    ),
    VideoPostScreen(
      videoUrl:
          "https://cdn.pixabay.com/video/2024/03/02/202693-918730367_large.mp4", // Use a valid video URL here
    ),
    ImagePostScreen(
      imageUrl:
          'https://images.unsplash.com/photo-1452801357919-36bc5fda6514?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
  ];

  // Instance of the dynamic link service
  dynamic dynamicLinkService;

  @override
  void initState() {
    super.initState();
    // Initialize the correct dynamic link service based on platform
    if (kIsWeb) {
      dynamicLinkService = DynamicLinkServiceWeb();
    } else if (Platform.isAndroid || Platform.isIOS) {
      dynamicLinkService = DynamicLinkService();
    } else if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      dynamicLinkService =
          DynamicLinkServiceWeb(); // Adjust based on your requirements
    } else {
      throw UnsupportedError('Unsupported platform');
    }

    dynamicLinkService.initDynamicLinks(context); // Initialize dynamic links
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Navigation App'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.text_fields), label: 'Text'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library), label: 'Video'),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Image'),
        ],
      ),
    );
  }
}
