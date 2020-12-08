import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addReservation(String date, String hour, String amountPeople,
    String clientFullName) async {
  CollectionReference reservations =
      FirebaseFirestore.instance.collection('reservations');
  reservations
      .add({
        'date': date,
        'hour': hour,
        'amount_people': amountPeople,
        'client_full_name': clientFullName
      })
      .then((value) => print("reservation Added"))
      .catchError((error) => print("Failed to add user: $error"));
  return;
}
