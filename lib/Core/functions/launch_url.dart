import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.error, color: Colors.white),
              SizedBox(width: 10),
              Text(
                'Cannot launch the URL',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          backgroundColor: const Color(0xFFEF8262)
          ,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          action: SnackBarAction(
            label: 'Retry',
            textColor: Colors.white,
            onPressed: () {

            },
          ),
          duration: const Duration(seconds: 3),
        ),
      );

    }
  }
}
