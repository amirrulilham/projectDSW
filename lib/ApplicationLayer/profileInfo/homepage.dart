import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //root of the application
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightGreen,
              title: const Center(child: Text('Covid HealthCare')),
            ),
            body: const Text('helo')));
  }
}
