import 'package:flutter/material.dart';
import 'package:app_frontend/src/services/event_service.dart' as event_service;
import 'package:app_frontend/src/constants/tag_icons.dart' as tag_icons;

class EventText extends StatelessWidget {
  final double fontSize;
  final double topMargin;
  final double rightMargin;
  final String text;
  final FontWeight weight;

  const EventText(
    this.text, {
    Key? key,
    required this.fontSize,
    this.topMargin = 0.0,
    this.weight = FontWeight.normal,
    this.rightMargin = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin, right: rightMargin),
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: fontSize, color: Colors.white, fontWeight: weight),
      ),
    );
  }
}

class Overlay extends StatelessWidget {
  final event_service.Event data;
  final void Function() onToggleExpanded;
  final double expandPercent;
  final int currentPage;

  const Overlay({
    Key? key,
    required this.data,
    required this.onToggleExpanded,
    required this.expandPercent,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromRGBO(0, 0, 0, 0),
            Color.fromRGBO(0, 0, 0, 0.8 * (1.0 - expandPercent)),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: data.assets.asMap().entries.map((entry) {
                int index = entry.key;
                if (index == currentPage) {
                  return const Icon(
                    Icons.fiber_manual_record,
                    color: Colors.white,
                    size: 10,
                  );
                }
                return Icon(
                  Icons.fiber_manual_record,
                  color: Colors.grey.shade400,
                  size: 10,
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Hosted by @${data.user}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Stack(children: [
                  Positioned.fill(
                    child: Container(
                      margin: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xFFFFC34E),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: onToggleExpanded,
                      icon: const Icon(
                        Icons.info_rounded,
                        color: Colors.white,
                        size: 32,
                      )),
                ])
              ],
            ),
            Flexible(
              fit: FlexFit.tight,
              child: EventText(
                data.description,
                fontSize: 12,
                topMargin: 10,
              ),
            ),
            Wrap(
              children: data.tags
                  .map(
                    (tag) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: Icon(
                              tag_icons.iconMap[tag],
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          Text(
                            tag,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
