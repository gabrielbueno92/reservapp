import 'package:flutter/material.dart';

class MyReservationsTab extends StatefulWidget {
  MyReservationsTab({Key key}) : super(key: key);

  @override
  _MyReservationsTabState createState() => _MyReservationsTabState();
}

class _MyReservationsTabState extends State<MyReservationsTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Mis reservas'),
    );
  }
}
