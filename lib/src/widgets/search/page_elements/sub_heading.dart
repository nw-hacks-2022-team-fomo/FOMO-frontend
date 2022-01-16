import 'package:flutter/material.dart';

class SubHeading extends StatelessWidget {
  const SubHeading({Key? key, required this.main, required this.sub})
      : super(key: key);

  final String main;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(main,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
          Text(sub,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 11,
              ))
        ],
      ),
    );
  }
}
