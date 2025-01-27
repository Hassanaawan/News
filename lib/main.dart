import 'package:check_news/src/bloc/simple_bloc_delegate.dart';
import 'package:check_news/src/commonWidget/bloc/bloc.dart';
import 'package:check_news/src/pages/newsDetail/bloc/bloc.dart';
import 'package:check_news/src/theme/bloc/bloc.dart';
import 'package:check_news/src/theme/color/dark_color.dart';
import 'package:check_news/src/theme/color/lightColor.dart';
import 'package:check_news/src/theme/theme.dart';
import 'package:check_news/theme_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/helpers/routes.dart';
import 'src/pages/homePage/bloc/bloc.dart';

import 'src/resources/repository.dart';

void main() {
  Bloc.observer = SimpleBlocObserver(); // Optional: For logging events
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(create: (context) => NewsBloc(repository: Repository())),
        BlocProvider<DetailPageBloc>(create: (context) => DetailPageBloc(Repository())),
        BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),  // NavigationBloc here
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          ThemeData currentTheme = lightTheme; // Default theme
        if (state is SelectedTheme) {
          currentTheme = (state.themeType == ThemeType.Light) ? lightTheme : darkTheme;
        }

          return MaterialApp(
            title: 'Check News',
            theme: currentTheme,
            debugShowCheckedModeBanner: false,
            routes: Routes.getRoute(), // Use this instead of routes
          );
        },
      ),
    );
  }

  // Helper method to determine the theme
  ThemeData _getAppTheme(ThemeState themeState) {
    if (themeState is SelectedTheme) {
      // Choose theme based on the current theme type
      return themeState.themeType == ThemeType.Light
          ? AppTheme.lightTheme
          : AppTheme.darkTheme;
    }
    // Default to light theme if the state is unknown
    return AppTheme.lightTheme;
  }
}
