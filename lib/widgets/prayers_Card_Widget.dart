import 'package:flutter/material.dart';

class PrayersCardWidget extends StatelessWidget {
  String titulo;
  String autor;
  PrayersCardWidget({this.titulo,this.autor});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(titulo, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),),
        subtitle: Text(autor, style: TextStyle(fontSize: 12.0, color: Colors.grey),)
      ),
      color: Color.fromRGBO(247, 244, 139, 0.8),
    );
  }
  Widget _backGroundLogin(){
    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              end: FractionalOffset(0.0, 0.5),
              begin: FractionalOffset(0.0, 0.1),
              colors: [
                Color.fromRGBO(93, 44, 166, 1.0),
                Color.fromRGBO(255, 255, 255, 1.0)
              ]
          )
      ),
    );

    return Stack(
      children: [
        gradient
      ],
    );
  }
}

