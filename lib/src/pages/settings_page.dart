import 'package:flutter/material.dart';
import 'package:front_tareasds/src/utils/my_behavior.dart';
import 'package:front_tareasds/src/widgets/description_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  final String _description =
      "En este sitio usted podrá notificar al departamento de soporte de cualquier incidente con BA e interfaces implementadas en su organización por D'MOSOFT. " +
          "Para poder reportar un incidente debe de contar con un usuario proporcionado por el departamento de soporte de D'MOSOFT. Si no cuenta con dicho usuario solicítelo al departamento de soporte.";

  final List<String> _phoneNumber = [
    "+502 2296 6159",
    "+502 2296 6158",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "D'MOSOFT, S.A.",
          style: TextStyle(fontFamily: "Lato"),
        ),
      ),
      body: _info(),
    );
  }

  Widget _info() {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView(
        children: [
          DescriptionWidget(_description),
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Text(
              "Télefonos.",
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF56575a),
              ),
            ),
          ),
          _numberPhonbe(_phoneNumber[0]),
          _numberPhonbe(_phoneNumber[1]),
          closedSession(),
        ],
      ),
    );
  }

  Widget closedSession() {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Container(
        margin: EdgeInsets.only(left: 25.0, right: 25.0),
        height: 47.0,
        width: 180.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: MaterialButton(
          child: Text(
            "Cerrar Sesión",
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _numberPhonbe(String phoneNumber) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      child: MaterialButton(
        onPressed: () {
          launch('tel://$phoneNumber');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              phoneNumber,
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF56575a),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.phone),
            ),
          ],
        ),
      ),
    );
  }
}
