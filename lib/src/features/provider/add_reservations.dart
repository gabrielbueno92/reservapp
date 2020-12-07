import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addReservation(
    String date, String hour, String amountPeople) async {
  CollectionReference reservations =
      FirebaseFirestore.instance.collection('reservations');
  reservations
      .add({'date': date, 'hour': hour, 'amount_people': amountPeople})
      .then((value) => print("reservation Added"))
      .catchError((error) => print("Failed to add user: $error"));
  return;
}
