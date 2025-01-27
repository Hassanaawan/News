// detail_page_state.dart
import 'package:check_news/src/models/newsResponseModel.dart';

abstract class DetailPageState {}

class DetailPageLoading extends DetailPageState {}

class DetailPageLoaded extends DetailPageState {
  final Articles article;

  DetailPageLoaded(this.article);
}

class DetailPageFailure extends DetailPageState {
  final String errorMessage;

  DetailPageFailure(this.errorMessage);
}
