//import 'package:http/http.dart' as http;

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

  Event(
      {required this.id,
      required this.title,
      required this.user,
      required this.description,
      required this.tags,
      required this.numLikes,
      required this.numShares,
      required this.shareLink,
      required this.assets});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        id: json['id'],
        title: json['title'],
        user: json['user'],
        description: json['description'],
        tags: json['tags'],
        numLikes: json['numLikes'],
        numShares: json['numShares'],
        shareLink: json['shareLink'],
        assets: json['assets']);
  }
}

// TODO: Refactor when endpoint is done
Future<List<Event>> getEvents() {
  return Future.value([
    Event(
      id: '0',
      title: 'Soju Sunday',
      user: 'random uuid 123',
      description:
          "Vancouver's most popular K-pop night-club is back and better than before! Celebrate our 4th anniversary with us this Sunday, get your earlybird tickets today!",
      tags: ['Drinks', 'Music', 'Party', 'Dance'],
      numLikes: 25,
      numShares: 10,
      shareLink: 'facebook.com',
      assets: [
        'https://picsum.photos/800/1600',
        'https://picsum.photos/200/300'
      ],
    ),
    Event(
      id: '1',
      title: 'Sake Satuday',
      user: 'random uuid 321',
      description:
          "Vancouver's most popular K-pop night-club is back and better than before! Celebrate our 4th anniversary with us this Sunday, get your earlybird tickets today!",
      tags: ['Drinks', 'Music', 'Party', 'Dance'],
      numLikes: 179,
      numShares: 17,
      shareLink: 'facebook.com',
      assets: [
        'https://picsum.photos/200/300',
        'https://picsum.photos/200/300',
        'https://picsum.photos/200/300'
      ],
    ),
    Event(
      id: '2',
      title: 'jays basment',
      user: 'random uuid 3210',
      description:
          "Vancouver's most popular K-pop night-club is back and better than before! Celebrate our 4th anniversary with us this Sunday, get your earlybird tickets today!",
      tags: ['Drinks', 'Music', 'Party', 'Dance'],
      numLikes: 179,
      numShares: 17,
      shareLink: 'facebook.com',
      assets: [
        'https://picsum.photos/200/300',
        'https://picsum.photos/200/300',
        'https://picsum.photos/200/300'
      ],
    ),
  ]);
}
