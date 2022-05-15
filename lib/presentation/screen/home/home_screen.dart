
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeApp2 extends StatefulWidget {
  const HomeApp2({Key? key}) : super(key: key);

  @override
  _HomeApp2State createState() => _HomeApp2State();
}

class _HomeApp2State extends State<HomeApp2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
      ),
    );
  }
}
