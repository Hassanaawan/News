import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:check_news/src/models/newsResponseModel.dart';
import 'package:check_news/src/helpers/constants.dart';

class NewsApiProvider {
  final http.Client _client;
  final String _apiKey;

  NewsApiProvider({http.Client? client, String? apiKey})
      : _client = client ?? http.Client(),
        _apiKey = apiKey ?? Constant.newsApiKey;

  Future<List<Articles>> fetchNewsList({String category = ''}) async {
    try {
      final url = Uri.parse(
        category.isEmpty
            ? 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$_apiKey'
            : 'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$_apiKey',
      );

      print('Fetching URL: $url');
      final response = await _client.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
        final newsApiResponse = NewsApiResponse.fromJson(jsonResponse);
        return newsApiResponse.articles ?? [];
      } else {
        throw ApiException(
          'Failed to load news. Status code: ${response.statusCode}, Response: ${response.body}',
        );
      }
    } catch (e) {
      throw ApiException('Error fetching news: $e');
    }
  }
}

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => 'ApiException: $message';
}
