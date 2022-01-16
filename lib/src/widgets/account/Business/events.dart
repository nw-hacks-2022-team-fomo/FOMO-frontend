import 'package:flutter/material.dart';

// class Event extends StatefulWidget {
//   const Event({Key? key}) : super(key: key);
//
//   @override
//   State<Event> createState() => _EventState();
// }
//
// class _EventState extends State<Event> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Row(children: <Widget>[
//           const Text(
//             "Soju Sunday",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//           SizedBox(width: 6),
//           IconButton(
//             icon: const Icon(
//               Icons.info,
//               color: Color(0xFFFFA800),
//             ),
//             onPressed: () {
//               debugPrint('Received click');
//             },
//           )
//         ]),
//         Row(children: <Widget>[]),
//       ],
//     );
//   }
// }

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ExpansionTile(
          textColor: const Color(0xff000000),
          tilePadding: EdgeInsets.zero,
          title: const Text(
            "Soju Sunday",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          trailing: const Icon(Icons.info, color: Color(0xFFFFA800)),
          children: <Widget>[
            Text(
                'Founded in 2021, itsBusinessOne is a Vancouver-based nightclub and hosts the most popular Kpop club-night in the city. K-Pop is our heart and soul, which is why our motto is aways “K-Pop All Nigt!” To offer a variety of music,'),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                    height: 100, width: 4, color: const Color(0xFFFFA800)),
                SizedBox(
                  width: 7,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Color(0xFFFFA800),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text("dsadsasdsaddas")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Color(0xFFFFA800),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text("dsadsasdsaddas")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.group,
                          color: Color(0xFFFFA800),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text("dsadsasdsaddas")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.price_change_rounded,
                          color: Color(0xFFFFA800),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text("dsadsasdsaddas")
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: const [
            Expanded(
              child: Image(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Image(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
                child: Image(
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  fit: BoxFit.fitWidth,
            ))
          ],
        )
      ],
    );
  }
}
