import 'dart:convert' as convert;

import 'package:flutter/services.dart';

class DogResponse {
  Informacao informacao;
  List<Dog> dogs;

  DogResponse.fromJson(Map<String, dynamic> json)
      : informacao = json["informacoes"] != null
      ? Informacao.fromJson(json["informacoes"])
      : null,
        dogs = json["dogs"] != null
            ? json["dogs"].map<Dog>((json) => Dog.fromJson(json)).toList()
            : null;
}

class Informacao {
  String dataAula;
  int qtdeAlunos;

  Informacao.fromJson(Map<String, dynamic> json)
      : dataAula = json["dataAula"],
        qtdeAlunos = json["qtdeAlunos"];

  @override
  String toString() {
    return 'Informacao{dataAula: $dataAula, qtdeAlunos: $qtdeAlunos}';
  }
}

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
  static Future<DogResponse> getDogs() async {
    try {
      await Future.delayed(Duration(seconds: 1));

      String json = await rootBundle.loadString("assets/json/dogs.json");

      final map = convert.json.decode(json);

      DogResponse response = DogResponse.fromJson(map);

      return response;
    } catch (error) {
      print(error);
      return null;
    }
  }
}
