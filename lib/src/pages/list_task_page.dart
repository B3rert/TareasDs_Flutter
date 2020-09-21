import 'package:flutter/material.dart';
import 'package:front_tareasds/src/pages/view_tasks.dart';
import 'package:front_tareasds/src/providers/list_provider.dart';
import 'package:front_tareasds/src/utils/constants.dart';

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
MaterialColor azulPalido = MaterialColor(0xFF567aab, color);
MaterialColor naranjaPalido = MaterialColor(0xFFde9f3e, color);

String _tituloBar = "Todos los estados";

class ListTaskPage extends StatefulWidget {
  @override
  _ListTaskPageState createState() => _ListTaskPageState();
}

class _ListTaskPageState extends State<ListTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: azul,
        leading: Container(),
        title: Text(
          _tituloBar,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            color: Colors.white,
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    choice,
                    style: TextStyle(color: azul),
                  ),
                );
              }).toList();
            },
          )
        ],
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: FutureBuilder(
        future: tareasProvider.cargarData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            children: _listaitems(snapshot.data, context),
          );
        },
      ),
    );
  }

  List<Widget> _listaitems(List<dynamic> data, BuildContext context) {
    final List<Widget> tareas = [];

    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  element['Titulo'],
                ),
              ),
              Row(
                children: [
                  Text(
                    element['ID_tarea'],
                  ),
                  Text(
                    " - ",
                  ),
                  Text(
                    element['Estado'],
                  ),
                ],
              ),
            ],
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: azul,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            element['Fecha'],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, "/viewTask");
          /*  Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ViewTaskPage())); */
        },
      );

      tareas..add(widgetTemp)..add(Divider());
    });
    return tareas;
  }

  void choiceAction(String choice) {
    if (choice == Constants.Cerrado) {
      setState(() {
        _tituloBar = "Cerrado";
      });
    } else if (choice == Constants.Activo) {
      setState(() {
        _tituloBar = "Activo";
      });
    } else if (choice == Constants.Todos) {
      setState(() {
        _tituloBar = "Todos los estados";
      });
    }
  }
}
