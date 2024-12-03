import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inspira/app/data/models/avaluation.dart';

class TeamSelectionController {
  final String name;

  ValueNotifier<List<Avaluation>> avaluations$ =
      ValueNotifier<List<Avaluation>>([]);
  List<Avaluation> get avaluations => avaluations$.value;

  TeamSelectionController({
    required this.name,
  }) {
    listening();
  }

  void listening() {
    FirebaseFirestore.instance
        .collection('mude-avaluations')
        .doc(name)
        .snapshots()
        .listen((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> snapshot =
            documentSnapshot.data() as Map<String, dynamic>;

        avaluations$.value.clear();

        snapshot.forEach(
          (key, value) =>
              avaluations$.value.add(Avaluation(team: key, grade: value)),
        );

        avaluations$.value = List.from(avaluations$.value);
      } else {}
    });
  }
}
