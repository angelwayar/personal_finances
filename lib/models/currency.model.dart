class Currency {
  const Currency({
    required this.id,
    required this.currency,
    required this.country,
    required this.code,
    required this.symbol,
  });

  final int id;
  final String currency;
  final String country;
  final String code;
  final String symbol;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        currency: json["currency"],
        country: json["country"],
        code: json["code"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "currency": currency,
        "country": country,
        "code": code,
        "symbol": symbol,
      };
}
