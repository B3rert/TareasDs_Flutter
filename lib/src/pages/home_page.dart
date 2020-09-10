import 'package:flutter/material.dart';
import 'package:front_tareasds/src/pages/list_task_page.dart';
import 'package:front_tareasds/src/pages/new_task_page.dart';
import 'package:front_tareasds/src/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

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

class _HomePage extends State<HomePage> {
  int indexTap = 0;

  final List<Widget> widgetsChildren = [
    ListTaskPage(),
    NewTaskPage(),
    SettingsPage(),
  ];

  void onTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.white, primaryColor: azul),
        child: BottomNavigationBar(
          onTap: onTapped,
          currentIndex: indexTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.clear_all,
              ),
              title: Text(
                "Tickets",
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
              ),
              title: Text(
                "Nuevo Ticket",
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.phone_forwarded,
              ),
              title: Text("Soporte"),
            )
          ],
        ),
      ),
    );
  }
}
