import 'package:flutter/material.dart';
import 'package:front_tareasds/src/pages/list_task_page.dart';
import 'package:front_tareasds/src/pages/new_task_admin_page.dart';
import 'package:front_tareasds/src/pages/settings_page.dart';
import 'package:front_tareasds/src/utils/colors.dart';

class HomePageAdmin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageAdmin();
  }
}

class _HomePageAdmin extends State<HomePageAdmin> {
  int indexTap = 0;
  //int admin = 1;

  final List<Widget> widgetsChildren = [
    ListTaskPage(),
    NewTaskAdmin(),
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
        data: Theme.of(context).copyWith(
            canvasColor: Colors.white, primaryColor: ColoresPropios.azul),
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
