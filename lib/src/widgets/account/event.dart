import 'package:carousel_slider/carousel_slider.dart';
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

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class Event extends StatelessWidget {
  final String description;

  const Event({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int imageCount = imgList.length;
    int slideCount = (imgList.length / 3).ceil();
    int indexStart = 0;
    double gap = 20;
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
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
              Text(description),
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
                        imgList[idx],
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