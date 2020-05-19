import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
       body:
       ListView(
         padding: EdgeInsets.symmetric(horizontal:20, vertical: 10.0),
         children: <Widget>[
           _cardTipo1()

         ],

       )
    );
  }

   _cardTipo1(){

     return Card(
       //Colum para poder ordenar mas elementos dentro de esa tarjeta en manera vertical
       child: Column(
         children: <Widget>[
           ListTile(
             leading: Icon(Icons.photo_album,color: Colors.blue),
             title: Text('Soy el titulo'),
             subtitle: Text('este subtitulo es un ejemplo solo para mostrar algun texto relevante en la tarjeta'),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: <Widget>[
             FlatButton(
               child: Text('Cancelar'),
               onPressed: (){},
             ),

             FlatButton(
               child: Text('OK'),
               onPressed: (){},
             )
           ],)
         ],

       ),
     );
   }
}