// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/views/first_page.dart';
import 'package:suitmedia_test/views/second_page.dart';
import 'package:suitmedia_test/views/third_page.dart';
import 'routes/app_routes.dart';

void main() async{
  runApp(GetMaterialApp(
    home: FirstPage(),
    getPages: [
      GetPage(
        name: AppRoutes.first,
        page: () => FirstPage(),
      ),
      GetPage(
        name: AppRoutes.second,
        page: () => SecondPage(),
      ),
      GetPage(
        name: AppRoutes.third,
        page: () => ThirdPage(),
      ),
    ],
    initialRoute: AppRoutes.first,

    ),
  );
}
