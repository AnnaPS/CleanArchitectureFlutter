import 'package:clean_architecture_app/di/injector.dart';
import 'package:clean_architecture_app/presentation/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  //Add GetIt injector to main file
  setUp();
  runApp(MyApp());
}
