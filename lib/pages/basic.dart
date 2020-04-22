import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  
  final titleStyles = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold
  );

  final subTitleStyles = TextStyle(
    fontSize: 18.0,
    color: Colors.grey
  );

  @override
  Widget build(BuildContext context) {

    final query = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        //[SingleChild] ordena de manera vertical (pudiendo hacer scroll) el contenido de su hijo
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              image(),
              cardOne(),
              rowSecond(context),
              createText(),
              createText(),
              createText(),
              createText(),
            ],
          )        
        ),
      ),
    );
  }

  Widget image() {
    return Container(
      width: double.infinity, //Tome todo el ancho de la pantalla
      child: Image(
        image: NetworkImage('https://images.unsplash.com/photo-1519302959554-a75be0afc82a?ixlib=rb-1.2.1&w=1000&q=80'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget cardOne() {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Casa amarilla y montañas',style: titleStyles),
                SizedBox(height: 7.0),
                Text('Entre Sombras y montañas',style: subTitleStyles)
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 30.0
          ),
          Text(
            '41',
            style: TextStyle(fontSize: 20.0)
          )
        ],
      ),
    );
  }

  Widget rowSecond(BuildContext context){

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _createActionRow(string:'Call',icon: Icons.call, context: context),
          _createActionRow(string:'Route',icon: Icons.near_me, context: context),
          _createActionRow(string:'Share',icon: Icons.share, context: context),
        ],
      )
    );
  }

  Widget _createActionRow({String string, IconData icon, BuildContext context }){

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'medium'),
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 40.0,
            color: Colors.blue,
          ),
          SizedBox(height:5.0),
          Text(string)
        ],
      ),
    );
  }

  Widget createText(){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
      child: Text(
        'loremipExcepteur non dolor dolor ex consequat nulla ipsum ullamco dolor. Velit et commodo pariatur esse ea fugiat excepteur amet. Enim voluptate nisi veniam mollit elit consequat nulla excepteur excepteur minim tempor. Ea culpa nostrud proident minim ea incididunt qui esse dolore. Sint enim nisi duis eiusmod do anim Lorem ea incididunt ea reprehenderit tempor.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}