import 'package:flutter/material.dart';

Widget appBarPlace(String title, String photo) {
  return SliverAppBar(
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
    ),
    expandedHeight: 200.0,
    floating: true,
    pinned: true,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.white),
    flexibleSpace: FlexibleSpaceBar(
      background: FadeInImage(
          placeholder: NetworkImage(photo),
          image: NetworkImage(photo),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover),
    ),
  );
}
