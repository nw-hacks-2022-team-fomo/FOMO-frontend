import 'package:flutter/material.dart';
import 'package:app_frontend/src/services/event_service.dart' as event_service;
import 'package:app_frontend/src/helpers/scroll_physics.dart' as scroll_physics;

class EventText extends StatelessWidget {
  final double fontSize;
  final double topMargin;
  final double leftMargin;
  final String text;
  final FontWeight weight;
  const EventText(this.text,
      {Key? key,
      required this.fontSize,
      this.topMargin = 0.0,
      this.weight = FontWeight.normal,
      this.leftMargin = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin, left: leftMargin),
      child: Text(text,
          style: TextStyle(
              fontSize: fontSize, color: Colors.white, fontWeight: weight)),
    );
  }
}

// TODO: Refactor when endpoint is done
class EventPost extends StatelessWidget {
  EventPost({Key? key, required this.data}) : super(key: key);
  final event_service.Event data;

  final PageController controller = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.bottomStart, children: [
      PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          physics: const scroll_physics.PageViewScrollPhysics(),
          children: data.assets
              .map((asset) => Image.network(
                    asset,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ))
              .toList()),
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(0, 0, 0, 0),
              Color.fromRGBO(0, 0, 0, 0.8),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 32.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EventText(
                data.title,
                fontSize: 28,
                weight: FontWeight.w600,
              ),
              EventText(
                'Hosted by @${data.user}',
                fontSize: 16,
                weight: FontWeight.w500,
              ),
              EventText(
                data.description,
                fontSize: 14,
                topMargin: 10,
              ),
              Row(
                children: data.tags
                    .map((tag) => EventText(
                          tag,
                          fontSize: 14,
                          weight: FontWeight.w600,
                          topMargin: 10,
                          leftMargin: 5,
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
