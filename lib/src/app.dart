import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kandidat/src/ui/user_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: Center(
          child: UserList(),
        ),
      ),
    );
  }
}