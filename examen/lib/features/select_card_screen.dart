import 'package:flutter/material.dart';
import 'package:examen/features/new_card_screen.dart';
import 'package:examen/models/card.dart';
import 'package:examen/UI/item_card.dart';


class SelectCardScreen extends StatefulWidget {
  @override
  _SelectCardScreenState createState() => _SelectCardScreenState();
}

class _SelectCardScreenState extends State<SelectCardScreen> {
  List<Tarjeta> cards;

  @override
  void initState() {
    cards = new List<Tarjeta>();
    cards.add(new Tarjeta(image: "image10.png", cardName: "MasterCard"));
    cards.add(new Tarjeta(image: "image11.png", cardName: "VISA"));
    cards.add(new Tarjeta(image: "image12.png", cardName: "JCB"));
    cards.add(new Tarjeta(image: "image13.png", cardName: "American Express"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/image9.png'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10, top: 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Select a credit card",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: cards.length,
                          shrinkWrap: true,
                            itemBuilder: (context, i) {
                              return ItemCard(
                                card: cards[i],
                              );
                            },
                        separatorBuilder: (context, int index) => const Divider(),
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
                                      NewCardScreen()));
                        },
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.only(left: 30, right: 30),
                          child: Stack(
                            children: [
                              Center(
                                child: Text(
                                  "ADD CARD",
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
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
