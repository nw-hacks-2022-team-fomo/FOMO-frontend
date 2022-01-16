import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:app_frontend/src/services/event_service.dart' as event_service;
import 'package:app_frontend/src/widgets/home/event_post_overlay/collapsed.dart'
    as collapsed;
import 'package:app_frontend/src/widgets/home/event_post_overlay/expanded.dart'
    as expanded;

class EventPostOverlay extends StatefulWidget {
  const EventPostOverlay(
      {Key? key, required this.data, required this.currentPage})
      : super(key: key);
  final event_service.Event data;
  final int currentPage;

  @override
  _EventPostOverlayState createState() => _EventPostOverlayState();
}

class _EventPostOverlayState extends State<EventPostOverlay> {
  final PanelController controller = PanelController();
  double expandPercent = 0.0;

  void setExpandPercent(double newState) {
    setState(() {
      expandPercent = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        controller: controller,
        backdropOpacity: 0,
        minHeight: 162,
        boxShadow: const [],
        color: const Color.fromARGB(0, 0, 0, 0),
        onPanelSlide: (val) => setExpandPercent(val),
        panel: expanded.Overlay(
          data: widget.data,
          onToggleExpanded: () {
            controller.close();
          },
          expandPercent: expandPercent,
        ),
        collapsed: collapsed.Overlay(
          data: widget.data,
          onToggleExpanded: () {
            controller.open();
          },
          expandPercent: expandPercent,
          currentPage: widget.currentPage,
        ));
  }
}
