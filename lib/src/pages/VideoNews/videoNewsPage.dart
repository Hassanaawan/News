import 'package:check_news/src/commonWidget/customWidget.dart';
import 'package:check_news/src/models/newsResponseModel.dart';
import 'package:check_news/src/pages/VideoNews/detailViodeoPage.dart';
import 'package:check_news/src/pages/homePage/bloc/bloc.dart';
import 'package:check_news/src/pages/homePage/widget/newsCard.dart';
import 'package:check_news/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoNewsPage extends StatelessWidget {
  Widget _headerNews(BuildContext context, Articles article) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailVideoPage(article: article),
          ),
        );
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              article.urlToImage != null
                  ? customImage(article.urlToImage!, fit: BoxFit.cover)
                  : Container(
                      color: Theme.of(context).colorScheme.surface,
                      height: 200,
                      child: Icon(
                        Icons.broken_image,
                        size: 50,
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
              Positioned(
                bottom: 0,
                child: _buildArticleInfo(context, article),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: _buildPlayButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticleInfo(BuildContext context, Articles article) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      color: Colors.black.withOpacity(0.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (article.title != null)
            Text(
              article.title!,
              style: AppTheme.h2Style.copyWith(color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          const SizedBox(height: 5),
          if (article.publishedAt != null)
            Text(
              'Published on: ${article.publishedAt}',
              style: AppTheme.subTitleStyle.copyWith(color: Colors.grey[300]),
            ),
        ],
      ),
    );
  }

  Widget _buildPlayButton(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Icon(
        Icons.play_arrow,
        color: Theme.of(context).colorScheme.primary,
        size: 30,
      ),
    );
  }

  Widget _body(BuildContext context, List<Articles> list, {required String type}) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          title: Text(
            type.toUpperCase(),
            style: AppTheme.h2Style.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.deepPurple.shade700
              : Colors.deepPurple.shade600,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple.shade800,
                    Colors.deepPurple.shade600,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          pinned: true,
          elevation: 10,
          toolbarHeight: 80,
        ),
        SliverToBoxAdapter(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return _headerNews(context, list[index]);
              },
              itemCount: list.length,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => NewsCard(
              artical: list[index],
              isVideoNews: true,
              type: type.toUpperCase(),
            ),
            childCount: list.length,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is Failure) {
              return Center(
                child: Text(
                  state.errorMessage ?? 'Something went wrong. Please try again.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              );
            } else if (state is Loaded) {
              // Ensure default type is 'general' if empty
              final type = state.type.isNotEmpty ? state.type : 'general';

              if (state.items.isEmpty) {
                return const Center(
                  child: Text('No news content available.'),
                );
              } else {
                return _body(context, state.items, type: type);
              }
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
