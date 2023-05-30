import 'package:flutter/material.dart';
import 'CustomColor.dart';

class CustomStyleButton{
  static InputDecoration textFieldStyle({String labelTextStr="",String hintTextStr=""}) {return InputDecoration(
    labelText: labelTextStr,
    hintText: hintTextStr,
    hintStyle: const TextStyle(color: Colors.black),
    labelStyle: const TextStyle(color: Colors.black),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: CustomColor.redAcent),
        borderRadius: BorderRadius.circular(60)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(60)),
  );}
  static InputDecoration textFieldStyle2({String labelTextStr="",String hintTextStr=""}) {return InputDecoration(
    labelText: labelTextStr,
    hintText: hintTextStr,
    hintStyle: const TextStyle(color: Colors.black),
    labelStyle: const TextStyle(color: Colors.black),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: CustomColor.redAcent),
        borderRadius: BorderRadius.circular(60)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(60)),
  );}
}

