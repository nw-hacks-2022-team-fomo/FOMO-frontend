import 'package:app_frontend/src/services/event_service.dart' as event_service;
import 'package:app_frontend/src/widgets/account/Business/business.dart';
import 'package:app_frontend/src/widgets/account/User/user.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late Future<List<event_service.Event>> futureEventData;

  @override
  void initState() {
    super.initState();
    futureEventData = event_service.getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureEventData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 18),
              child: Column(
                children: <Widget>[
                  const CircleAvatar(
                      radius: 36,
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/140x100')),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                        child: Text(
                      'User One',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                  ),
                  //TODO: Add condition to change between business and personal account
                  false ? User(events:  snapshot.data as List<event_service.Event>) : Business(events: snapshot.data as List<event_service.Event>),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
