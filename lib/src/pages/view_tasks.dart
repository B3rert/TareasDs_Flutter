import 'package:flutter/material.dart';

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

class ViewTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: azul,
        title: Text(
          "Tareas",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _viewSelectTask(),
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
