import 'package:flutter/material.dart';
import 'package:nitroport/colortheme.dart';
import 'package:nitroport/pages/home_routes/feed_home_route.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Image(image: AssetImage('assets/nitroterm_logo.png'), height: 40,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        surfaceTintColor: const Color(0xFFf9e900),
        indicatorColor: const Color(0xFFf9e900),
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        selectedIndex: _currentPageIndex,
        destinations: [
          _navdest(0, Icons.message_outlined, "Your feed"),
          _navdest(1, Icons.people, "Subscribed"),
        ],
      ),
      body: <Widget>[
        const FeedHomeRoute(),
        const Text('nope')
      ][_currentPageIndex],
    );
  }

  NavigationDestination _navdest(int index, IconData icon, String label) {
    return NavigationDestination(icon: Icon(icon,
        color: _currentPageIndex == index ? Colors.black : Colors.white),
        label: label);
  }
}