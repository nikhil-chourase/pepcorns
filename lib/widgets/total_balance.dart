import 'package:flutter/material.dart';


class TotalBalance extends StatelessWidget {
  const TotalBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Balance',
                style: TextStyle(
                  color: Colors.white.withOpacity(.55),
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 5,),

              Text('\$98.71',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          IconButton(onPressed: (){},
            icon: Icon(Icons.add_card_outlined,color: Colors.grey,),

          ),

        ],
      ),
    );
  }
}
