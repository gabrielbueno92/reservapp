import 'package:flutter/material.dart';
import 'package:reservapp/src/features/presentation/tabs/explore_tab/view/explore_tab.dart';
import 'package:reservapp/src/features/presentation/tabs/favourite_tab/view/favourite_tab.dart';
import 'package:reservapp/src/features/presentation/tabs/my_reservations_tab/view/my_reservations_tab.dart';
import 'package:reservapp/src/features/presentation/tabs/profile_tab/view/profile_tab.dart';

class TabsPages extends StatefulWidget {
  TabsPages({Key key}) : super(key: key);

  @override
  _TabsPagesState createState() => _TabsPagesState();
}

class _TabsPagesState extends State<TabsPages> {
  List<Widget> _widgetOptions = [
    ExploreTab(),
    MyReservationsTab(),
    FavouriteTab(),
    ProfileTab()
  ];

  int _selectedItemIndex = 0;

  void _changeWidget(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedItemIndex),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30.0,
      selectedItemColor: Theme.of(context).accentColor,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedItemIndex,
      onTap: _changeWidget,
      showUnselectedLabels: true,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explorar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Mis reservas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin),
          label: 'Perfil',
        ),
      ],
    );
  }
}
