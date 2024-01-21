import 'package:flutter_riverpod/flutter_riverpod.dart';

final providerChangePage =
    StateNotifierProvider<PageState, int>((ref) => PageState());

class PageState extends StateNotifier<int> {
  PageState() : super(1);

  void changeState(int value) {
    state = value;
  }
}
