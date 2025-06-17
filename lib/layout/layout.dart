import 'package:flutter/material.dart';

void printText() async {}

class Layout extends StatelessWidget {
  final String title;
  final Widget child;

  const Layout({
      super.key, 
      required this.title, 
      required this.child
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          (title),
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: child,
    );
  }
}
