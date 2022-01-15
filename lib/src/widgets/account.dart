import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Account page'),
      padding: const EdgeInsets.all(100),
      color: Colors.green,
    );
  }
}
