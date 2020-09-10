import 'dart:convert';
import 'package:flutter/services.dart';

class _ListProvider {
  List<dynamic> tareas = [];

  _ListProvider() {
    //
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString("data/data.json");
    Map dataMap = json.decode(resp);
    tareas = dataMap['Tareas'];

    return tareas;
  }
}

final tareasProvider = new _ListProvider();
