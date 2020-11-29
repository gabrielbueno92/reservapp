import 'package:flutter/material.dart';
import 'package:reservapp/src/colors/colors.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:reservapp/src/features/presentation/commons_widgets/header_text.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  _topBar(context),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    alignment: Alignment.centerLeft,
                    child: headerText('Explorar lugares', Colors.black,
                        FontWeight.bold, 30.0),
                  ),
                  _scrollViewPlaces()
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }
}

Widget _topBar(BuildContext context) {
  return Row(
    children: [
      Container(
        width: 310,
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(left: 16.0),
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(234, 236, 239, 1.0)),
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: 20.0,
              color: gris,
            ),
            Container(
              margin: EdgeInsets.only(left: 1.0),
              child: Text(
                'Buscar',
                style: TextStyle(color: gris, fontSize: 17.0),
              ),
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 20.0),
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(
            color: Color.fromRGBO(234, 236, 239, 1.0),
            borderRadius: BorderRadius.circular(30.0)),
        child: IconButton(
          icon: Icon(
            Icons.filter_list,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      )
    ],
  );
}

Widget _scrollViewPlaces() {
  return Container(
      height: 650.0,
      child: Swiper(
        itemCount: 4,
        layout: SwiperLayout.DEFAULT,
        itemBuilder: (BuildContext context, int index) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return _card(context);
              });
        },
      ));
}

Widget _card(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(10.0),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            width: 350.0,
            height: 250.0,
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1567&q=80'),
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10, left: 20.0),
                  child: Text(
                    "Temple Bar",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 135.0),
                  child: Row(
                    children: [
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
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Belgrano 1124",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14.0),
                  ),
                ),
                Icon(Icons.location_on, color: Theme.of(context).accentColor),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(left: 110.0),
                  child: Text(
                    "(140 opiniones)",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
