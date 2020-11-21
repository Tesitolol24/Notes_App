import 'package:Notes_App/Pages/Notes_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            _backGroundLogin(),
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Image.asset(
                    "Images/previewRuthless.png",
                    width: 250,
                    height: 250,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, right: 20.0, left: 20.0),
                  child: TextField(
                    cursorColor: Colors.black,
                    controller: _userController,
                      keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromRGBO(93, 44, 166, 1.0),
                        )),
                        hintText: "Usuario"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, right: 20.0, left: 20.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.visibility),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromRGBO(93, 44, 166, 1.0),
                      )),
                      hintText: "Contraseña",
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, right: 30.0, left: 30.0),
                  child: RaisedButton(
                      onPressed: () {
                        _checkUserAndPassword();
                      },
                      child: Text(
                        "Iniciar Sección",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      color: Color.fromRGBO(136, 106, 220, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _checkUserAndPassword() {
   var user = _userController.text;
   var password = _passwordController.text;
   if(user == "PabloM" && password == "12345"){
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (BuildContext context) => NotesPage()));
   }else{
     showDialog(
       context: context,
       builder: (context){
         return AlertDialog(
           title: Text("Icorrecto, intentalo de nuevo"),
           actions: [
             FlatButton(
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
               },
               child: Text("Aceptar"),
             )
           ],
         );
       }
     );
   }
  }

  Widget _backGroundLogin() {
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
          ])),
    );

    return Stack(
      children: [gradient],
    );
  }
}
