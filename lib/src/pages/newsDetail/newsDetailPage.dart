import 'package:flutter/material.dart';
import 'package:check_news/src/models/newsResponseModel.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the article from the arguments
    final article = ModalRoute.of(context)!.settings.arguments as Articles;

    return Scaffold(
      appBar: AppBar(
        title: Text(article.title ?? 'Article Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Article Title
              Text(
                article.title ?? 'No Title',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // Source Name
              if (article.source?.name != null)
                Row(
                  children: [
                    Text(
                      'Source: ${article.source?.name}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              const SizedBox(height: 8),
            
              // Author
              if (article.author != null)
                Text(
                  'Author: ${article.author}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              const SizedBox(height: 8),
                 // Description
              if (article.description != null)
                Text(
                  'Description: ${article.description}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              const SizedBox(height: 8),
              // Published Date
              if (article.publishedAt != null)
                Text(
                  'Published At: ${article.publishedAt}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              const SizedBox(height: 8),

              // Article Content (Description)
              if (article.content != null)
                Text(
                  article.content!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
                ),
              const SizedBox(height: 8),

              // News Image (if available)
              if (article.urlToImage != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    article.urlToImage!,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 8),

              // URL to Full Article
              if (article.url != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Open the full article in browser
                      _launchURL(article.url!);
                    },
                    child: Text('Read Full Article'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to launch the URL in the browser
  void _launchURL(String url) {
    // You can use the url_launcher package for this
    // For example, this could be implemented with:
    // launch(url); // Ensure to import url_launcher in pubspec.yaml
  }
}
