import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  String descriptionPlace;

  DescriptionWidget(this.descriptionPlace);

  @override
  Widget build(BuildContext context) {
    final description = Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Text(
        descriptionPlace,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        description,
      ],
    );
  }
}
