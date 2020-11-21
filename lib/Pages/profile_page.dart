import 'dart:ui';
import 'package:Notes_App/Pages/login_Page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            _backGroundProfile(),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:75.0),
                      child: CircleAvatar(
                        radius: 50,
                        child: Icon(Icons.account_circle,size: 100.0,color: Colors.grey,),
                        backgroundColor: Colors.black,
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 75.0),
                    child: Text("Create by: Juan Pablo Mesa", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:100.0),
                    child: RaisedButton(
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => Login())
                          );
                        },
                        child: Text("Cerrar Sección", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                        color: Color.fromRGBO(136, 106, 220, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _backGroundProfile() {
    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              end: FractionalOffset(0.0, 0.5),
              begin: FractionalOffset(0.0, 0.1),
              colors: [
                Color.fromRGBO(115, 115, 115, 0.5),
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