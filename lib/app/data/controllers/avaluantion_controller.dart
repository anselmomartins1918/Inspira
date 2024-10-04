import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AvaluantionController {
  ValueNotifier<int> actualValue$ = ValueNotifier<int>(0);
  int get actualValue => actualValue$.value;

  ValueNotifier<List<int>> grades$ = ValueNotifier<List<int>>([0, 0, 0, 0]);
  List<int> get grades => grades$.value;

  void increment() {
    actualValue$.value = actualValue + 1;
  }

  void decrement() {
    actualValue$.value = actualValue - 1;
  }

  void navigateTo({required int index}) {
    actualValue$.value = index;
  }

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
          FirebaseFirestore.instance.collection('avaluations').doc(valuer);

      DocumentSnapshot doc = await docRef.get();

      if (doc.exists) {
        docRef.update({
          team: grades[0] * 3 + grades[1] * 3 + grades[2] * 2 + grades[3] * 1,
        });
      } else {
        docRef.set({
          team: grades[0] * 3 + grades[1] * 3 + grades[2] * 2 + grades[3] * 1,
        });
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
