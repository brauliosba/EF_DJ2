import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:examen/models/card.dart';

class ItemCard extends StatefulWidget {
  final Tarjeta card;

  const ItemCard({Key key, this.card}) : super(key: key);
  @override
  _ItemCard createState() => _ItemCard();
}

class _ItemCard extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                width: 100,
                image: AssetImage("assets/images/" + widget.card.image),
              ),
              Text(
                widget.card.cardName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
            size: 40,
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}