import 'package:app_frontend/src/widgets/account/Business/business.dart';
import 'package:app_frontend/src/widgets/account/User/user.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 18),
      child: Column(
        children: const <Widget>[
          CircleAvatar(
              radius: 36,
              backgroundImage:
                  NetworkImage('https://via.placeholder.com/140x100')),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
                child: Text(
              'User One',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )),
          ),
          false ? User() : Business(),
        ],
      ),
    );
  }
}
