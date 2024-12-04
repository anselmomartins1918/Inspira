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

  bool verifyComplete() {
    return (grades[0] != 0 &&
        grades[1] != 0 &&
        grades[2] != 0 &&
        grades[3] != 0);
  }

  void setValue({required int value}) {
    grades$.value[actualValue] = value;
    grades$.value = List.from(grades$.value);
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

      double result = (grades.whereType<int>().fold(0, (a, b) => a + b)) / 10;
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
