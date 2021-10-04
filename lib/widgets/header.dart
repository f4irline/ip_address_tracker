import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

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
