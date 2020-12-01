import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _PlacesProvider {
  List<dynamic> places = [];

  Future<List<dynamic>> loadPlaces() async {
    final resp =
        await rootBundle.loadString('lib/src/features/data/places.json');
    Map<String, dynamic> placesMap = json.decode(resp);
    places = placesMap['places'];
    return places;
  }
}

final placesProvider = _PlacesProvider();
