import 'package:check_news/theme_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(SelectedTheme(ThemeType.Light)) {
    on<DarkMode>((event, emit) {
      emit(SelectedTheme(ThemeType.Dark));
    });

    on<LightMode>((event, emit) {
      emit(SelectedTheme(ThemeType.Light));
    });
  }
}