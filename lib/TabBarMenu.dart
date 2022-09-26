import 'package:flutter/material.dart';
import 'WebViewExample.dart';
import 'SMSView.dart';

class TabBarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.info_outline)),
                Tab(icon: Icon(Icons.wechat)),
                Tab(icon: Icon(Icons.web)),
                Tab(icon: Icon(Icons.grade)),
              ],
            ),
            title: Text('Demo de mis tabs'),
            backgroundColor: Colors.green,
          ),
          body: TabBarView(
            children: [
              Icon(Icons.grade),
              SMSView(),
              WebViewExample('https://sushiroll.com.mx/'),
              Icon(Icons.grade),
            ],
          ),
        ),
      ),
    );
  }
}