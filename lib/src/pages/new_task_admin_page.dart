import 'package:flutter/material.dart';

bool brushedTeeth = false; //Estado para en checkbox
bool enableFeature = false; //Estado para en checkbox
int _value = 1;

class NewTaskAdmin extends StatefulWidget {
  @override
  _NewTaskAdmin createState() => _NewTaskAdmin();
}

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

class _NewTaskAdmin extends State<NewTaskAdmin> {
  get dropdownValue => null;

  set dropdownValue(String dropdownValue) {}

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background_login.jpg'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    setAppBar(),
                    inputNameTarea(),
                    inputDescription(),
                    inputList1(),
                    inputList2(),
                    inputList3(),
                    inputObservacion(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget setAppBar() {
    return Container(
      child: AppBar(
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
      ),
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
