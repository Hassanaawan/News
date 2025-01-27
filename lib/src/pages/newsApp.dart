import 'package:flutter/material.dart';
import 'package:check_news/src/commonWidget/bottomNavigationBar.dart';
import 'VideoNews/videoNewsPage.dart';
import 'category/categoryPage.dart';
import 'homePage/homePage.dart';
import 'profile/profilePage.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  PageController _controller = PageController();
  int _currentIndex = 0;  // To track the selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _currentIndex,  // Pass the current index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update current index
          });
          _controller.jumpToPage(index); // Change the PageView's index
        },
      ),
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;  // Update the current index when the page changes
          });
        },
        children: <Widget>[
          HomePage(),
          VideoNewsPage(),
          CategoryPage(controller: _controller),
          ProfilePage(),
        ],
      ),
    );
  }
}
