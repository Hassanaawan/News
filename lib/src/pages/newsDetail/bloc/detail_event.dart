// detail_page_event.dart
import 'package:check_news/src/models/newsResponseModel.dart';

abstract class DetailPageEvent {}

class FetchArticleDetail extends DetailPageEvent {
  final Articles article;

  FetchArticleDetail(this.article);
}
