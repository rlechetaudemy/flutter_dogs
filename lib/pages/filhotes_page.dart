
import 'package:flutter/material.dart';
import 'package:flutter_parser_json/domain/dog.dart';
import 'package:flutter_parser_json/utils/alert.dart';

class FilhotesPage extends StatelessWidget {
  final Dog dog;
  FilhotesPage(this.dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filhotes do ${dog.nome}"),
      ),
      body: _listView(context, dog.filhotes),
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
        });
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

    alert(context,"Filhote",dog.nome);

  }
}
