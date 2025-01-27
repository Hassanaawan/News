import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print("Bloc created");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('Event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('Transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object? error, StackTrace stackTrace) {
    super.onError(bloc, error ?? 'Unknown error', stackTrace); // Default error if error is null
    print('Error: $error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print("Bloc closed");
  }
}
