import 'package:flutter/material.dart';
import 'package:front_tareasds/src/pages/file_picker_page.dart';
import 'package:front_tareasds/src/pages/login_page.dart';
import 'package:front_tareasds/src/pages/task_view_page.dart';
import 'package:front_tareasds/src/utils/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: ColoresPropios.azul,
      ),
      debugShowCheckedModeBanner: false,
      title: 'TareasDS',
      routes: {
        "/": (context) => FilePickerPage(), //LoginPage(), //Ruta a login_page
        //"/homePage": (context) => HomePage(),
        "/viewTask": (context) => TaskViewPage(),
      },
      initialRoute: '/',
    );
  }
}
