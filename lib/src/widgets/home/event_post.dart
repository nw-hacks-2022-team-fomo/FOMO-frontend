import 'package:flutter/material.dart';
import 'package:app_frontend/src/services/event_service.dart' as event_service;
import 'package:app_frontend/src/helpers/scroll_physics.dart' as scroll_physics;
import 'package:app_frontend/src/widgets/home/event_post_overlay/event_post_overlay.dart'
    as event_post_overlay;

// TODO: Refactor when endpoint is done
class EventPost extends StatefulWidget {
  const EventPost({Key? key, required this.data}) : super(key: key);
  final event_service.Event data;

  @override
  State<EventPost> createState() => _EventPostState();
}

class _EventPostState extends State<EventPost> {
  final PageController controller = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 1.0,
  );

  int page = 0;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {
        page = (controller.page ?? 0).toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.bottomStart, children: [
      PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          physics: const scroll_physics.PageViewScrollPhysics(),
          children: widget.data.assets
              .map((asset) => Image.network(
                    asset,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ))
              .toList()),
      event_post_overlay.EventPostOverlay(
        data: widget.data,
        currentPage: page,
      )
    ]);
  }
}
