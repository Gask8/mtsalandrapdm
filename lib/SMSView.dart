import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sms/flutter_sms.dart';

class SMSView extends StatefulWidget {
  const SMSView({super.key});

  @override
  State<SMSView> createState() => _SMSViewState();
}

class _SMSViewState extends State<SMSView>{
  openwhatsapp(String message, String destinatario) async {
    var whatsapp = destinatario;
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=" + message;
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse(message)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no instalado")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }

  _hacerLlamadaTelefonica() async {
    const url = 'tel:+525591555190';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Error al llamar a $url';
    }
  }

  void _enviarSMS(String message, List<String> recipents) async {
    String _resultado = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_resultado);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Comunicate con nosotros'),
            backgroundColor: Colors.green,
          ),
          body: Center(
              child: Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.all(25),
                  width: 150,
                  child: TextButton(
                    child: Text(
                      'Llamar',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      onPrimary: Colors.white,
                      onSurface: Colors.grey,
                    ),
                    onPressed: _hacerLlamadaTelefonica,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  width: 150,
                  child: TextButton(
                    child: Text(
                      'SMS',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      onPrimary: Colors.white,
                      onSurface: Colors.grey,
                    ),
                    onPressed: () {
                      String mensaje = "Esto es un mensaje";
                      List<String> destinatarios = ["5591555190"];
                      _enviarSMS(mensaje, destinatarios);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  width: 150,
                  child: TextButton(
                    child: Text(
                      'Whatsapp',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      onPrimary: Colors.white,
                      onSurface: Colors.grey,
                    ),
                    onPressed: () {
                      String mensaje = "Esto es un mensaje";
                      String destinatario = "+525591555190";
                      openwhatsapp(mensaje, destinatario);
                    },
                  ),
                )
              ]))),
    );
  }
}
