import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoPostScreen extends StatefulWidget {
  const VideoPostScreen({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  State<VideoPostScreen> createState() => _VideoPostScreenState();
}

class _VideoPostScreenState extends State<VideoPostScreen> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayer;

  @override
  void initState() {
    super.initState();

    // Initialize VideoPlayerController based on the URL
    if (widget.videoUrl.startsWith('http://') ||
        widget.videoUrl.startsWith('https://')) {
      _videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    } else {
      _videoPlayerController = VideoPlayerController.asset(widget.videoUrl);
    }

    _initializeVideoPlayer = _videoPlayerController.initialize().then((_) {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);

      if (mounted) {
        setState(() {});
      }
    }).catchError((error) {
      // Handle error
      print('Error initializing video player: $error');
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _shareVideo() {
    Share.share('Check out this awesome video! ${widget.videoUrl}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sample Video Post',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                future: _initializeVideoPlayer,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (_videoPlayerController.value.isInitialized) {
                      return LayoutBuilder(
                        builder: (context, constraints) {
                          double containerWidth = constraints.maxWidth * 0.8;
                          double containerHeight = containerWidth * (9 / 16); // 16:9 aspect ratio

                          return Container(
                            width: containerWidth,
                            height: containerHeight,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: AspectRatio(
                                aspectRatio: _videoPlayerController.value.aspectRatio,
                                child: VideoPlayer(_videoPlayerController),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text('Error loading video'));
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _shareVideo,
                child: const Text('Share'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
