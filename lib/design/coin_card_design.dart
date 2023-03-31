import 'package:flutter/material.dart';
import 'package:pepcorns/main.dart';


class CoinCardDesign extends StatelessWidget {

  late String name ;
  late String symbol ;
  late String imageUrl ;
  late double price;
  late int change;
  late double changePercentage;


  CoinCardDesign({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage
  });





  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xff5ed5ab),
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
             BoxShadow(
               color: Color(0xff5ed5ab),
               offset: Offset(4,4),
               blurRadius: 10,
               spreadRadius: 1,
             ),
            BoxShadow(
              color: Color(0xff5ed5a8),
              offset: Offset(-4,-4),
              blurRadius: 10,
              spreadRadius: 1,

            ),
          ]
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 60,
                width: 60,

                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(4,4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4,-4),
                      blurRadius: 10,
                      spreadRadius: 1,

                    ),

                  ]

                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.network(imageUrl),
                ),

              ),


            ),
            Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          name,
                          style: TextStyle(
                            color: Colors.grey.shade900,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ),
                      Text(
                        symbol,
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 15,
                        ),
                        
                      ),
                    ],
                  ),
                ),
            ),
            Padding(
              padding: EdgeInsets.all(5),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price.toDouble().toString(),
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(change.toInt() < 0 ? change.toInt().toString() : '+' + change.toInt().toString(),
                    style: TextStyle(
                      color: change.toInt() < 0 ? Colors.red : Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    changePercentage.toDouble() <0 ? changePercentage.toDouble().toString() : '%' + changePercentage.toDouble().toString(),
                    style: TextStyle(
                      color: changePercentage.toDouble() < 0 ? Colors.red : Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),

            ),
            

          ],

        ),

      ),

    );
  }


}
