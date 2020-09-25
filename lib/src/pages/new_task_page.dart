import 'package:flutter/material.dart';
import 'package:front_tareasds/src/utils/colors.dart';
import 'package:front_tareasds/src/utils/my_behavior.dart';
import 'package:front_tareasds/src/widgets/description_widget.dart';
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
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
        ],
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(
            top: 55.0,
            left: 20.0,
          ),
          child: Text(
            "Abrir un nuevo Ticket",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Lato",
              fontSize: 21.5,
            ),
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView(
          children: [
            DescriptionWidget('Correo Electronico: Probando@hoover.gt.com'),
            DescriptionWidget("Nombre cliente: Usuario Prueba"),
            Divider(),
            inputNameTarea(),
            inputDescription(),
            adjuntarArchivos(),
          ],
        ),
      ),
    );
  }

  Widget enviarTarea() {
    return MaterialButton(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                "Crear Ticket",
                style: TextStyle(
                    fontFamily: "Lato", color: Colors.white, fontSize: 20.5),
              ),
            ),
            Icon(
              Icons.send,
              color: Colors.white,
            ),
          ],
        ),
        onPressed: () {});
  }

  Widget inputNameTarea() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          fillColor: Colors.white,
          hoverColor: Colors.black,
          filled: true,
          //   hintText:
          //  'Ingrese una descripciín de su requerimiento.',
          labelText: 'Titulo *',
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
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: 'Detalle del incidente *',
        ),
        onChanged: (value) {
          setState(() {
            //value tiene el valor del input
          });
        },
        maxLines: 5,
      ),
    );
  }

  Widget adjuntarArchivos() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              "Ningun archivo adjunto",
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 15.0,
                  fontWeight: FontWeight.w100),
            ),
          ),
          RaisedButton(
            onPressed: () {},
            color: ColoresPropios.azul,
            textColor: Colors.white,
            child: Text('Examinar',
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 17.0,
                )),
          ),
        ],
      ),
    );
  }
}
