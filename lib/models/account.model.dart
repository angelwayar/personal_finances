import 'package:image_picker/image_picker.dart';

import '../core/utils/utils.dart';

class Account {
  const Account({
    this.total,
    this.divisa,
    this.email,
    this.accountNumber,
    this.description,
    this.imageBg,
    this.image,
  });

  final double? total;
  final String? email;
  final String? divisa;
  final int? accountNumber;
  final String? description;
  final XFile? imageBg;
  final String? image;

  Account copyWith({
    double? total,
    String? divisa,
    String? email,
    int? accountNumber,
    String? description,
    XFile? imageBg,
    String? image,
  }) {
    return Account(
      total: total ?? this.total,
      email: email ?? this.email,
      divisa: divisa ?? this.divisa,
      accountNumber: accountNumber ?? this.accountNumber,
      description: description ?? this.description,
      imageBg: imageBg ?? this.imageBg,
      image: image ?? this.image,
    );
  }

  factory Account.fromJson(Map<String, dynamic> json) {
    String? image;
    final imgBg = json["image"];

    if (imgBg != null) {
      image = imgValidator(imgBg);
    }

    return Account(
      total: json["total"]?.toDouble(),
      divisa: json["divisa"],
      accountNumber: json["accountNumber"],
      description: json["description"],
      image: image ?? imgBg,
    );
  }

  Map<String, dynamic> toJson() => {
        "total": total,
        "email": email,
        "divisa": divisa,
        "accountNumber": accountNumber,
        "description": description,
        "image": imageBg?.name ?? image,
      };
}
