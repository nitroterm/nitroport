import 'package:flutter/material.dart';
import 'package:nitroport/backend/nitroback.dart';
import 'package:nitroport/colortheme.dart';
import 'package:nitroport/components/post_card.dart';

import '../../backend/models.dart';

class FeedHomeRoute extends StatefulWidget {
  const FeedHomeRoute({super.key});

  @override
  State<FeedHomeRoute> createState() => _FeedHomeRouteState();
}

class _FeedHomeRouteState extends State<FeedHomeRoute> {
  late Future<FeedResultDto?> _feedFuture;

  @override
  void initState() {
    super.initState();

    _feedFuture = nbGetFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: FutureBuilder(future: _feedFuture, builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Column(
              children: [
                for (PostDto post in snapshot.data!.data!)
                  NTPostCard(post: post)
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return Container(
            margin: const EdgeInsets.only(top: 10),
            child: const Center(child: CircularProgressIndicator()));
      }),
    );
  }
}