import 'package:app_frontend/src/services/event_service.dart' as event_service;
import 'package:app_frontend/src/widgets/account/User/profile.dart';
import 'package:flutter/material.dart';

import 'liked_events.dart';

class User extends StatefulWidget {
  final List<event_service.Event> events;
  const User({Key? key, required this.events}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            const TabBar(
              indicatorColor: Color(0xFFFFA800),
              labelColor: Color(0xFF000000),
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle:
              TextStyle(fontWeight: FontWeight.normal),
              unselectedLabelColor: Color(0xFFA8A8A8),
              tabs: [
                Tab(text: "Profile"),
                Tab(text: "Liked Events"),
              ],
            ),
            Expanded(
                child: TabBarView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 14.0),
                      child: Profile(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: LikedEvents(events: widget.events,),
                    ),
                  ],
                ))
          ],
        ),
      ),
    ),);
  }
}
