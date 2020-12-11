import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:reservapp/src/features/presentation/commons_widgets/app_bar_place.dart';
import 'package:reservapp/src/features/presentation/commons_widgets/header_text.dart';
import 'package:reservapp/src/features/provider/add_reservations.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:group_button/group_button.dart';

class PlacePage extends StatefulWidget {
  PlacePage({Key key}) : super(key: key);

  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  CalendarController _calendarController;
  String _amountPeople = resultOfList(amountPeople(), 0);
  String _hour = resultOfList(placeSchedule(), 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _calendarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> place =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        appBarPlace(place['place_name'], place['photo']),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.calendar_today_outlined,
                    color: Theme.of(context).accentColor,
                    size: 30.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 90.0, right: 90.0),
                  child: Icon(
                    Icons.access_time_sharp,
                    color: Theme.of(context).accentColor,
                    size: 30.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.people_outline_rounded,
                    color: Theme.of(context).accentColor,
                    size: 32.0,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Theme.of(context).accentColor,
            indent: 30.0,
            endIndent: 30.0,
          ),
          Center(
              child: headerText(
                  'HACÉ TU RESERVA', Colors.black, FontWeight.bold, 20.0)),
          Padding(padding: EdgeInsets.only(top: 30.0)),
          Center(
              child: headerText('Fecha', Colors.black, FontWeight.bold, 18.0)),
          Column(
            children: [
              TableCalendar(
                locale: 'es',
                startDay: DateTime.now(),
                calendarController: _calendarController,
                initialCalendarFormat: CalendarFormat.week,
                startingDayOfWeek: StartingDayOfWeek.monday,
                formatAnimation: FormatAnimation.slide,
                headerStyle: HeaderStyle(
                    centerHeaderTitle: true,
                    formatButtonVisible: false,
                    leftChevronPadding: EdgeInsets.only(left: 50.0),
                    rightChevronPadding: EdgeInsets.only(right: 50.0)),
                calendarStyle: CalendarStyle(
                    weekendStyle: TextStyle(color: Colors.black),
                    weekdayStyle: TextStyle(color: Colors.black),
                    selectedColor: Colors.red[200],
                    todayColor: Colors.transparent,
                    todayStyle: TextStyle(color: Colors.black)),
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle(color: Colors.grey[600]),
                    weekdayStyle: TextStyle(color: Colors.grey[600])),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Center(
              child: headerText('Hora', Colors.black, FontWeight.bold, 18.0)),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Center(
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 110,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: GroupButton(
                  selectedColor: Colors.red[200],
                  unselectedBorderColor: Colors.grey[300],
                  isRadio: true,
                  spacing: 5,
                  onSelected: (index, isSelected) =>
                      _hour = resultOfList(placeSchedule(), index.toInt()),
                  buttons: placeSchedule(),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          Center(
              child: headerText(
                  'Cantidad de personas', Colors.black, FontWeight.bold, 18.0)),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          Center(
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 110,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: GroupButton(
                  selectedColor: Colors.red[200],
                  unselectedBorderColor: Colors.grey[300],
                  isRadio: true,
                  spacing: 2,
                  onSelected: (index, isSelected) => _amountPeople =
                      resultOfList(amountPeople(), index.toInt()),
                  buttons: amountPeople(),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 50.0, left: 50.0),
            child: RaisedButton(
              onPressed: () {
                addReservation(convertDateTime(_calendarController.selectedDay),
                    _hour, _amountPeople, 'Juan Martinez');
                _showAlertOk(context);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Theme.of(context).accentColor,
              child: Text('Reservar',
                  style: TextStyle(color: Colors.white, fontSize: 17.0)),
            ),
          )
        ])),
      ]),
    );
  }
}

String resultOfList(List list, int i) {
  return list[i];
}

List<String> placeSchedule() {
  return [
    "12:00",
    "12:30",
    "13:00",
    "13:30",
    "14:00",
    "14:30",
    "15:00",
    "15:30",
    "16:00",
    "16:30",
    "17:00",
    "17:30",
    "18:00",
    "18:30",
    "19:00",
    "19:30",
    "20:00",
    "20:30",
    "21:00",
    "21:30",
    "22:00",
    "22:30",
    "23:00",
    "23:30",
    "23:59",
  ];
}

List<String> amountPeople() {
  return [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
  ];
}

String convertDateTime(DateTime date) {
  return "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
}

void _showAlertOk(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: Container(
            height: 250,
            child: Column(
              children: [
                Image(
                  image: AssetImage('images/confirmation.png'),
                  width: 50,
                  height: 50,
                ),
                Container(
                    margin: EdgeInsets.all(15.0),
                    child: headerText('¡Gracias por tu reserva, Juan!',
                        Theme.of(context).primaryColor, FontWeight.bold, 20.0)),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    'En breve recibirás un correo en tu casilla de email con la información de tu reserva.',
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

void _showAlertWarning(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: Container(
            height: 250,
            child: Column(
              children: [
                Image(
                  image: AssetImage('images/images.png'),
                  width: 50,
                  height: 50,
                ),
                Container(
                    margin: EdgeInsets.all(15.0),
                    child: headerText('¡Gracias por tu reserva, Juan!',
                        Theme.of(context).primaryColor, FontWeight.bold, 20.0)),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    'En breve recibirás un correo en tu casilla de email con la información de tu reserva.',
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
    margin: EdgeInsets.only(top: 4.0),
    width: 150.0,
    height: 35.0,
    child: RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/tabs');
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Theme.of(context).accentColor,
      child: Text('Ok', style: TextStyle(color: Colors.white, fontSize: 17.0)),
    ),
  );
}
