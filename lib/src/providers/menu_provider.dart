import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle; // rootBundle es para poder leer el json

class _MenuProvider{
  List<dynamic> opciones =[];

  _MenuProvider(){
    cargarData();
    
  }

  Future<List<dynamic>> cargarData() async { // cargar data debe esperar a que  el await termine antes de finalizar el constructor

    final resp = await rootBundle.loadString('data/menu_opts.json');

    print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    //print(resp); //json inside

    Map dataMap = json.decode(resp);
      
      opciones=dataMap['rutas'];

      return opciones;
    
      }
}

final menuProvider = new _MenuProvider();