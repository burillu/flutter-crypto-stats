import 'package:flutter/material.dart';

class CryptoListTile extends StatelessWidget {
  final String symbol;
  final String name;
  final double price;
  final double variation24H;

  const CryptoListTile(
      {required this.symbol,
      required this.name,
      required this.price,
      required this.variation24H});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        symbol,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        name,
        style: TextStyle(color: Colors.white30),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "\$${price.toStringAsFixed(2)}",
            style: TextStyle(fontSize: 17),
          ),
          Text(
            "${variation24H.toStringAsFixed(2)}%",
            style: TextStyle(
                color: variation24H >= 0 ? Colors.green : Colors.red,
                fontSize: 14),
          )
        ],
      ),
    );
  }
}
