import 'package:flutter/material.dart';

class AccountCardWidget extends StatelessWidget {
  const AccountCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: const Color(0xff83d3ff),
        borderRadius: BorderRadius.circular(24.0),
        image: const DecorationImage(
          image: AssetImage('assets/background/card1bg.jpg'),
          fit: BoxFit.cover,
        ),
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
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '\$848,900.30',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                '*****',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              Text(
                '3486',
                style: TextStyle(
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
