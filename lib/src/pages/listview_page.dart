import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

//scroll controler es para poder detectar el fin y cargar mas

ScrollController _scrollController = new ScrollController();
// el scrolll controller es para monitorear todos los cambios en el scroll

  List<int> _listaNumeros = new List();
  int _ultimoItem=0;
  bool _isloading = false;

  //para iniciar la clase initState y agregar el metodo cargar 10
  @override
  void initState() {
    
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      //se dispara cada que se mueve el scroll
      
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_agregar10();

        fetchData();
        
      }

     });
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body:
      //el loading se creara en esta seccion para que aparesca en cima
      Stack(
        children: <Widget>[
        _crearLista(),
        _crearLoading(),
        ],
      )
      
      
    );
  }

  Widget _crearLista(){
    return RefreshIndicator(

        onRefresh:obtenerPagina1 ,

        child: ListView.builder(
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
        
        ),
    );
  }


  Future<Null> obtenerPagina1() async {

    final duration = new Duration(seconds: 1);
    new Timer (duration,(){

      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();

      

    });

    return Future.delayed(duration);

  }
  //mewtodo para agregar 10 imagenes mas a la lista

  void _agregar10(){

    for (var i = 0; i < 10; i++) {

      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
      //print(' funcion agregar 10');

      setState(() {
        
      });
      
    }

  }

  Future<Null> fetchData() async{

    _isloading = true;

    setState(() {
      
    });
    final duration = new Duration(seconds: 1);
    return new Timer(duration, respuestaHTTP);//no se agregaron los parentesis para que no
    //se ejecute en ese instante solo es la referencia a ese metodo
    
  }

  void respuestaHTTP(){
    //se regresa a false para indicar que ya termino de cargar
    
    setState(() {
      _isloading =false;
    });
    _scrollController.animateTo(
      _scrollController.position.pixels+100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _agregar10();
  }

  Widget _crearLoading(){

    if (_isloading){

      return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,

      children: <Widget>[

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

             CircularProgressIndicator()

          ],
        ),
        SizedBox(height:15.0)

      ],
    );
      

    }else{
      return Container();
    }

    
  }

}