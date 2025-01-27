import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:check_news/src/resources/repository.dart';
import 'package:check_news/src/pages/homePage/bloc/bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(repository: Repository())
        ..add(const FetchNews(category: '')), // Fetch news when the page loads
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is Loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is Failure) {
                return Center(
                  child: Text(
                    state.errorMessage ??
                        'Something went wrong. Please try again.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              } else if (state is Loaded) {
                if (state.items.isEmpty) {
                  return const Center(
                      child: Text('No news content available.'));
                } else {
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        pinned: true,
                        backgroundColor: const Color(0xFF002B5C), // Navy Blue
                        title: Text(
                          '${state.type.toUpperCase()} NEWS',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: const Color(0xFFFFFFFF)), // White
                        ),
                        centerTitle: true,
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final article = state.items[index];
                            return Card(
                              color: const Color(
                                  0xFFFFFFFF), // White card background
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    color: Color(0xFFB22222)), // Red border
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title
                                    Text(
                                      article.title ?? 'No Title',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith( 
                                            fontWeight: FontWeight.bold,
                                            color: const Color(
                                                0xFF002B5C), // Navy Blue
                                          ),
                                    ),
                                    const SizedBox(height: 8),
                                    // Author
                                    if (article.author != null)
                                      Text(
                                        'Author: ${article.author}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: const Color(
                                                    0xFFB22222)), // Red
                                      ),
                                    const SizedBox(height: 8),
                                    // Published Date
                                    if (article.publishedAt != null)
                                      Text(
                                        'Published At: ${article.publishedAt}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: const Color(
                                                    0xFFB22222)), // Red
                                      ),
                                    const SizedBox(height: 8),
                                    // Description
                                    if (article.description != null)
                                      Text(
                                        article.description!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: const Color(
                                                    0xFF002B5C)), // Navy Blue
                                      ),
                                    const SizedBox(height: 8),
                                    // News Image
                                    if (article.urlToImage != null)
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          article.urlToImage!,
                                          height: 200,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    const SizedBox(height: 8),
                                    // Read More (URL)
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/detail',
                                          arguments: article,
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: const Color(
                                            0xFF002B5C), // Navy Blue
                                        textStyle: TextStyle(color: Colors.white), // Text color
                                            
                                      ),
                                      child: const Text('Read More'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: state.items.length,
                        ),
                      ),
                    ],
                  );
                }
              }
              return const Center(child: Text('Unexpected state.'));
            },
          ),
        ),
      ),
    );
  }
}
