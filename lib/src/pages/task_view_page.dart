import 'package:flutter/material.dart';
import 'package:front_tareasds/src/utils/colors.dart';
import 'package:front_tareasds/src/utils/my_behavior.dart';

final List<String> content = [
  "Ticket: #4798897",
  "Asunto: Tarea Prueba",
  "Ticket Estado: Activo",
  "Departamento: Soporte BA",
  "Creado: 13/01/2020 3:19:00 p.m",
  "Nombre: Usuario Prueba",
  "Correo Electronico: Probando@hoover.gt.com",
  "Telefono:",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
  "usuario prueba",
  "08/01/2020 12:40:06 p.m.",
  "87498sadasdiujh.pdf",
];

String vistaComentario = "Ultimo comentario";
int _value = 1;

class TaskViewPage extends StatefulWidget {
  TaskViewPage({Key key}) : super(key: key);

  @override
  _TaskViewPageState createState() => _TaskViewPageState();
}

class _TaskViewPageState extends State<TaskViewPage> {
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

  Widget _viewSelectTask() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ListView(
        children: [
          mostrarTexto(content[0]),
          mostrarTexto(content[1]),
          Divider(),
          mostrarTextoNormal(content[2]),
          mostrarTextoNormal(content[5]),
          mostrarTextoNormal(content[3]),
          mostrarTextoNormal(content[6]),
          mostrarTextoNormal(content[7]),
          mostrarTextoNormal(content[4]),
          Divider(),
          mostrarComentarios(),
          mostrarTextoPeque(content[12]),
          mostrarTextoPeque(content[11]),
          mostrarTextoNormal(content[8]),
          archivosAdjuntos(content[13]),
        ],
      ),
    );
  }

  Widget mostrarComentarios() {
    return Align(
      alignment: Alignment.bottomRight,
      child: DropdownButton(
          value: _value,
          items: [
            DropdownMenuItem(
              child: Text("Último comentario"),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text("Todos los cometarios"),
              value: 2,
            ),
          ],
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          }),
    );
  }

  Widget archivosAdjuntos(String nombreArchivo) {
    return MaterialButton(
      child: Row(
        children: [
          Icon(
            Icons.insert_drive_file,
            color: Colors.black54,
          ),
          mostrarTextoPalido(nombreArchivo),
        ],
      ),
      onPressed: () {},
    );
  }

  Widget mostrarTextoNormal(String texto) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 5.0),
      child: Text(
        texto,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 18.0, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget mostrarTexto(String texto) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 5.0),
      child: Text(
        texto,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 20.0, fontWeight: FontWeight.w900),
      ),
    );
  }

  Widget mostrarTextoPeque(String texto) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 5.0),
      child: Text(
        texto,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 17.0, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget mostrarTextoPalido(String texto) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 5.0),
      child: Text(
        texto,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 17.0, color: Colors.black54),
      ),
    );
  }
}
