import 'package:flutter/material.dart';
import 'package:reservapp/src/colors/colors.dart';
import 'package:reservapp/src/features/presentation/commons_widgets/header_text.dart';
import 'package:reservapp/src/features/presentation/tabs/explore_tab/viewModel/places_list.dart';
import 'package:reservapp/src/features/provider/places_provider.dart';

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
                  FutureBuilder(
                      future: placesProvider.loadPlaces(),
                      initialData: [],
                      builder: (BuildContext context,
                          AsyncSnapshot<List<dynamic>> snapshot) {
                        return Column(
                          children: placesList(context, snapshot.data),
                        );
                      }),
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
