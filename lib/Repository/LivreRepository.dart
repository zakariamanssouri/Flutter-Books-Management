import 'dart:math';

import 'package:tp1flutter/models/Livre.dart';


class LivreRepository {
  List<Livre> livres = [
    Livre(id_livre: 1,
        isbn: "#71724774",
        titre: "livre1",
        auteur: "zakaria",
        anne_publication: "2022",
        nb_exemplaires: 1,
        prix: 20),
    Livre(id_livre: 2,
        isbn: "#19938",
        titre: "livre2",
        auteur: "karim",
        anne_publication: "2021",
        nb_exemplaires: 2,
        prix: 100),
    Livre(id_livre: 3,
        isbn: "#399390011",
        titre: "livre3",
        auteur: "ahmed",
        anne_publication: "2022",
        nb_exemplaires: 10,
        prix: 200)
  ];


  Future<List<Livre>> allLivres() async {
    var future = await Future.delayed(Duration(seconds: 1));
    return livres;
  }

  Future<List<Livre>> livreByKeyword(String keyword) async {
    var future = await Future.delayed(Duration(seconds: 1));
    int rand = new Random().nextInt(10);
    if (rand > 5) {
      return livres.where((element) => element.titre == keyword).toList();
    } else {
      throw Exception("Erreur de chargement des livres");
    }
  }

  Future<void> deleteLivre(int id) async {
    var future = await Future.delayed(Duration(seconds: 1));
        livres.removeWhere((element) => element.id_livre==id);
        print(livres);
    }
  }
  