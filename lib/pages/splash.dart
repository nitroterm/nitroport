import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nitroport/pages/home_page.dart';
import 'package:nitroport/pages/login_page.dart';
import 'package:nitroport/pages/post_page.dart';

import '../backend/models.dart';
import '../backend/nitroback.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  Future<void> setupFirebaseMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    } else {
      _launchNormally();
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) async {
    if (message.data['type'] == 'post') {
      await _showInitialRoute();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PostPage(post: Future(() async {
                    PostResultDto? post = await nbGetPost(message.data['post']);
                    if (post == null) return null;

                    return post.data;
                  }))));
    }
  }

  Future _showInitialRoute() async {
    if (await nbTryLoadTokenFromSecureStorage()) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MyHomePage(title: 'title')));

      return;
    }

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => LoginPage(title: 'title')));
  }

  void _launchNormally() async {
    await Future.delayed(const Duration(milliseconds: 500));

    _showInitialRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF080016),
      child: const Center(
        child:
            Image(image: AssetImage('assets/nitroterm_logo.png'), height: 80),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    setupFirebaseMessage();
  }
}
