class Account {
  double total;
  String divisa;
  int accountNumber;
  String description;
  String imageBg;

  Account({
    required this.total,
    required this.divisa,
    required this.accountNumber,
    required this.description,
    required this.imageBg,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        total: json["total"]?.toDouble(),
        divisa: json["divisa"],
        accountNumber: json["accountNumber"],
        description: json["description"],
        imageBg: json["imageBg"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "divisa": divisa,
        "accountNumber": accountNumber,
        "description": description,
        "imageBg": imageBg,
      };
}
