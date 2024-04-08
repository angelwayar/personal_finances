import 'package:image_picker/image_picker.dart';

class Account {
  const Account({
    this.total,
    this.divisa,
    this.accountNumber,
    this.description,
    this.imageBg,
  });

  final double? total;
  final String? divisa;
  final int? accountNumber;
  final String? description;
  final XFile? imageBg;

  Account copyWith({
    double? total,
    String? divisa,
    int? accountNumber,
    String? description,
    XFile? imageBg,
  }) {
    return Account(
      total: total ?? this.total,
      divisa: divisa ?? this.divisa,
      accountNumber: accountNumber ?? this.accountNumber,
      description: description ?? this.description,
      imageBg: imageBg ?? this.imageBg,
    );
  }

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
        "imageBg": imageBg?.name,
      };
}
