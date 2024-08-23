import 'package:crypto_stats/components/crypto_list_tile.dart';
import 'package:crypto_stats/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late Future<List<CryptoListTile>> cryptioListTile;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   cryptioListTile = getCryptoStats();
  // }

  // void getCryptoStats() async {
  //   final response = await http.get();

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {},
        ),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                "https://media.licdn.com/dms/image/v2/D4E03AQEYk5x2BQqOmg/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1708207818662?e=1729728000&v=beta&t=o5V3VvDFdh6jlzpMa6sqJNIvZLl4x7tpOkYWeaHdGss"),
          )
        ],
        centerTitle: true,
        backgroundColor: ThemeColors.cardBg,
        title: Text(
          "CRYPSTAT",
          style: TextStyle(color: Colors.yellow, letterSpacing: 4),
        ),
        bottom: PreferredSize(
          child: ListTile(
            title: Text(
              "Il mio saldo",
              style: TextStyle(color: Colors.white38),
            ),
            subtitle: Text(
              "\$ 3.544,00",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            ),
          ),
          preferredSize: Size(double.infinity, 100),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Container(
          decoration: BoxDecoration(
            color: ThemeColors.cardBg,
          ),
          //child: Text("hello Crypto"),
        ),
      ),
    );
  }
}
