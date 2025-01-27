import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object?> get props => [];
}

class FetchNews extends NewsEvent {
  final String category;

  /// Set default category to "general" if none is provided.
  const FetchNews({this.category = 'general'});

  @override
  List<Object?> get props => [category];
}