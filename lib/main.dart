import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_designs/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    //Cambiar color de los elementos de la barra de sistema del dispostivo
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: '/',
      routes: routes(context) ,
    );
  }
}