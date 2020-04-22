import 'package:flutter/material.dart';


class MediumPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /**
      * [PageView] nos permite manipular mediante scroll la transición de una página hacia arriba o hacia abajo. En
      * este caso entre pag1 y pag2.
      */
      
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          pag1(),
          pag2(context)
        ],
      )
    );
  }

  Widget pag1() {
    
    /**
    * [Stack] apila elementos, en los cúales los últimos dan la impresión de estár más cerca.
    * Por tal razón en un stack el orden de los children importa
    */

    return Stack(
      children: <Widget>[
        backgroundColor(),
        backgroundImage(),
        stackText()
      ],
    );
  }
 
  Widget pag2(BuildContext context) {
    
    return Stack(
      children: <Widget>[
        backgroundColor(),
        buttonPage2(context),
      ],
    );
  }

  backgroundColor() {

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(102,192,218,1.0),
    );
  }

  backgroundImage() {

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/original.png'),
        fit: BoxFit.cover, //Imagen se expanda a todas el espacio posible respetando las dimensiones de la imagen
      ),
    );
  }

  stackText() {

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height:35.0),
          Text('11°', style: TextStyle(color: Colors.white, fontSize: 50.0),),
          Text('Miercoles', style: TextStyle(color: Colors.white, fontSize: 50.0),),
          Expanded(child: Container()), //Forma de colocar un divisior que ocupe el espacio de la pantalal; estilo spaceBetween
          Icon(Icons.keyboard_arrow_down,size: 70.0,color: Colors.white)
        ],
      ),
    );
  }

  buttonPage2(BuildContext context) {
    return Center(
      child: RaisedButton(
        shape: StadiumBorder(),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: () => Navigator.pushNamed(context, 'advanced'),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          child: Text(
            'Bienvenido',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
    
  }
}