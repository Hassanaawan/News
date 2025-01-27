// detail_page_bloc.dart
import 'package:check_news/src/pages/newsDetail/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:check_news/src/resources/repository.dart';


class DetailPageBloc extends Bloc<DetailPageEvent, DetailPageState> {
  final Repository _repository;

  DetailPageBloc(this._repository) : super(DetailPageLoading());


  Stream<DetailPageState> mapEventToState(DetailPageEvent event) async* {
    if (event is FetchArticleDetail) {
      try {
        // Simulating a delay for fetching the article details (can be customized)
        await Future.delayed(Duration(seconds: 1));
        yield DetailPageLoaded(event.article);
      } catch (e) {
        yield DetailPageFailure('Failed to load article details: $e');
      }
    }
  }
}