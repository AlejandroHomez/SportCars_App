import 'package:flutter/material.dart';

class  InputDecorations {

  static InputDecoration decorationInput({
    required String hinText,
    required String labelTex,
    IconData? iconData
  }) {

    return InputDecoration(

                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent)
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent, width: 2)
                ),
                hintText: hinText,
                hintStyle: TextStyle(color: Colors.grey),
                labelText: labelTex,
                labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
                prefixIcon: iconData != null 
                ? Icon(iconData, color: Colors.redAccent)
                : null
              );

  }

}