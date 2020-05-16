import 'package:flutter/material.dart';
//stle + tab para crear estructura
class HomePageTemp extends StatelessWidget {

  final opciones= ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItems()
      ),
    );
  }

  List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();
    // cuando el ciclo termina la variable lista tiene todos los elementos

    for (var opt in opciones) {

      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista..add(tempWidget)
          ..add(Divider(height: 5,color: Colors.blue,));
      
    }

    return lista;
  }



    List<Widget> _crearItemsCorta(){
  }
}