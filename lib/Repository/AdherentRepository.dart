
import 'dart:math';

import 'package:tp1flutter/models/Adherent.dart';

class AdherentRepository {
  List<Adherent> adherents = [
    Adherent(id_adherent: 1,nom: "samir",prenom: "rdounni",email: "samir@gg.Com",tel: "091883838"),
    Adherent(id_adherent: 2,nom: "badr",prenom: "dahous",email: "badr@gg.Com",tel: "091883838"),
    Adherent(id_adherent: 3,nom: "ahlam",prenom: "alami",email: "ahlam@gg.Com",tel: "0298498905"),
  ];


  Future<List<Adherent>> allAdherents() async {
    var future = await Future.delayed(const Duration(seconds: 1));
    int rand = Random().nextInt(10);
    if (rand > 5) {
      return adherents;
    } else {
      throw Exception("Erreur de chargement des adherents");
    }
  }

  Future<void> deleteAdhrent(int id) async {
    var future = await Future.delayed(Duration(seconds: 1));
    adherents.removeWhere((element) => element.id_adherent==id);
  }

}