import 'package:flutter/material.dart';
import 'package:reservapp/src/widgets/back_button.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Builder(
            builder: (BuildContext context) {
              return backButton(context, Colors.black);
            },
          ),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                Text("Olvidé mi contraseña",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0)),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      "Por favor, ingresá tu email. Recibirás un enlace para crear una nueva contraseña.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0)),
                ),
                _emailInput(),
                _sendEmailButton(context)
              ],
            ),
          ),
        ));
  }
}

Widget _emailInput() {
  return Container(
    margin: EdgeInsets.only(top: 40.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _sendEmailButton(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 50.0),
    width: 350.0,
    height: 45.0,
    child: RaisedButton(
      onPressed: () {
        _showAlert(context);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Theme.of(context).accentColor,
      child:
          Text('Enviar', style: TextStyle(color: Colors.white, fontSize: 17.0)),
    ),
  );
}

void _showAlert(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: Container(
            height: 450,
            child: Column(
              children: [
                Image(
                  image: AssetImage('images/reset_pass.png'),
                  width: 130,
                  height: 130,
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Text(
                    'Tu contraseña ha sido restablecida',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    'A la brevedad recibirás un email con un código para establecer una nueva contraseña',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0),
                  ),
                ),
                _doneButton(context)
              ],
            ),
          ),
        );
      });
}

Widget _doneButton(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 100.0),
    width: 350.0,
    height: 45.0,
    child: RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Theme.of(context).accentColor,
      child: Text('Entenedido',
          style: TextStyle(color: Colors.white, fontSize: 17.0)),
    ),
  );
}
