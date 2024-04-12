import 'package:flutter/material.dart';
import 'package:nitroport/backend/models.dart';
import 'package:nitroport/backend/nitroback.dart';
import 'package:nitroport/colortheme.dart';
import 'package:nitroport/pages/home_routes/feed_home_route.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final _currentPageIndex = 0;
  final _messageInputController = TextEditingController();

  void _sendPost() async {
    String text = _messageInputController.text;

    PostResultDto? result = await nbPostMessage(text);
    if (!result!.success) {
      print(result.message);
      return;
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Write something'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: const Color(0xFF080016),
                  border: Border.all(color: const Color(0xFF411A83), width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            Text(nbCurrentUser!.displayName ?? nbCurrentUser!.username, style: Theme.of(context).textTheme.titleMedium,),
                            Text('@${nbCurrentUser!.username}'),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    TextField(
                        controller: _messageInputController,
                        decoration: InputDecoration.collapsed(hintText: 'Enter something...'),
                        keyboardType: TextInputType.multiline,
                        maxLines: null)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            FilledButton(onPressed: _sendPost, child: const Text('Send'))
          ],
        ),
      ),
    );
  }

  NavigationDestination _navdest(int index, IconData icon, String label) {
    return NavigationDestination(icon: Icon(icon,
        color: _currentPageIndex == index ? Colors.black : Colors.white),
        label: label);
  }
}