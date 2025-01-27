import 'package:bloc/bloc.dart';
import 'package:check_news/src/pages/homePage/bloc/bloc.dart';
import 'package:check_news/src/resources/repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final Repository _repository;

  NewsBloc({required Repository repository})
      : _repository = repository,
        super(Loading()) {
    on<FetchNews>((event, emit) async {
      emit(Loading());
      try {
        final category = event.category.isNotEmpty ? event.category : 'general';
        print('Fetching news for category: ${event.category}');
        final articles = await _repository.fetchAllNews(category: category);
        print('Articles fetched: ${articles.length}');
        emit(Loaded(items: articles, type: category));
      } catch (e) {
        print('Error in NewsBloc: $e');
        emit(Failure(errorMessage: e.toString()));
      }
    });
  }
}
