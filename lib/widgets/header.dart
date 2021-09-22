import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/pattern-bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      constraints: const BoxConstraints.expand(
        height: 200,
      ),
    );
  }
}
