import 'package:flutter/material.dart';
import 'WebViewExample.dart';

class TabBarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.music_note)),
                Tab(icon: Icon(Icons.music_video)),
                Tab(icon: Icon(Icons.camera_alt)),
                Tab(icon: Icon(Icons.grade)),
                Tab(icon: Icon(Icons.email)),
              ],
            ),
            title: Text('Demo de mis tabs'),
            backgroundColor: Colors.green,
          ),
          body: TabBarView(
            children: [
              WebViewExample('https://www.bbc.co.uk'),
              WebViewExample('https://www.milenio.com'),
              WebViewExample('https://www.reforma.com'),
              Icon(Icons.grade),
              Icon(Icons.email),
            ],
          ),
        ),
      ),
    );
  }
}