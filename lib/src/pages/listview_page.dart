import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

//scroll controler es para poder detectar el fin y cargar mas

ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem=0;

  //para iniciar la clase initState y agregar el metodo cargar 10
  @override
  void initState() {
    
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      //se dispara cada que se mueve el scroll
      
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _agregar10();
        
      }

     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body:_crearLista() ,
    );
  }

  Widget _crearLista(){
    return ListView.builder(
      controller: _scrollController, // se asigna para poder mover de posicion
      itemCount: _listaNumeros.length ,
      itemBuilder: (BuildContext context, int index){
        //el index en el xonstructor se agrega porque se requiere
        //la lista numeros se asocia con el index para alojarlos en imagen y pasarlos
        //y pasarlos alinterpolationString

        final imagen = _listaNumeros[index];
       // print(_listaNumeros[index]);
        //print('Here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');

        return FadeInImage(
          
          image: NetworkImage('https://picsum.photos/500/300?image$imagen'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          );
        
      },
      
      );
  }

  //mewtodo para agregar 10 imagenes mas a la lista

  void _agregar10(){

    for (var i = 0; i < 10; i++) {

      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
      
    }

  }
}