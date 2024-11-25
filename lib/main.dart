// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:projeto_findetheecopoint/ecopontos.dart';
import 'package:projeto_findetheecopoint/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'BookMeNow',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.white,

    ),
    home: const EcoPage()
  ));
}

