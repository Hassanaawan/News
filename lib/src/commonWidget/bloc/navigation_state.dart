abstract class NavigationState {}

class Opened extends NavigationState {
  final int pageIndex;
  Opened({required this.pageIndex});
}