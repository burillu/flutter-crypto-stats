import 'package:crypto_stats/model/crypto_listing_data.dart';
import 'package:crypto_stats/model/crypto_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CryptoListingRepository {
  static Future<List<CryptoListingData>> all() async {
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
}
