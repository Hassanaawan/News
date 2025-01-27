import 'package:check_news/theme_enum.dart';

abstract class ThemeState {}

class SelectedTheme extends ThemeState {
  final ThemeType themeType;
  SelectedTheme(this.themeType);
}
