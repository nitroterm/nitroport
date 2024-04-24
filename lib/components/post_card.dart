import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nitroport/backend/models.dart';
import 'package:nitroport/backend/nitroback.dart';
import 'package:nitroport/pages/post_page.dart';
import 'package:relative_time/relative_time.dart';

class NTPostCard extends StatefulWidget {
  const NTPostCard({super.key, required this.post});

  final PostDto post;

  @override
  State<StatefulWidget> createState() => _NTPostCardState(post: post);
}

class _NTPostCardState extends State<NTPostCard> {
  _NTPostCardState({required this.post});

  final PostDto post;

  void _nitronize() {
    setState(() {
      post.nitroLevel++;
    });
  }

  void _click() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PostPage(post: Future(() => post))));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _click,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: const Color(0xFF080016),
            border: Border.all(color: const Color(0xFF411A83), width: 1),
            borderRadius: BorderRadius.circular(15)),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      post.creationDate.relativeTimeLocale(const Locale('en'))),
                  Row(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            color: const Color(0xFF080016),
                            borderRadius: BorderRadius.circular(100)),
                        child: Image.network(
                          getProfilePictureUrl(post.sender),
                          height: 40,
                          width: 40,
                          errorBuilder: (ctx, a, b) {
                            return Container(
                              height: 40,
                              width: 40,
                              color: const Color(0xFFF9E900),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.sender.displayName ?? post.sender.username,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text('@${post.sender.username}'),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(post.message,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              )),
              Column(
                children: [
                  IconButton(
                      onPressed: _nitronize,
                      icon: const Icon(
                        Icons.bolt,
                        color: Color(0xFFF9E900),
                      )),
                  Text(post.nitroLevel.toString(),
                      style: TextStyle(color: Color(0xFFF9E900)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
