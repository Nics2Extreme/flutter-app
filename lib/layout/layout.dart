import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        // actions: [
        //   GestureDetector(
        //     onTap: () {
        //       printText(); // Outputs "Hello, Flutter!" to the console
        //     },
        //     child: Container(
        //       margin: EdgeInsets.all(10),
        //       alignment: Alignment.center,
        //       width: 37,
        //       decoration: BoxDecoration(
        //         color: Color(0xffF7F8F8),
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       child: SvgPicture.asset(
        //         'assets/icons/dots-horizontal.svg',
        //         height: 20,
        //         width: 20,
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: child,
    );
  }
}
