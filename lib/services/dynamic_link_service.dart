import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uni_links2/uni_links.dart';  
import 'dart:async';

class DynamicLinkService {
  StreamSubscription? _sub;

  
  Future<void> initDynamicLinks(BuildContext context) async {
    
    _sub = uriLinkStream.listen((Uri? deepUri) {
      if (deepUri != null) {
        String? postId = deepUri.queryParameters['postId'];
        if (postId != null) {
          _navigateToPost(context, postId);
        }
      }
    }, onError: (err) {
      if (kDebugMode) {
        print('Error handling dynamic link: $err');
      }
    });
  }

  
  void _navigateToPost(BuildContext context, String postId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Navigating to post: $postId')),
    );
    
  }

  
  void dispose() {
    _sub?.cancel();
  }
}
