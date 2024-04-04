class Journal {
  int amount;
  String category;
  String date;
  String type;
  String description;

  Journal({
    required this.amount,
    required this.category,
    required this.date,
    required this.type,
    required this.description,
  });

  factory Journal.fromJson(Map<String, dynamic> json) => Journal(
        amount: json["amount"],
        category: json["category"],
        date: json["date"],
        type: json["type"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "category": category,
        "date": date,
        "type": type,
        "description": description,
      };
}
