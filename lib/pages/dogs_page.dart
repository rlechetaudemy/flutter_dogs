import 'package:flutter/material.dart';
import 'package:flutter_parser_json/domain/dog.dart';
import 'package:flutter_parser_json/pages/filhotes_page.dart';
import 'package:flutter_parser_json/utils/alert.dart';
import 'package:flutter_parser_json/utils/nav.dart';

class DogsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Parser JSON"),
        ),
        body: _body());
  }

  _body() {
    Future<DogResponse> future = DogService.getDogs();
    return FutureBuilder<DogResponse>(
      future: future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        DogResponse response = snapshot.data;
        List<Dog> dogs = response.dogs;
        return Column(
          children: <Widget>[
            header(response.informacao),
            Divider(
              height: 40,
            ),
            Expanded(
              child: _listView(context, dogs),
            )
          ],
        );
      },
    );
  }

  _listView(context, List<Dog> dogs) {
    return ListView.builder(
      itemCount: dogs.length,
      itemBuilder: (context, index) {
        Dog dog = dogs[index];
        return GestureDetector(
          onTap: () => _onClickDog(context, dog),
          child: Column(
            children: <Widget>[
              Text(
                dog.nome,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue,
                ),
              ),
              _img(dog.foto)
            ],
          ),
        );
      },
    );
  }

  _img(String s) {
    return Container(
      child: Image.asset(
        "assets/images/$s",
        fit: BoxFit.fill,
      ),
    );
  }

  _onClickDog(context, Dog dog) {
    print("Dog >>> ${dog.nome}");
    //alert(context, "Dog", dog.nome);

    push(context, FilhotesPage(dog));
  }

  header(Informacao informacao) {
    return Column(
      children: <Widget>[
        Text(
          "Data da aula ${informacao.dataAula}",
          style: TextStyle(
            fontSize: 28,
            color: Colors.blue,
          ),
        ),
        Text(
          "Qtde alunos ${informacao.qtdeAlunos}",
          style: TextStyle(
            fontSize: 28,
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
