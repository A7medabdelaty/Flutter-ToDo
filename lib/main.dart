import 'package:bloc/bloc.dart';
import 'package:first_project/layout/home_layout.dart';
import 'package:first_project/shared/bloc_observer.dart';
import 'package:flutter/material.dart';

void main() {

  BlocOverrides.runZoned(
        () {
      // Use cubits...
          runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      title: 'TOdoApp',
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}
