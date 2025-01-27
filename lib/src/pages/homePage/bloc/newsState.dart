import 'package:equatable/equatable.dart';
import 'package:check_news/src/models/newsResponseModel.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => [];
}

class Loading extends NewsState {}

class Loaded extends NewsState {
  final List<Articles> items;
  final String type;

  const Loaded({required this.items, required this.type});

  @override
  List<Object?> get props => [items, type];
}

class Failure extends NewsState {
  final String? errorMessage;

  const Failure({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
