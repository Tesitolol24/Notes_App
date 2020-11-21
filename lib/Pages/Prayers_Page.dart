import 'package:Notes_App/widgets/prayers_Card_Widget.dart';
import 'package:flutter/material.dart';

class PrayersPage extends StatefulWidget {
  @override
  _PrayersPageState createState() => _PrayersPageState();
}

class _PrayersPageState extends State<PrayersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
         children: [
           ListView(
             children: [
               PrayersCardWidget(titulo: "El único modo de hacer un gran trabajo es amar lo que haces.", autor: "Steve Jobs",),
               PrayersCardWidget(titulo: "Nunca pienso en las consecuencias de fallar un gran tiro… cuando se piensa en las consecuencias se está pensando en un resultado negativo.", autor: "Michael Jordan",),
               PrayersCardWidget(titulo: "El dinero no es la clave del éxito; la libertad para poder crear lo es", autor: "Nelson Mandela",),
               PrayersCardWidget(titulo: "Cuanto más duramente trabajo, más suerte tengo", autor: "Gary Player",),
               PrayersCardWidget(titulo: "La inteligencia consiste no sólo en el conocimiento, sino también en la destreza de aplicar los conocimientos en la práctica ", autor: "Aristóteles",),
               PrayersCardWidget(titulo: "El trabajo duro hace que desaparezcan las arrugas de la mente y el espíritu", autor: "Helena Rubinstein ",),
               PrayersCardWidget(titulo: "Cuando algo es lo suficientemente importante, lo haces incluso si las probabilidades de que salga bien no te acompañan", autor: "Elon Musk",),
               PrayersCardWidget(titulo: "Escoge un trabajo que te guste, y nunca tendrás que trabajar ni un solo día de tu vida ", autor: "Confucio",),
               PrayersCardWidget(titulo: "El esfuerzo de hoy es el éxito del mañana", autor: "Anonimo",),
             ],
           ),
         ],
      ),
    );
  }
  Widget _backGroundPrayers(){
    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              end: FractionalOffset(0.0, 0.5),
              begin: FractionalOffset(0.0, 0.1),
              colors: [
                Colors.white,
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

