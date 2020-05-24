import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
//https://www.netflix.com/watch/80185236?trackId=155573560
class _InputPageState extends State<InputPage> {
   String _email='';
  String _nombre='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal:10, vertical:20),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
           Divider(),
          _crearPersona(),
        ],
      ),
      
    );
  }

  Widget _crearInput() {

    return TextField(
      //autofocus: true, este comanando saca el teclado en automatico
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          //personalizar que tan pronunciados quiero los border
          borderRadius: BorderRadius.circular(20)
        ),
        counter: Text('Letras ${_nombre.length} '),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el Nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)


      ),

      onChanged: (valor){
       
        print(_nombre);
        setState(() {
           _nombre = valor;
        });
      } ,
    );
  }

  Widget _crearEmail(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          //personalizar que tan pronunciados quiero los border
          borderRadius: BorderRadius.circular(20)
        ),
    
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)


      ),

      onChanged: (valor)=>setState(() {
           _email = valor;
        })
       ,
    );

  }

  Widget _crearPassword(){
    
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          //personalizar que tan pronunciados quiero los border
          borderRadius: BorderRadius.circular(20)
        ),
    
        hintText: 'Paswword',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)


      ),

      onChanged: (valor)=>setState(() {
           _email = valor;
        })
       ,
    );


  }
// imprime el nombre en pantalla en modo Binding
  Widget _crearPersona(){
    
    return ListTile(
      
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
    );
  }
}