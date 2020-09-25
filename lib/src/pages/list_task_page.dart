import 'package:flutter/material.dart';
import 'package:front_tareasds/src/providers/list_provider.dart';
import 'package:front_tareasds/src/utils/colors.dart';
import 'package:front_tareasds/src/utils/constants.dart';
import 'package:front_tareasds/src/utils/my_behavior.dart';

//No sé si se ve lo que hago?

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
        backgroundColor: ColoresPropios.azul,
        leading: Container(),
        title: _filtrosBar(),
        centerTitle: true,
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
        ],
      ),
      body: ScrollConfiguration(behavior: MyBehavior(), child: _lista()),
    );
  }

  Widget _filtrosBar() {
    return MaterialButton(
      child: Row(
        children: [
          Text(
            _tituloBar,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: "Lato",
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 5.0),
            child: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ),
        ],
      ),
      onPressed: () => _filtroTareas(context),
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
                  style: TextStyle(fontFamily: "Lato"),
                ),
              ),
              Row(
                children: [
                  Text(
                    element['ID_tarea'],
                    style: TextStyle(fontFamily: "Lato"),
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
          color: ColoresPropios.azul,
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

  void _filtroTareas(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                child: Text(
                  Constants.Activo,
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: _activo,
              ),
              Divider(),
              MaterialButton(
                child: Text(
                  Constants.Cerrado,
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: _cerrado,
              ),
              Divider(),
              MaterialButton(
                child: Text(
                  Constants.Todos,
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: _todos,
              )
            ],
          ),
        );
      },
    );
  }

  void _activo() {
    setState(() {
      _tituloBar = Constants.Activo;
      Navigator.of(context).pop();
    });
  }

  void _cerrado() {
    setState(() {
      _tituloBar = Constants.Cerrado;
      Navigator.of(context).pop();
    });
  }

  void _todos() {
    setState(() {
      _tituloBar = Constants.Todos;
      Navigator.of(context).pop();
    });
  }
}
