import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[

          Container(
             padding:EdgeInsets.all(8.0),
             child: CircleAvatar(
              backgroundImage:NetworkImage('https://www.elsoldeacapulco.com.mx/incoming/wpgvi0-villanos-creados-por-stan-lee.jpg/ALTERNATES/LANDSCAPE_1140/Villanos%20creados%20por%20Stan%20lee.jpg'),
              radius: 20.0,
              
            ),
          ),


          Container(

            margin: EdgeInsets.only(right:10.0),// se uso como padding lateral
            child: CircleAvatar(

              child: Text('SL'),
              backgroundColor: Colors.purple

            ),
          )
        ],
      ),


      body: Center(
        child:FadeInImage(
          image: NetworkImage('https://fotos02.laopiniondemalaga.es/2018/11/24/1024x341/stan-lee.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds:200),
          
        )
      ),
      
    );
  }
}