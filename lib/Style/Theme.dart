import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color buttonBlack = Color(0xFF3C4954);
  static const Color defaultBlack = Color(0xFF3C4954);
  static const Color borderBlack = Color(0xFFF4F4F6);
  static const Color yellow = Color(0xFFC28E00);
  static const Color green = Color(0xFF7ED321);
  static const Color purple = Color(0xFF6665DD);
  static const Color red = Color(0xFFFF0000);
}

class StringsData {
  StringsData._();

  static const String welcomeString =
      'Protect yourself and others around you by knowing the facts and taking appropriate precautions.';
  static const String welcomeButtonString = 'GET STARTED';
  static const String welcomeTitleString = 'World Stats';

  static const TextStyle boldFont =
      TextStyle(fontSize: 32, fontWeight: FontWeight.w600);

  static const TextStyle semiBoldFont =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
}

class ImageData {
  ImageData._();

  static const String welcomeImage = 'assets/images/person.png';
  static const String wingImage = 'assets/images/header.png';
  static const String menu = 'assets/images/menuIcon.png';
}
