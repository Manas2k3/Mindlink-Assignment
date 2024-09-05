import 'package:flutter/material.dart';
import 'package:uni_links2/uni_links.dart';

class DynamicLinkServiceWeb {
  Future<void> initDynamicLinks(BuildContext context) async {
    Uri? initialUri = await getInitialUri();
    if (initialUri != null) {
      String? postId = initialUri.queryParameters['postId'];
      if (postId != null) {
        _navigateToPost(context, postId);
      }
    }
  }

  void _navigateToPost(BuildContext context, String postId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Navigating to post: $postId')),
    );
  }
}
