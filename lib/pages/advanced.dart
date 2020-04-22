import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AdvancedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBarStyled(context),
      body: Center(
        child: Stack(
          children: <Widget>[
            background(),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  title(),
                  cards()
                ]
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget background() {

    final background1 = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromRGBO(52, 54, 101, 1.0), Color.fromRGBO(35, 37, 57, 1.0)],
          //Forma compleja = 
          begin: FractionalOffset(0.0,0.6),
          end: FractionalOffset(0.0,1.0)
          //Forma simple =
          // begin: Alignment.topCenter,
          // end: Alignment.bottomCenter
        )
      ),
    );

    //PinkBox background
    final background2 = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
            colors: [Color.fromRGBO(236, 98, 188, 1.0), Color.fromRGBO(241, 142, 172, 1.0)]
          )
        ),
      ),
    );
    
    /**
     * [Positioned] funciona como un tipo de position absolute. Nos posiciona el widget en determina posición en pantalla
     */

    return Stack(
      children: <Widget>[
        background1,
        Positioned(
          top: -100, 
          child: background2
        )
      ],
    );
  }

  Widget title() {

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 30.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            createTitle(string: 'Classify transaction',fontSize: 30.0),
            SizedBox(height:15.0),
            createTitle(string: 'Classify this transaction into a particular category',fontSize: 18.0)
          ],
        ),
      ),
    );
  }

  createTitle({String string, double fontSize}) {

    final textStyle = TextStyle( 
      color: Colors.white,
      fontSize: fontSize,
      fontWeight: FontWeight.bold
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        // color: Colors.white
      ),
      child: Column(
        children: <Widget>[
          Text(
            string,
            style: textStyle,
          )
        ],
      ),
    );
  }

  //Barra sin personalización del color de fondo.
  // Widget bootomBar() {
  //   final hideText = TextStyle(
  //     fontSize: 0.0
  //   );
  //   return BottomNavigationBar(
  //     items: <BottomNavigationBarItem>[
  //       BottomNavigationBarItem(
  //         title: Text('Arriba',style:hideText),
  //         icon: Icon(Icons.calendar_today),
  //       ),
  //       BottomNavigationBarItem(
  //         title: Text('Arriba',style:hideText),
  //         icon: Icon(Icons.pie_chart_outlined),
  //       ),
  //       BottomNavigationBarItem(
  //         title: Text('Arriba',style:hideText),
  //         icon: Icon(Icons.supervised_user_circle),
  //       )
  //     ],
  //   );
  // }

  Widget bottomBarStyled(BuildContext context){

    final hideText = TextStyle(
      fontSize: 0.0
    );

    /**
    * [theme.of(context)] es por ahora una de las formas más sencillas de personalizar el color de la BottomNavigationBar, sin
    * necesidad de cambiar el tema completo de la aplicación
    */

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
          caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0))
        )
      ),
      child:BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('Arriba',style:hideText),
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            title: Text('Arriba',style:hideText),
            icon: Icon(Icons.pie_chart_outlined),
          ),
          BottomNavigationBarItem(
            title: Text('Arriba',style:hideText),
            icon: Icon(Icons.supervised_user_circle),
          )
        ],
      ),
    );
  }

  cards() {
    return Table(
      children:<TableRow>[
        TableRow(
          children: [
            genTableRows(string: 'Secure',icon: Icons.verified_user, color: Colors.pinkAccent),
            genTableRows(string: 'General',icon: Icons.settings, color: Colors.purpleAccent)
          ]
        ),
        TableRow(
          children: [
            genTableRows(string: 'Shopping',icon: Icons.shopping_basket, color: Colors.yellowAccent),
            genTableRows(string: 'Bills',icon: Icons.money_off ,color: Colors.orangeAccent)
          ]
        ),
        TableRow(
          children: [
            genTableRows(string: 'Entertainment',icon: Icons.movie, color: Colors.greenAccent),
            genTableRows(string: 'Grocery',icon: Icons.local_grocery_store, color: Colors.lightBlueAccent)
          ]
        ),
        TableRow(
          children: [
            genTableRows(string: 'Task',icon: Icons.track_changes, color: Colors.redAccent),
            genTableRows(string: 'Monitoring',icon: Icons.my_location, color: Colors.blueAccent)
          ]
        )
      ]
    );
  }

  /*
  *  [clipect]  y [ BackdropFilter] se usan para un efecto de blur en cada tarjeta: El fondo detrás de ellas parece borroso; sin embargo
  * es más costoso a nivel de memoria y no siempre genera un mejor efecto visual. En caso de querer usarse. Se puede poner nuestro widget dentro del
  * siguiente código:
      ClipRect( //Evitar bug en android de que toda la pantalla salga con blur
          child: BackdropFilter( //Permite que lo que se vea detrás dela tarjeta, se vea estilo borroso
            filter: ImageFilter.blur(sigmaX: 1.0,sigmaY: 1.0),
            child:
  */

  genTableRows({String string,IconData icon, Color color}){
    return  Container(
      height: 180.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(62, 66, 107, 0.7),
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: color ,
            radius: 35.0, //Tamaño de la circunferencia del avatar
            child: Icon(icon, color: Colors.white, size:30.0)
          ),
          Text(string, style: TextStyle(color: color)),
        ],
      )
    );
  }    
}

