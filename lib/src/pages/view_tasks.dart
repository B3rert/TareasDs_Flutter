import 'package:flutter/material.dart';
import 'package:front_tareasds/src/utils/colors.dart';
import 'package:front_tareasds/src/utils/my_behavior.dart';

class ViewTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: ColoresPropios.azul,
        title: Text(
          "Tareas",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: _viewSelectTask(),
      ),
    );
  }
}

Widget _viewSelectTask() {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: ListView(
      children: [
        Text("Ticket #01000"),
        Text("Asunto: Tarea Prueba"),
        Text("Ticket Estado: Activo"),
        Text("Departamento: Soporte BA"),
        Text("Creado: 13/01/2020 3:19:00 p.m"),
        Text("Nombre: Prueba"),
        Text("Correo Electronico: Probando@hoover.gt.com"),
        Text("Telefono:"),
        Text("Comentario 0"),
      ],
    ),
  );
}
