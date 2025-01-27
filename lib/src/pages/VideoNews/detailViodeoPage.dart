import 'package:flutter/material.dart';
import 'package:check_news/src/models/newsResponseModel.dart';
import 'package:check_news/src/theme/theme.dart';
import 'package:check_news/src/commonWidget/customWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailVideoPage extends StatelessWidget {
  final Articles article;

  const DetailVideoPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News Details',
          style: AppTheme.h2Style.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article Image with fallback
            article.urlToImage != null
                ? customImage(
                    article.urlToImage!,
                    fit: BoxFit.cover,
                   
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: Theme.of(context).colorScheme.surface,
                    child: Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Theme.of(context).disabledColor,
                    ),
                  ),

            const SizedBox(height: 16),

            // Article Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                article.title ?? 'No Title Available',
                style: AppTheme.h1Style.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),

            const SizedBox(height: 8),

            // Published Date
            if (article.publishedAt != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Published on: ${article.publishedAt}',
                  style: AppTheme.subTitleStyle.copyWith(color: Theme.of(context).disabledColor),
                ),
              ),

            const SizedBox(height: 16),

            // Article Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                article.content ?? 'Content not available',
                style: AppTheme.subTitleStyle.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),

            const SizedBox(height: 16),

            // Source URL
            if (article.url != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GestureDetector(
                  onTap: () {
                    // Open the URL in a web browser
                    _launchURL(context, article.url!);
                  },
                  child: Text(
                    'Read more: ${article.url}',
                    style: AppTheme.subTitleStyle.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Function to handle opening the article URL
  void _launchURL(BuildContext context, String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        _showError(context, 'Could not launch URL.');
      }
    } catch (e) {
      _showError(context, 'Error: ${e.toString()}');
    }
  }

  // Function to show an error message
  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
