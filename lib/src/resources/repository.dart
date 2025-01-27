import 'package:check_news/src/models/newsResponseModel.dart';
import 'package:check_news/src/resources/newsApiProvider.dart';

class Repository {
  final NewsApiProvider _newsApiProvider;

  Repository({NewsApiProvider? newsApiProvider})
      : _newsApiProvider = newsApiProvider ?? NewsApiProvider();

  Future<List<Articles>> fetchAllNews({String category = ''}) async {
    try {
      print('Fetching news for category: ${category.isEmpty ? category : 'All'}');
      final List<Articles> items = await _newsApiProvider.fetchNewsList(category: category);
      print('Fetched ${items.length} articles for category: ${category.isEmpty ? category : 'ALL'}');
      return items;
    } catch (e) {
      print('Error fetching news: $e');
      return [];
    }
  }
}
