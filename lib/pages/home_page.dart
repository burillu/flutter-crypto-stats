import 'package:crypto_stats/components/crypto_list_tile.dart';
import 'package:crypto_stats/model/crypto_listing_data.dart';
import 'package:crypto_stats/model/crypto_model.dart';
import 'package:crypto_stats/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<CryptoListingData>> cryptoListingData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    cryptoListingData = getCryptoStats();
  }

  Future<List<CryptoListingData>> getCryptoStats() async {
    final response = await http.get(
        Uri.parse(
          "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest",
        ),
        headers: CryptoModel.apiKey);
    //print(response);
    final cryptoData = jsonDecode(response.body);

    final cryptoListing = (cryptoData["data"] as List<dynamic>).map((item) {
      return CryptoListingData.fromData(item);
    }).toList();
    // print(cryptoListing);
    return cryptoListing;
  }

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
          preferredSize: Size(double.infinity, 100),
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
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Container(
          decoration: BoxDecoration(
            color: ThemeColors.cardBg,
          ),
          child: Column(
            children: [
              PreferredSize(
                preferredSize: Size(double.infinity, 200),
                child: ListTile(
                  title: Text(
                    "Gainers & Losers",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Basato sulle top 100 coins",
                    style: TextStyle(fontSize: 14, color: Colors.white38),
                  ),
                  trailing: Text(
                    "Mostra tutte",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(),
              Expanded(
                child: body(),
              )
            ],
          ),
          //child: Text("hello Crypto"),
        ),
      ),
    );
  }

  Widget body() {
    return FutureBuilder<List<CryptoListingData>>(
      future: cryptoListingData,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.separated(
              itemBuilder: (context, index) => CryptoListTile(
                    symbol: snapshot.data![index].symbol,
                    name: snapshot.data![index].name,
                    price: snapshot.data![index].price,
                    variation24H: snapshot.data![index].variation24H,
                  ),
              separatorBuilder: (contex, index) => Divider(),
              itemCount: 10);
        }
      },
    );
  }
}
