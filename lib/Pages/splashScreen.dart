import 'package:Notes_App/Pages/login_Page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  __SplashScreenState createState() => __SplashScreenState();
}

class __SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 3000),
          () => Navigator.pushReplacement(
        context,
         MaterialPageRoute(
          builder: (context) => Login(),
        ),
      ),
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.deepOrange,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "Images/previewRuthless.png",
                    height: 220,
                    width: 220,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Center(
                    child: Image.asset(
                      "Images/jovenesCreativos.png",
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:40.0),
                  child: Center(
                    child: Image.asset(
                      "Images/Sofka.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
