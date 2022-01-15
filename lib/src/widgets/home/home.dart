import 'package:flutter/material.dart';
import 'package:app_frontend/src/services/event_service.dart' as event_service;
import 'package:app_frontend/src/widgets/home/event_post.dart' as event_post;
import 'package:app_frontend/src/helpers/scroll_physics.dart' as scroll_physics;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<event_service.Event>> futureEventData;

  PageController controller = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 1.0,
  );

  @override
  void initState() {
    super.initState();
    futureEventData = event_service.getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<event_service.Event>>(
        future: futureEventData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageView(
                scrollDirection: Axis.vertical,
                controller: controller,
                physics: const scroll_physics.PageViewScrollPhysics(),
                children: (snapshot.data ?? [])
                    .map((eventData) => event_post.EventPost(
                        data: eventData, key: Key(eventData.id)))
                    .toList());
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
