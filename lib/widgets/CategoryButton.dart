import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final IconData icon;
  final String category;
  final Function redirect;

  CategoryButton({this.icon, this.category, this.redirect});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RawMaterialButton(
          elevation: 40,
          onPressed: redirect,
          child: Icon(
            icon,
            size: 70,
          ),
          shape: CircleBorder(),
          fillColor: Colors.grey[900],
          padding: EdgeInsets.all(15.0),
        ),
        SizedBox(
          height: 5,
        ),
        Text(category),
      ],
    );
  }
}
