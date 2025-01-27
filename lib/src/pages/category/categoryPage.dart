import 'package:check_news/src/pages/homePage/bloc/bloc.dart';
import 'package:check_news/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatefulWidget {
  final PageController? controller;

  const CategoryPage({Key? key, this.controller}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final categories = [
    {'name': 'Tech', 'type': 'technology', 'image': 'assets/tech.jpg'},
    {'name': 'Economy', 'type': 'business', 'image': 'assets/economy.jpg'},
    {'name': 'Sport', 'type': 'sports', 'image': 'assets/sports.jpg'},
    {'name': 'Health', 'type': 'health', 'image': 'assets/health.jpg'},
    {'name': 'Fun', 'type': 'entertainment', 'image': 'assets/fun.jpg'},
    {'name': 'Science', 'type': 'science', 'image': 'assets/science.jpg'},
    {'name': 'General', 'type': 'general', 'image': 'assets/general.jpg'},
    {'name': 'Music', 'type': 'music', 'image': 'assets/music.jpg'},
    {'name': 'Arts', 'type': 'arts', 'image': 'assets/arts.jpg'},
  ];

  Widget _categoryCard(String text, String type, String imgPath) {
    return InkWell(
      onTap: () {
        print('Category selected: $type');
        BlocProvider.of<NewsBloc>(context).add(FetchNews(category: type));
        widget.controller?.animateToPage(
          1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              imgPath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6), // Slightly darker background
                    Colors.black.withOpacity(0.4), // Slightly lighter gradient effect
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(1.5, 1.5),
                      blurRadius: 3,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.primaryColor, // Use 92 News primary color here
        title: Text('News Categories', style: AppTheme.h2Style.copyWith(color: Colors.white)),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2, // Slightly taller cards
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return _categoryCard(category['name']!, category['type']!, category['image']!);
        },
      ),
    );
  }
}
