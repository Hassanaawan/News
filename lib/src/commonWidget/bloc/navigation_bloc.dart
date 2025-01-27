import 'package:check_news/src/commonWidget/bloc/navigation_event.dart';
import 'package:check_news/src/commonWidget/bloc/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(Opened(pageIndex: 0));

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigateToPage) {
      // When the event is NavigateToPage, yield the new Opened state with the updated pageIndex
      yield Opened(pageIndex: event.pageIndex);
    }
  }
}