import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'state.dart';
import 'layout.dart';
import 'navigation.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      "/layout": (context) => LayoutPage(),
      "/state": (context) => StateScreen(),
      "/navigation": (context) => BooksApp()
    }, home: NavigationMenu());
  }
}

class NavigationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter playground", style: TextStyle(fontSize: 16)),
      ),
      body: Column(
        children: [
          FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "/layout");
              },
              child: Center(child: Text("Layout practice"))),
          FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "/state");
              },
              child: Center(child: Text("State practice"))),
          FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "/navigation");
              },
              child: Center(child: Text("Navigation practice")))
        ],
      ),
    );
  }
}
