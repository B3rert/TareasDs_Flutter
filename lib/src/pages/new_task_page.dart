import 'package:flutter/material.dart';

bool brushedTeeth = false; //Estado para en checkbox
bool enableFeature = false; //Estado para en checkbox

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPage createState() => _NewTaskPage();
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

class _NewTaskPage extends State<NewTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       image: DecorationImage(
         image:AssetImage ('assets/images/background_login.jpg'),
         fit: BoxFit.cover
        ),
      ),
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
    )
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
                            hintText:
                            'Ingrese una descripciín de su requerimiento.',
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

  Widget bottonLogin() {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      height: 55.0,
      width: 360.0,
      child: new RaisedButton(
        child: new Text('Iniciar Sesión'),
        onPressed: _iniciarSesion,
        textColor: Colors.white,
        color: naranja,
        shape: StadiumBorder(),
      ),
    );
  }

   Widget setAppBar() {
    return Container(
    child:  AppBar(
      actions: [new IconButton(
          icon: new Icon(Icons.save),
          onPressed: _iniciarSesion,
        ),],
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


