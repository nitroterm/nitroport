import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nitroport/backend/models.dart';
import 'package:relative_time/relative_time.dart';

class NTPostCard extends StatelessWidget {
  const NTPostCard({super.key, required this.post});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final PostDto post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: const Color(0xFF080016),
          border: Border.all(color: const Color(0xFF411A83), width: 1),
          borderRadius: BorderRadius.circular(15)),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.creationDate.relativeTimeLocale(const Locale('en'))),
            Row(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: const Color(0xFF080016),
                      borderRadius: BorderRadius.circular(100)),
                  child: Image(image: AssetImage('assets/samples/profile_picture.jpg'), height: 40),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.sender.displayName ?? post.sender.username, style: Theme.of(context).textTheme.titleMedium,),
                    Text('@${post.sender.username}'),
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            Text(post.message, softWrap: true, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
