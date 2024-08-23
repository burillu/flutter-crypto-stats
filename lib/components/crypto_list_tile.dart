import 'package:flutter/material.dart';

class CryptoListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "BTC",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      subtitle: Text("Bitcoin"),
    );
  }
}
