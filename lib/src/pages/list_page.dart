import 'package:flutter/material.dart';
import 'package:front_tareasds/src/providers/list_provider.dart';

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

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: tareasProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaitems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaitems(List<dynamic> data, BuildContext context) {
    final List<Widget> tareas = [];

    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Text(element['ID_tarea']),
              Text(" - "),
              Text(element['Estado']),
            ],
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: naranja,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(element['Titulo']),
        ),
        /*  leading: Padding(
          padding: const EdgeInsets.only(top: 7.0, left: 15.0),
          child: Icon(
            Icons.fiber_manual_record,
            color: Colors.red,
            size: 22.0,
          ),
        ), */
        onTap: () {
          Navigator.pushNamed(context, "/viewTask");
        },
      );

      tareas..add(widgetTemp)..add(Divider());
    });
    return tareas;
  }
}
