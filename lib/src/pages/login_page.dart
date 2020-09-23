import 'package:flutter/material.dart';
import 'package:front_tareasds/src/pages/home_page.dart';
import 'package:front_tareasds/src/utils/colors.dart';
import 'package:front_tareasds/src/utils/my_behavior.dart';

bool brushedTeeth = false; //Estado switch
bool userAdmin = false;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/fondologin.jpg'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              children: [
                Center(
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
              ],
            ),
          ),
        ));
  }

  Widget inputUsuario() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Usuario",
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
          labelText: "Contraseña",
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
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      child: Container(
        height: 50.0,
        width: 365.0,
        child: new RaisedButton(
          child: new Text('Iniciar Sesión'),
          onPressed: _iniciarSesion,
          textColor: Colors.white,
          color: ColoresPropios.azul,
          shape: StadiumBorder(),
        ),
      ),
    );
  }

  //iniciar Sesion
  void _iniciarSesion() {
    setState(() {
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) => new HomePage(userAdmin: userAdmin),
        ),
      );
      //Navigator.pushNamed(context, "/homePage");
    });
  }

  Widget _crearSwitch() {
    return Container(
      padding: const EdgeInsets.only(top: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Recordar mis datos',
              style: Theme.of(context).textTheme.subtitle1),
          Switch(
            activeColor: ColoresPropios.azul,
            inactiveThumbColor: ColoresPropios.azul,
            value: brushedTeeth,
            onChanged: (checked) {
              setState(() {
                brushedTeeth = checked;
              });
            },
          ),
        ],
      ),
    );
  }
}
