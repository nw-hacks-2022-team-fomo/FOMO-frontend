import 'package:app_frontend/src/services/event_service.dart' as event_service;
import 'package:flutter/material.dart';

import '../event.dart';

class Events extends StatelessWidget {
  final List<event_service.Event> events;
  const Events({Key? key, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: events.map((data) => Event(data: data,
      )).toList(),
    );
  }
}
