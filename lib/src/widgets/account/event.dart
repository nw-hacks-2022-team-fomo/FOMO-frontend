import 'package:carousel_slider/carousel_slider.dart';
import 'package:app_frontend/src/services/event_service.dart' as event_service;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventInfo extends StatelessWidget {
  final IconData icon;
  final int color;
  final double gap;
  final String text;

  const EventInfo(
    this.text, {
    Key? key,
    required this.icon,
    required this.color,
    this.gap = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Color(color),
        ),
        SizedBox(
          width: gap,
        ),
        Text(text)
      ],
    );
  }
}

class Event extends StatefulWidget {
  final event_service.Event data;

  const Event({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  bool _customTileExpanded = false;
  double gap = 20;

  @override
  Widget build(BuildContext context) {
    int imageCount = widget.data.assets.length;
    int slideCount = (imageCount / 3).ceil();
    int indexStart = 0;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: <Widget>[
          ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            textColor: const Color(0xff000000),
            tilePadding: EdgeInsets.zero,
            title: const Text(
              "Soju Sunday",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            trailing: Icon(Icons.info,
                color: _customTileExpanded
                    ? Color(0xFFC9C9C9)
                    : Color(0xFFFFA800)),
            onExpansionChanged: (bool expanded) {
              setState(() => _customTileExpanded = expanded);
            },
            children: <Widget>[
              Text(widget.data.description),
              SizedBox(height: gap),
              Wrap(
                spacing: 3,
                children:
                    widget.data.tags.map((tag) => Text('#$tag', style: const TextStyle(color: Color(0xFFBCBCBC)),)).toList(),
              ),
              SizedBox(height: gap),
              Row(
                children: [
                  Container(
                      height: 100, width: 4, color: const Color(0xFFFFA800)),
                  SizedBox(
                    width: 7,
                  ),
                  Column(
                    children: [
                      EventInfo(
                        "dsadsasdsaddas",
                        icon: Icons.access_time,
                        color: 0xFFFFA800,
                        gap: 7,
                      ),
                      EventInfo(
                        "dsadsasdsaddas",
                        icon: Icons.location_pin,
                        color: 0xFFFFA800,
                        gap: 7,
                      ),
                      EventInfo(
                        "dsadsasdsaddas",
                        icon: Icons.group,
                        color: 0xFFFFA800,
                        gap: 7,
                      ),
                      EventInfo(
                        "dsadsasdsaddas",
                        icon: Icons.price_change_rounded,
                        color: 0xFFFFA800,
                        gap: 7,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: gap),
            ],
          ),
          SizedBox(height: gap),
          CarouselSlider.builder(
            options: CarouselOptions(
              enlargeCenterPage: false,
              viewportFraction: 1,
            ),
            itemCount: slideCount,
            itemBuilder: (context, index, _) {
              final int? first = indexStart < imageCount ? indexStart : null;
              final int? second =
                  indexStart + 1 < imageCount ? first! + 1 : null;
              final int? third =
                  indexStart + 2 < imageCount ? first! + 2 : null;
              indexStart = indexStart >= imageCount ? 0 : indexStart + 3;
              return Row(
                children: [first, second, third].map((idx) {
                  return idx != null
                      ? Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Image.network(
                              widget.data.assets[idx],
                              height: 600,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Expanded(child: Container());
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
