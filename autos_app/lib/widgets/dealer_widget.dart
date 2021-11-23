import 'package:flutter/material.dart';
import 'package:productos_app/widgets/data.dart';

Widget buildDealer(Dealer dealer, int index){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
    width: 150,
    child: Stack(
      children: [
      Positioned(
        left: -50,
        top: -50,
        child: Opacity(
          opacity: 0.08,
          child: Image.asset(dealer.image, height: 150,)),
      ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child:Image.asset(dealer.image, fit: BoxFit.fitHeight,) ,
              height: 70,
              width: double.infinity,
            ),

            SizedBox(
              height: 20,
            ),

            Text(
              dealer.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),

          ],
        ),
      ],
    ),
  );
}