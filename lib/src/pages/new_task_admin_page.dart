import 'package:flutter/material.dart';
import 'package:front_tareasds/src/utils/my_behavior.dart';

bool brushedTeeth = false; //Estado para en checkbox
bool enableFeature = false; //Estado para en checkbox
int _value = 1;

class NewTaskAdmin extends StatefulWidget {
  @override
  _NewTaskAdmin createState() => _NewTaskAdmin();
}

class _NewTaskAdmin extends State<NewTaskAdmin> {
  get dropdownValue => null;

  set dropdownValue(String dropdownValue) {}

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: setAppBar(),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView(
          children: [
            inputNameTarea(),
            inputDescription(),
            inputList1(),
            inputList2(),
            inputList3(),
            inputObservacion(),
          ],
        ),
      ),
    ));
  }

  Widget setAppBar() {
    return AppBar(
      actions: [
        new IconButton(
          icon: new Icon(Icons.save),
          onPressed: _iniciarSesion,
        ),
        IconButton(
          icon: new Icon(Icons.search),
          onPressed: _iniciarSesion,
        ),
      ],
      leading: Container(),
      title: const Text('Abrir nueva tarea '),
    );
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
          //  'Ingrese una descripcion de su requerimiento.',
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
          // hintText:
          //'Ingrese una descripciín de su requerimiento.',
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

  Widget inputList1() {
    return Container(
        padding: const EdgeInsets.only(left: 30.0, top: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Tipo de tarea:   ",
              style:
                  DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.3),
            ),
            DropdownButton(
                value: _value,
                items: [
                  DropdownMenuItem(
                    child: Text("Soporte"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Cita"),
                    value: 2,
                  ),
                  DropdownMenuItem(child: Text("Correo Electronico"), value: 3),
                  DropdownMenuItem(child: Text("Desarrollo Interno"), value: 4)
                ],
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                }),
          ],
        ));
  }

  Widget inputList2() {
    return Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Nivel de prioridad:   ",
              style:
                  DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.3),
            ),
            DropdownButton(
                value: _value,
                items: [
                  DropdownMenuItem(
                    child: Text("Critico"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Alto"),
                    value: 2,
                  ),
                  DropdownMenuItem(child: Text("Normal"), value: 3),
                  DropdownMenuItem(child: Text("Bajo"), value: 4)
                ],
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                }),
          ],
        ));
  }

  Widget inputList3() {
    return Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Estado:   ",
              style:
                  DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.3),
            ),
            DropdownButton(
                value: _value,
                items: [
                  DropdownMenuItem(
                    child: Text("Activo"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Atrasado"),
                    value: 2,
                  ),
                  DropdownMenuItem(child: Text("Cerrado"), value: 3),
                  DropdownMenuItem(child: Text("Entregado Cliente"), value: 4)
                ],
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                }),
          ],
        ));
  }

  Widget inputObservacion() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          fillColor: Colors.white,
          hoverColor: Colors.black,
          filled: true,
          // hintText:
          //'Ingrese una descripcion de su requerimiento.',
          labelText: 'Comentario',
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

  //iniciar Sesion
  void _iniciarSesion() {
    setState(() {
      Navigator.pushNamed(context, "/homePage");
    });
  }
}
