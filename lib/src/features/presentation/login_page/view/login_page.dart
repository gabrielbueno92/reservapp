import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:reservapp/src/colors/colors.dart';
import 'package:reservapp/src/features/presentation/commons_widgets/back_button.dart';
import 'package:reservapp/src/features/presentation/commons_widgets/header_text.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.black));

    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/welcome.jpg'),
          )),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50.0, right: 50.0),
                  child: backButton(context, Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.0, left: 5.0),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        children: [
                          headerText(
                              "Bienvenido", Colors.white, FontWeight.bold, 30.0)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Center(
              child: Column(
                children: [
                  Text("Ingresá a tu cuenta",
                      style: TextStyle(
                          color: gris,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0)),
                  _emailInput(),
                  _passwordInput(),
                  _loginButton(context),
                  Container(
                      margin: EdgeInsets.only(top: 90.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/forgot-password');
                        },
                        child: Text('¿Olvidaste tu contraseña?',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.0)),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('¿Aún no tienes una cuenta?',
                              style: TextStyle(
                                  color: gris,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0)),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/sign-up');
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text('Registrate',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.0)),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}

Widget _emailInput() {
  return Container(
    margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 100.0, bottom: 10.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(30.0)),
    child: TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _passwordInput() {
  return Container(
    margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(30.0)),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Contraseña',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _loginButton(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 100.0),
    width: 350.0,
    height: 45.0,
    child: RaisedButton(
      onPressed: () {
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/tabs');
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Theme.of(context).accentColor,
      child: Text('Ingresar',
          style: TextStyle(color: Colors.white, fontSize: 17.0)),
    ),
  );
}
