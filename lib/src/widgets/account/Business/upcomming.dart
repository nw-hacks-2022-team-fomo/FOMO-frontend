import 'package:flutter/material.dart';

class Upcomming extends StatefulWidget {
  const Upcomming({Key? key}) : super(key: key);

  @override
  State<Upcomming> createState() => _UpcommingState();
}

class _UpcommingState extends State<Upcomming> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OutlinedButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              return Colors.black;
            }),
            side: MaterialStateProperty.resolveWith((states) {
              return const BorderSide(color: Color(0xFFFFA800), width: 1);
            }),
          ),
          onPressed: () {
            debugPrint('Received click');
          },
          child: const Text('Edit'),
        ),
        SizedBox(height: 20), // <-- Set height
        SizedBox(
          width: double.infinity,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.vertical,
            spacing: 5,
            children: <Widget>[
              const Text('Personal', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Location: '),
              Text('Age: '),
              Text('Gender: '),
              Text('Username: '),
              Text('Email: '),
              Text('Phone: '),
            ],
          ),
        ),
        SizedBox(height: 20), // <-- Set height
        SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 5,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.vertical,
            children: <Widget>[
              const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
              const Text('Account Type: '),
              const Text('Account Privacy'),
              const Text('Notifications'),
            ],
          ),
        )
      ],
    );
  }
}
