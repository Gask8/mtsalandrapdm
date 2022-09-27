import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String emoji = '😋';
  Color bgcolor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: bgcolor,

              appBar: AppBar(
                title: const Text('Información General'),
                backgroundColor: Colors.green,
              ),
            resizeToAvoidBottomInset: false,
              body: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('SushiRoll, una Delisia ', style: const TextStyle(fontSize: 50)),
                      Text(
                        emoji,
                        style: const TextStyle(fontSize: 22),
                      ),
                      const SizedBox(height: 20),
                      const Text('64 ºC', style: const TextStyle(fontSize: 80)),
                      const Spacer(),
                      Image(
                          image: new ExactAssetImage("assets/img1.jpg"),
                          height: 200.0,
                          width: 300.0,
                          alignment: FractionalOffset.center
                      ),const Spacer(),
                      Image(
                          image: new ExactAssetImage("assets/img2.png"),
                          height: 200.0,
                          width: 300.0,
                          alignment: FractionalOffset.center
                      ),
                    ],
            ))));
  }
}