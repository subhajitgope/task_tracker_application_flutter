import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_tracker_application_flutter/pages/home_page.dart';


void main() async {
  //initialize the hive
  await Hive.initFlutter();

  //open a box
var box=await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}