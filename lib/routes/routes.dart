import 'package:flutter/material.dart';
import 'package:flutter_designs/pages/advanced.dart';
import 'package:flutter_designs/pages/basic.dart';
import 'package:flutter_designs/pages/medium.dart';

Map<String, WidgetBuilder> routes( BuildContext context){
   
  return{
    '/' : (context) => BasicPage(),
    'medium' : (context) => MediumPage(),
    'advanced' : (context) => AdvancedPage(),
  };
}