import 'package:flutter/material.dart';

class AvaluantionController {
  ValueNotifier<int> actualValue$ = ValueNotifier<int>(0);
  int get actualValue => actualValue$.value;

  void increment() {
    actualValue$.value = actualValue + 1;
  }

  void decrement() {
    actualValue$.value = actualValue - 1;
  }

  void navigateTo({required int index}) {
    actualValue$.value = index;
  }
}
