import 'dart:convert' as convert;

import 'package:flutter/services.dart';

class Dog {
  final String nome;
  final String foto;

  List<Dog> filhotes;

  Dog.fromJson(Map<String, dynamic> json)
      : nome = json["nome"],
        foto = json["foto"],
        filhotes = json["filhotes"] != null
            ? json["filhotes"].map<Dog>((json) => Dog.fromJson(json)).toList()
            : null;

  @override
  String toString() {
    return '$nome';
  }
}

class DogService {
  static Future<List<Dog>> getDogs() async {
    try {
      await Future.delayed(Duration(seconds: 1));

      String json = await rootBundle.loadString("assets/json/dogs.json");

      final map = convert.json.decode(json);

      String data = map["informacoes"]["dataAula"];
      print("Data: $data");

      int qtdeAlunos = map["informacoes"]["qtdeAlunos"];
      print("Qtde Alunos: $qtdeAlunos");

      final lista = map["dogs"];

      final dogs = lista.map<Dog>((json) => Dog.fromJson(json)).toList();

//      List<Dog> dogs2 = List<Dog>();
//      for(final dog in dogs) {
//        dogs2.add(dog);
//        dogs2.addAll(dog.filhotes);
//      }]

      print("Dogs $dogs");

      return dogs;
    } catch (error) {
      print(error);
    }
  }
}
