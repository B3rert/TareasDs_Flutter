import 'package:flutter/material.dart';
import 'package:front_tareasds/src/utils/colors.dart';
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
    return Container(
        /* decoration: BoxDecoration(
       image: DecorationImage(
         image:AssetImage ('assets/images/background_login.jpg'),
         fit: BoxFit.cover
        ),
      ), */
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          setAppBar(),
          DescriptionWidget('Correo Electronico: Probando@hoover.gt.com'),
          DescriptionWidget("Nombre cliente: Usuario Prueba"),
          Divider(),
          inputNameTarea(),
          inputDescription(),
          adjuntarArchivos(),
        ],
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
          labelText: 'Titulo',
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
          labelText: 'Detalle del incidente',
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
        title: const Text("D'MOSOFT, S.A."),
        centerTitle: true,
      ),
    );
  }

  //iniciar Sesion
  void _iniciarSesion() {
    setState(() {
      Navigator.pushNamed(context, "/homePage");
    });
  }

  Widget adjuntarArchivos() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          RaisedButton(
            onPressed: () {},
            color: ColoresPropios.azul,
            textColor: Colors.white,
            child: Text('Examinar',
                style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Ningun archivo adjunto",
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
