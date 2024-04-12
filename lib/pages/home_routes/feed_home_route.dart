import 'package:flutter/material.dart';
import 'package:nitroport/colortheme.dart';

class FeedHomeRoute extends StatefulWidget {
  const FeedHomeRoute({super.key});

  @override
  State<FeedHomeRoute> createState() => _FeedHomeRouteState();
}

class _FeedHomeRouteState extends State<FeedHomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'The social network is there',
          )
        ],
      ),
    );
  }
}