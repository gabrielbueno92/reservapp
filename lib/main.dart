import 'package:flutter/material.dart';

import 'package:reservapp/src/features/presentation/forgot_password_page/view/forgot_password_page.dart';
import 'package:reservapp/src/features/presentation/login_page/view/login_page.dart';
import 'package:reservapp/src/features/presentation/sign_up_page/view/sign_up_page.dart';
import 'package:reservapp/src/features/presentation/welcome_page/view/welcome_page.dart';
import 'package:reservapp/src/features/presentation/tabs/tabs_page.dart';

//routes

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/login': (context) => LoginPage(),
        '/forgot-password': (context) => ForgotPasswordPage(),
        '/sign-up': (context) => SignUpPage(),
        '/tabs': (context) => TabsPages()
      },
      theme: ThemeData(
          accentColor: Color.fromRGBO(229, 46, 46, 1.0),
          primaryColor: Color.fromRGBO(10, 31, 68, 1.0),
          buttonColor: Color.fromRGBO(0, 122, 255, 1.0),
          disabledColor: Color.fromRGBO(142, 142, 147, 1.2),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:
              AppBarTheme(iconTheme: IconThemeData(color: Colors.black))),
    );
  }
}
