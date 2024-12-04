import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inspira/app/data/models/team.dart';

class RankingController {
  RankingController() {
    _listening();
  }

  ValueNotifier<List<Team>> teams$ = ValueNotifier<List<Team>>([]);
  List<Team> get teams => teams$.value;

  void _listening() {
    FirebaseFirestore.instance
        .collection('mude-avaluations')
        .snapshots()
        .listen((snapshot) async {
      _fetchDocuments();
    });
  }

  Future<void> _fetchDocuments() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('mude-avaluations').get();

    List<Map<String, dynamic>> documents =
        snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

    teams$.value.clear();

    for (int index = 0; index < documents.length; index++) {
      Map<String, dynamic> aux = documents[index];

      aux.forEach((key, value) {
        if (teams.any((team) => team.name == key)) {
          int index = teams.indexWhere((element) => element.name == key);

          teams$.value[index] =
              Team(name: key, total: teams[index].total + value);
        } else {
          teams$.value.add(Team(name: key, total: value));
        }
      });
    }

    teams$.value.sort((a, b) => b.total.compareTo(a.total));

    teams$.value = List.from(teams$.value);
  }
}
