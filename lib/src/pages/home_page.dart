import 'package:componentes/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes')
      ),
      body: _lista(),
      
    );
  }

 Widget _lista() {
   

   return FutureBuilder (
     // se le pasa cargar data al future  porque cargardata() es la funcion que queremos esperar
     future: menuProvider.cargarData(),
     initialData: [],
     builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
       // el builder se disparara en alguna de sus tres etapas
       // el builder debe regresar un widget creado con la info del future
     
       print('here2');
         print(snapshot.data);
      
        return ListView(
        children: _listaItems(snapshot.data), // aqui se envia la lista dinamica a _listaItems
        );
         

     },
   );
   
   
  
 }

  List<Widget>_listaItems(List<dynamic> data) {
    
    final List<Widget> opciones =[];

    data. forEach((opt) { 

      final widgetnTemp = ListTile(
        title:Text(opt['texto']) , // para apuntar a las llaves texto de cada elemento del json
        leading: Icon(Icons.account_circle),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),

        onTap: (){


        },
        );

        opciones..add(widgetnTemp)
                ..add(Divider());

    });

    

    return opciones;   
  }
}