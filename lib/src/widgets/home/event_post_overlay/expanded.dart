import 'package:flutter/material.dart';
import 'package:app_frontend/src/services/event_service.dart' as event_service;

class Overlay extends StatelessWidget {
  final event_service.Event data;
  final void Function() onToggleExpanded;
  final double expandPercent;

  const Overlay({
    Key? key,
    required this.data,
    required this.onToggleExpanded,
    required this.expandPercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //duration: const Duration(milliseconds: 500),
      color: Color.fromRGBO(255, 255, 255, expandPercent),
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: (() {
            if (expandPercent > 0.5) {
              return Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 3,
                          color: Color.fromRGBO(0, 0, 0, 0.075),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.title,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text('Hosted by @${data.user}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(data.description,
                                      style: const TextStyle(fontSize: 14)),
                                ),
                                Wrap(
                                  children: data.tags
                                      .map(
                                        (tag) => Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                            right: 8,
                                          ),
                                          child: Text("#$tag",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey.shade500,
                                              )),
                                        ),
                                      )
                                      .toList(),
                                ),
                                //TODO: Updated with real data
                                Container(
                                  margin: const EdgeInsets.only(top: 16),
                                  padding: const EdgeInsets.only(left: 12),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          left: BorderSide(
                                    width: 3,
                                    color: Color(0xFFFFA800),
                                  ))),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.timer,
                                              size: 24,
                                              color: Color(0xFFFFA800),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 6),
                                              child: Text("Sunday, 123124512"),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.location_pin,
                                              size: 24,
                                              color: Color(0xFFFFA800),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 6),
                                              child: Text("LOCATION"),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.people,
                                              size: 24,
                                              color: Color(0xFFFFA800),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 6),
                                              child:
                                                  Text("Approx. 300 Attendees"),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.money,
                                            size: 24,
                                            color: Color(0xFFFFA800),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 6),
                                            child: Text("\$\$"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(2),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 1,
                                  offset: Offset(0, 2),
                                  blurRadius: 4,
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        padding: EdgeInsets.zero,
                                        alignment: Alignment.center,
                                        onPressed: onToggleExpanded,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.grey.shade400,
                                          size: 32,
                                        )),
                                    Text(
                                      'Back',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          padding: EdgeInsets.zero,
                                          alignment: Alignment.center,
                                          onPressed: onToggleExpanded,
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.grey.shade400,
                                            size: 32,
                                          )),
                                      Text(
                                        '#Likes',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          padding: EdgeInsets.zero,
                                          alignment: Alignment.center,
                                          onPressed: onToggleExpanded,
                                          icon: Icon(
                                            Icons.share_outlined,
                                            color: Colors.grey.shade400,
                                            size: 32,
                                          )),
                                      Text(
                                        '#Shares',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16, bottom: 4),
                        child: Text(
                          "Notes from the Host",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        "Tickets can be purchased online or at the door. Proof of vaccination and two pieces of ID required. Visit our website for more info!",
                        style: TextStyle(color: Colors.grey.shade500),
                      )
                    ],
                  ),
                ],
              );
            }
          }())),
    );
  }
}
