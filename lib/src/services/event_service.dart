import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Event {
  final String id;
  final String title;
  final String user;
  final String description;
  final List<String> tags;
  final int numLikes;
  final int numShares;
  final String shareLink;
  final List<String> assets;
  final double latitude;
  final double longitude;
  final int participants;
  final int priceEstimate;

  Event(
      {required this.priceEstimate,
      required this.participants,
      required this.latitude,
      required this.longitude,
      required this.id,
      required this.title,
      required this.user,
      required this.description,
      required this.tags,
      required this.numLikes,
      required this.numShares,
      required this.shareLink,
      required this.assets});

  factory Event.fromJson(Map<String, dynamic> json) {
    List<dynamic> assetsList = json['assets'];
    List<dynamic> tagsList = json['tags'];

    return Event(
        priceEstimate: json['price_estimate'],
        participants: json['participants'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        id: json['id'].toString(),
        title: json['event_name'],
        user: "dsasd",
        description: json['description'],
        numLikes: json['likes'],
        numShares: json['shares'],
        shareLink: json['share_link'],
        tags: tagsList.map((tag) => getAttribute("tag", tag)).toList(),
        assets:
            assetsList.map((asset) => getAttribute("name", asset)).toList());
  }
}

String getAttribute(String attr, dynamic json) {
  Map<String, dynamic> jsonObj = json;
  debugPrint(jsonObj[attr]);
  return jsonObj[attr];
}

// TODO: Refactor when endpoint is done
Future<List<Event>> getEvents() async {
  final http.Response events = await http.get(Uri.parse(
      'http://10.0.2.2:3000/event/nearby-events?distance=2000&latitude=49.2265133&longitude=-123.1367469'));
  debugPrint(events.body);

  List<dynamic> resBody = jsonDecode(events.body);
  return Future.value(resBody.map((event) => Event.fromJson(event)).toList());
}
