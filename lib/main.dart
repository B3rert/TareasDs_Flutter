import 'package:flutter/material.dart';
import 'package:front_tareasds/src/pages/home_page.dart';
import 'package:front_tareasds/src/pages/login_page.dart';
import 'package:front_tareasds/src/pages/view_tasks.dart';

void main() => runApp(MyApp());

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor naranja = MaterialColor(0xFFDF9623, color);
MaterialColor azul = MaterialColor(0xFF124994, color);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: azul,
      ),
      debugShowCheckedModeBanner: false,
      title: 'TareasDS',
      routes: {
        "/": (context) => LoginPage(), //Ruta a login_page
        "/homePage": (context) => HomePage(),
        "/viewTask": (context) => ViewTaskPage(),
      },
      initialRoute: '/',
    );
  }
}
