import 'package:flutter/material.dart';
import 'package:reservapp/src/colors/colors.dart';

List<Widget> placesList(BuildContext context, List<dynamic> places) {
  final List<Widget> listPlaces = [];
  places.forEach((place) {
    final widgetListProvisional = _scrollViewPlaces(context, place);
    listPlaces.add(widgetListProvisional);
  });
  return listPlaces;
}

Widget _scrollViewPlaces(BuildContext context, Map<String, dynamic> place) {
  return Column(children: <Widget>[
    GestureDetector(
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            image: NetworkImage(
              place['photo'],
            ),
            width: 350.0,
            height: 250.0,
            fit: BoxFit.cover,
          ),
        )),
    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              child: SizedBox(
                width: 150.0,
                height: 20.0,
                child: Text(
                  place['place_name'],
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2.0),
              child: SizedBox(
                  width: 150.0,
                  height: 20.0,
                  child: Row(
                    children: [
                      Text(
                        place['address'],
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 14.0),
                      ),
                      Icon(Icons.location_on,
                          color: Theme.of(context).accentColor)
                    ],
                  )),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0))
          ],
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 55.0),
              child: SizedBox(
                  width: 100.0,
                  height: 20.0,
                  child: Row(children: [
                    Icon(
                      Icons.star,
                      color: amarillo,
                      size: 20.0,
                    ),
                    Icon(
                      Icons.star,
                      color: amarillo,
                      size: 20.0,
                    ),
                    Icon(
                      Icons.star,
                      color: amarillo,
                      size: 20.0,
                    ),
                    Icon(
                      Icons.star,
                      color: amarillo,
                      size: 20.0,
                    ),
                    Icon(
                      Icons.star,
                      color: gris,
                      size: 20.0,
                    )
                  ])),
            ),
            Container(
              margin: EdgeInsets.only(left: 75.0, top: 2.0),
              child: SizedBox(
                  width: 100.0,
                  height: 20.0,
                  child: Text(
                    place['total_ratings'].toString() + " opiniones",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14.0),
                  )),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0))
          ],
        )
      ],
    )
  ]);
}
