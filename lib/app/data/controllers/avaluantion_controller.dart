import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AvaluantionController {
  ValueNotifier<int> avaluation$ = ValueNotifier<int>(0);
  int get avaluation => avaluation$.value;

  ValueNotifier<int> actualValue$ = ValueNotifier<int>(0);
  int get actualValue => actualValue$.value;

  ValueNotifier<List<int?>> grades$ = ValueNotifier<List<int?>>(
    [null, null, null, null, null, null, null, null],
  );
  List<int?> get grades => grades$.value;

  void changeAvaluation(int value) => avaluation$.value = value;

  void increment() => actualValue$.value = actualValue + 1;

  void decrement() => actualValue$.value = actualValue - 1;

  void navigateTo({required int index}) => actualValue$.value = index;

  bool verifyComplete() => grades.every((item) => item != null);

  void setValue() {
    grades$.value[actualValue] = avaluation;
    grades$.value = List.from(grades$.value);

    log(grades.toString());
  }

  bool verifyMarked({required int value}) {
    return grades[actualValue] == value;
  }

  Future<bool> sendAvaluation({
    required String team,
    required String valuer,
  }) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('mude-avaluations').doc(valuer);

      DocumentSnapshot doc = await docRef.get();

      double result = (grades.whereType<int>().fold(0, (a, b) => a + b)) / 8;
      double truncatedValue = (result * 100).truncateToDouble() / 100;

      if (doc.exists) {
        docRef.update({
          team: truncatedValue,
        });
      } else {
        docRef.set({
          team: truncatedValue,
        });
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
