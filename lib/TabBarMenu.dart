import 'package:flutter/material.dart';
import 'WebViewExample.dart';
import 'SMSView.dart';
import 'ReviewList.dart';
import 'AboutUs.dart';

class TabBarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Image appLogo = Image(
        image: new ExactAssetImage("assets/logo_2022.png"),
        height: 50.0,
        width: 150.0,
        alignment: FractionalOffset.center);
    List<ListItem> listaReviews = [];
    listaReviews.add(HeadingItem('Clientes'));
    listaReviews.add(MessageItem('1. Lou Sánchez','Excelente atención, servicio rápido y sobretodo muy buen sabor. Después de las 7 promo de 2x1',4));
    listaReviews.add(MessageItem('2. Victor Manuel','Terraza excelente, se llena mucho, pero excelente servicio, la calidad de los alimentos excelente!',5));
    listaReviews.add(MessageItem('3. Alejandra Villa','Super delicioso, no olvides visitarlos. Excelente servicio.',3));
    listaReviews.add(MessageItem('4. Josué Méndez','Personal amable y con facilidad de palabra en atención excelente experiencia por parte de todos su colaboradores, un tiempo de espera pero buena atención',4));
    listaReviews.add(MessageItem('5. Julio Cesar','Excelente Lugar y  de los mejores  de la zona vale la pena la espera. Gracias sushiroll',5));

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
              AboutUs(),
              SMSView(),
              WebViewExample('https://sushiroll.com.mx/'),
              ReviewList(items: listaReviews),
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