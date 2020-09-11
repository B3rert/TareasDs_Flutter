import 'package:flutter/material.dart';

bool brushedTeeth = false; //Estado para en checkbox
bool enableFeature = false; //Estado para en checkbox

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
            Image.asset(
              'assets/images/logo_demosoft.png',
              width: 250.0,
              //'assets/images/logo-here.png',
              height: 350,
            ),
            inputUsuario(),
            inputClave(),
            bottonLogin(),
            _crearSwitch()
          ],
        ),
      ),
    )
    );
  }

  Widget inputUsuario() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      child: TextField(
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
      padding: const EdgeInsets.all(25.0),
      child: TextField(
        obscureText: true,
        //style: TextStyle(color: Colors.black),
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

  //iniciar Sesion
  void _iniciarSesion() {
    setState(() {
      Navigator.pushNamed(context, "/homePage");
    });
  }

  Widget _crearSwitch() {
    return Container(
    padding: const EdgeInsets.only(top: 55),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Switch(
          activeColor: azul,
          inactiveThumbColor: naranja,
          value: brushedTeeth,
          onChanged: (checked) {
            setState(() {
              brushedTeeth = checked;
            });
          },
        ),
        Text('Recordar mis datos', style: Theme.of(context).textTheme.subtitle1),
      ],
    )
    );
  }
}
