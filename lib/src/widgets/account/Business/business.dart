import 'package:app_frontend/src/widgets/account/Business/about.dart';
import 'package:app_frontend/src/widgets/account/Business/events.dart';
import 'package:app_frontend/src/widgets/account/Business/dashboard.dart';
import 'package:flutter/material.dart';

class Business extends StatefulWidget {
  const Business({Key? key}) : super(key: key);

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: const <Widget>[
            TabBar(
              indicatorColor: Color(0xFFFFA800),
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle:
              TextStyle(fontWeight: FontWeight.normal),
              unselectedLabelColor: Color(0xFFA8A8A8),
              tabs: [
                Tab(text: "Events"),
                Tab(text: "About"),
                Tab(text: "Dashboard"),
              ],
            ),
            Expanded(
                child: TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 14.0),
                      child: Events(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 14.0),
                      child: About(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 14.0),
                      child: Dashboard(),
                    ),
                  ],
                ))
          ],
        ),
      ),
    ),);
  }
}
