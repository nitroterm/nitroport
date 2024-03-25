import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NTButton extends StatelessWidget {
  const NTButton({super.key, required this.text, required this.onTap});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: const Color(0xFF290D59),
              border: Border.all(color: const Color(0xFF411A83), width: 2),
              borderRadius: BorderRadius.circular(4)),
          child: Center(
              child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          )),
        ));
  }
}
