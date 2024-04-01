import 'package:flutter/material.dart';

class AccountCardWidget extends StatelessWidget {
  const AccountCardWidget({
    super.key,
    this.img,
    this.account,
    this.totalBalance,
  });

  final String? img;
  final String? totalBalance;
  final String? account;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: const Color(0xff83d3ff),
        borderRadius: BorderRadius.circular(24.0),
        image: img != null
            ? DecorationImage(
                image: AssetImage(img!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/icons/visa.png',
            height: 22.0,
          ),
          const Spacer(),
          const Text(
            'Total balance',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '\$${totalBalance ?? ''}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              const Text(
                '*****',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              Text(
                '${account ?? ''} ',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
