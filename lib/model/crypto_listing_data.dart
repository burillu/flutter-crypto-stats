class CryptoListingData {
  final String symbol;
  final String name;
  final double price;
  final double variation24H;

  const CryptoListingData(
      {required this.symbol,
      required this.name,
      required this.price,
      required this.variation24H});

  factory CryptoListingData.fromData(Map<String, dynamic> data) {
    final symbol = data["symbol"];
    final name = data["name"];
    final price = data["quote"]["USD"]["price"];
    final variation24H = data["quote"]["USD"]["percent_change_24h"];

    return CryptoListingData(
        symbol: symbol, name: name, price: price, variation24H: variation24H);
  }
}
