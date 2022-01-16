import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        Expanded(child: Text('Founded in 2021, itsBusinessOne is a Vancouver-based nightclub and hosts the most popular Kpop club-night in the city. K-Pop is our heart and soul, which is why our motto is aways “K-Pop All Nigt!” To offer a variety of music,')),
        SizedBox(height: 20), // <-- Set height
        SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 5,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.vertical,
            children: <Widget>[
              const Text('Links', style: TextStyle(fontWeight: FontWeight.bold)),
              const Text('Instagram: '),
              const Text('Business Inquiries: '),
              const Text('Youtube: '),
              const Text('Tiktok: '),
            ],
          ),
        )
      ],
    );
  }
}
