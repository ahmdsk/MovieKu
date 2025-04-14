import 'package:flutter/material.dart';
import 'package:movieku/app.dart';
import 'package:movieku/utils/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}