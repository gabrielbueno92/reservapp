import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reservapp/src/routes/routes.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white));
    return Scaffold(
        body: Stack(
      children: [
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                'HACE TU RESERVA EN TU LUGAR FAVORITO',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 45.0),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
              child: Text(
                'Elegí entre miles de bares y restaurantes de la ciudad, sin perder tiempo.',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 17.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100.0),
              width: 350.0,
              height: 45.0,
              child: RaisedButton(
                onPressed: () {
                  // Navigate to the second screen using a named route.
                  Navigator.pushNamed(context, '/login');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Theme.of(context).accentColor,
                child: Text('Ingresar',
                    style: TextStyle(color: Colors.white, fontSize: 15.0)),
              ),
            ),
            Container(
              width: 350.0,
              height: 45.0,
              margin: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Theme.of(context).buttonColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('images/facebook-icon.jpg'),
                      width: 30.0,
                      height: 30.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Conectar con facebook',
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
