import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NTErrorHeader extends StatelessWidget {
  const NTErrorHeader({super.key, required this.text});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: const Color(0xFF590D0D),
          border: Border.all(color: const Color(0xFF9D2121), width: 1),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          const SizedBox(width: 12),
          const Icon(Icons.cancel),
          const SizedBox(width: 10),
          Expanded(child: Text(
            text,
            softWrap: true,
            style: Theme.of(context).textTheme.bodyLarge,
          ))
        ],
      ),
    );
  }
}
