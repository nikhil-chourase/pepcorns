import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:pepcorns/design/coin_card_design.dart';
import 'package:pepcorns/models/coin.dart';
import 'package:pepcorns/widgets/button_widget.dart';
import 'package:pepcorns/widgets/total_balance.dart';



class ApiScreen extends StatefulWidget {

  static String id = 'ApiScreen';

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {

  int _selectedIndex = 0;


  // now let's fetch coins

  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en'));


    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }


  @override
  void initState() {
    fetchCoin();
    Timer.periodic(Duration(seconds: 10), (timer) => fetchCoin());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1b232A),

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              // lets keep code clean
              child: TotalBalance(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 75,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    ButtonWidget(text: 'Coins', onTap: (){}, active: true),
                    ButtonWidget(text: 'Deposits', onTap: (){}, active: true),
                    ButtonWidget(text: 'withdraw', onTap: (){}, active: true),

                  ],

                ),
              ),
            ),
            SliverToBoxAdapter(
              // let's design coin cards
              // we need builder for this


              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height ,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: coinList.length,
                  itemBuilder: (context,index){
                    return SingleChildScrollView(
                        child: CoinCardDesign(
                            name: coinList[index].name,
                            symbol: coinList[index].symbol,
                            imageUrl: coinList[index].imageUrl,
                            price: coinList[index].price.toDouble(),
                            change: coinList[index].change.toInt(),
                            changePercentage: coinList[index].changePercentage.toDouble(),

                        ),
                    );

                  },

                ),

              ),
            ),
          ],
        ),

      ),
    );
  }
}
