import 'package:flutter/material.dart';

class ViewTaskPage extends StatelessWidget {
  const ViewTaskPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tareas"),
      ),
      body: Container(
        child: Center(
          child: Text("Tarea vista"),
        ),
      ),
    );
  }
}
