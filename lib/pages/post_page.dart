import 'package:flutter/material.dart';
import 'package:nitroport/backend/models.dart';
import 'package:nitroport/colortheme.dart';
import 'package:nitroport/components/post_card.dart';
import 'package:nitroport/pages/home_routes/feed_home_route.dart';
import 'package:nitroport/pages/new_post_page.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.post});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final PostDto post;

  @override
  State<PostPage> createState() => _PostPageState(post: post);
}

class _PostPageState extends State<PostPage> {
  _PostPageState({required this.post});

  PostDto post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Post'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NTPostCard(post: post),
            Text('Answers', textAlign: TextAlign.left, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 10),
            Text('Not implemented yet')
          ],
        ),
      )
    );
  }
}