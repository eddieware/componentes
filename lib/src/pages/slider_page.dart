import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),

      ),
      body: Container(
        padding: EdgeInsets.only(top:50.0),
        child:Column(
          children: <Widget>[
            _crearSlider(),
            Expanded(child: _crearImagen()),
          ],
        )
      ),
      
    );
  }

  Widget _crearSlider(){
    
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'tamaño de la imagen',
      //divisions: 20,// para tener divisiones en el slider
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (valor){
        print(valor);
        
        setState(() {
          _valorSlider=valor;
        });
        

      },
      
    );
  }
  Widget _crearImagen(){
    return Image(
      image: NetworkImage('https://1.bp.blogspot.com/-4Zwhsf3xmo4/XTe_K5QfGAI/AAAAAAAASsU/00z8_GbhNo03FsmarEyJq-rArsM2hczLQCLcBGAs/s2560/next-iron-spider-man-6o-1080x1920.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,

      );
  }
}