import 'package:flutter/material.dart';

import '../event.dart';

class LikedEvents extends StatefulWidget {
  const LikedEvents({Key? key}) : super(key: key);

  @override
  State<LikedEvents> createState() => _LikedEventsState();
}

class _LikedEventsState extends State<LikedEvents> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Event(
          description:
          'Founded in 2021, itsBusinessOne is a Vancouver-based nightclub and hosts the most popular Kpop club-night in the city. K-Pop is our heart and soul, which is why our motto is aways “K-Pop All Nigt!” To offer a variety of music,',
        ),
        Event(
          description:
          'Founded in 2021, itsBusinessOne is a Vancouver-based nightclub and hosts the most popular Kpop club-night in the city. K-Pop is our heart and soul, which is why our motto is aways “K-Pop All Nigt!” To offer a variety of music,',
        ),
        Event(
          description:
          'Founded in 2021, itsBusinessOne is a Vancouver-based nightclub and hosts the most popular Kpop club-night in the city. K-Pop is our heart and soul, which is why our motto is aways “K-Pop All Nigt!” To offer a variety of music,',
        )
      ],
    );
  }
}
