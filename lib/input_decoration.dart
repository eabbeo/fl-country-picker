import 'package:flutter/material.dart';

InputDecoration inputDeco({
  String? hintText,
  String? labelText,
}) {
  return InputDecoration(
      hintText: hintText,
      prefixIcon: Icon(Icons.email, color: constColour()),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: constColour()),
      ),
      label: Text(
        labelText!,
        style: TextStyle(color: constColour()),
      ));
}

Color constColour() {
  return const Color(0xFFc2284c);
}