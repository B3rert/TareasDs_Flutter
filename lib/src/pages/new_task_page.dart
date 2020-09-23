import 'package:flutter/material.dart';
// import 'package:front_tareasds/src/utils/colors.dart';

bool brushedTeeth = false; //Estado para en checkbox
bool enableFeature = false; //Estado para en checkbox

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPage createState() => _NewTaskPage();
}

class _NewTaskPage extends State<NewTaskPage> {
  set result(result) {}

  @override
  Widget build(BuildContext context) {
    return Container(
        /* decoration: BoxDecoration(
       image: DecorationImage(
         image:AssetImage ('assets/images/background_login.jpg'),
         fit: BoxFit.cover
        ),
      ), */
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            setAppBar(),
            inputNameTarea(),
            inputDescription(),
          ],
        ),
      ),
    ));
  }

  Widget inputNameTarea() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          fillColor: Colors.white,
          hoverColor: Colors.black,
          filled: true,
          //   hintText:
          //  'Ingrese una descripciín de su requerimiento.',
          labelText: 'Descripción',
        ),
        onChanged: (value) {
          setState(() {
            //value tiene el valor del input
          });
        },
      ),
    );
  }

  Widget inputDescription() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          fillColor: Colors.white,
          hoverColor: Colors.black,
          filled: true,
          hintText: 'Ingrese una descripciín de su requerimiento.',
          labelText: 'Descripción',
        ),
        onChanged: (value) {
          setState(() {
            //value tiene el valor del input
          });
        },
        maxLines: 10,
      ),
    );
  }

  Widget setAppBar() {
    return Container(
      child: AppBar(
        actions: [
          new IconButton(
            icon: new Icon(Icons.send),
            onPressed: _iniciarSesion,
          ),
        ],
        leading: Container(),
        title: const Text('Abrir nueva tarea '),
      ),
    );
  }

  //iniciar Sesion
  void _iniciarSesion() {
    setState(() {
      Navigator.pushNamed(context, "/homePage");
    });
  }
}

class FilePickerResult {}
