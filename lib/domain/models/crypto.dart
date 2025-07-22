class Crypto {
  final String id;
  final String name;
  final String symbol;
  final double priceUsd;

  Crypto({
    required this.id,
    required this.name,
    required this.symbol,
    required this.priceUsd,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      priceUsd: double.tryParse(json['priceUsd'] ?? '0') ?? 0,
    );
  }
}