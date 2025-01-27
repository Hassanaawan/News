import 'package:check_news/src/pages/category/categoryPage.dart';
import 'package:check_news/src/pages/homePage/homePage.dart';
import 'package:check_news/src/pages/newsApp.dart';
import 'package:check_news/src/pages/newsDetail/newsDetailPage.dart';
import 'package:check_news/src/pages/profile/profilePage.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => NewsApp(),
      '/home': (_) => HomePage(),
      '/detail': (_) => DetailPage(),  // Route to DetailPage
      '/category': (_) => CategoryPage(),
      '/profile': (_) => ProfilePage(),
    };
  }
}
