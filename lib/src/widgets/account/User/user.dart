import 'package:app_frontend/src/widgets/account/User/profile.dart';
import 'package:flutter/material.dart';

import 'liked_events.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

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
          children: const <Widget>[
            TabBar(
              indicatorColor: Color(0xFFFFA800),
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
                    Padding(
                      padding: EdgeInsets.only(top: 14.0),
                      child: Profile(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 14.0),
                      child: LikedEvents(),
                    ),
                  ],
                ))
          ],
        ),
      ),
    ),);
  }
}
