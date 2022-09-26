import 'package:flutter/material.dart';
import 'WebViewExample.dart';
import 'SMSView.dart';


class TabBarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Image appLogo = Image(
        image: new ExactAssetImage("assets/logo_2022.png"),
        height: 50.0,
        width: 150.0,
        alignment: FractionalOffset.center);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: appLogo,
            backgroundColor: Colors.black,
          ),
          body: TabBarView(
            children: [
              Icon(Icons.grade),
              SMSView(),
              WebViewExample('https://sushiroll.com.mx/'),
              Icon(Icons.grade),
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.black,
            child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.info_outline)),
              Tab(icon: Icon(Icons.wechat)),
              Tab(icon: Icon(Icons.language_rounded)),
              Tab(icon: Icon(Icons.grade)),
            ],
          ),
          ),
        ),
      ),
    );
  }
}