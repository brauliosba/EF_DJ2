import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:url_launcher/url_launcher.dart';
import 'package:examen/features/select_card_screen.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class PrincipalScreen extends StatefulWidget {
  @override
  _PrincipalScreenState createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  String barcode = '';
  Uint8List bytes = Uint8List(200);
  bool qrDetected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/image1.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10, top: 20),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Balance",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(left: 30, right: 30),
                          child: Stack(children: [
                            Center(
                              child: Text(
                                "Rp.76.547.000,-",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            )
                          ]),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SelectCardScreen()));
                            },
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.only(left: 30, right: 30),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      "TOP UP",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  borderRadius: BorderRadius.circular(30)),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "QR Code",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            )),
                        GestureDetector(
                          onTap: () async{
                            String cameraScanResult = await scanner.scan();
                            launchURL(context, cameraScanResult);
                          },
                          child: Image(
                            width: 600,
                            image: AssetImage("assets/images/image14.png"),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
  launchURL(BuildContext context, String scan) async {
    final url = scan;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
