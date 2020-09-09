import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
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

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo_demosoft.png',
              width: 250.0,
              //'assets/images/logo-here.png',
              height: 350,
            ),
            inputUsuario(),
            inputClave(),
            bottonLogin(),
          ],
        ),
      ),
    );
  }

  Widget inputUsuario() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      child: TextField(
        //style: TextStyle(color: Colors.red),
        decoration: InputDecoration(
          hintText: "Usuario",
          suffixIcon: Icon(Icons.person),
        ),
        onChanged: (value) {
          setState(() {
            //value tiene el valor del input
          });
        },
      ),
    );
  }

  Widget inputClave() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        obscureText: true,
        //style: TextStyle(color: Colors.red),
        decoration: InputDecoration(
          hintText: "Contraseña",
          suffixIcon: Icon(Icons.lock),
        ),
        onChanged: (value) {
          setState(() {
            //value tiene el valor del input
          });
        },
      ),
    );
  }

  Widget bottonLogin() {
    return RaisedButton(
      child: Text("Iniciar sesión"),
      color: naranja,
      onPressed: _iniciarSesion,
      textColor: Colors.white,
      shape: StadiumBorder(),
    );
  }

  //iniciar Sesion
  void _iniciarSesion() {
    setState(() {
      Navigator.pushNamed(context, "/homePage");
    });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text("Recordar mis datos"),
      value: false,
      onChanged: (value) {
        setState(() {
          //value es el valor del switch
        });
      },
      activeColor: Colors.purple,
    );
  }
}
