import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherPage2 extends StatefulWidget {
  late int timepoint1;
  late int cloudcover1;
  late int seeing1;
  late int rh2m1;
  WeatherPage2({
    required this.timepoint1,
    required this.cloudcover1,
    required this.seeing1,
    required this.rh2m1,
  });

  @override
  State<WeatherPage2> createState() => _WeatherPage2();
}

class _WeatherPage2 extends State<WeatherPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFb02b2e1),
          title: Text(
            "NEW YORK",
          ),
          actions: [Icon(Icons.location_on)],
        ),
        body: Center(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://wallpapers.com/images/hd/solid-color-cerulean-rgkfqtjxr99c3hsh.jpg"),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                //
                child: widget.timepoint1.isEven
                    ? Image(
                        image: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/1779/1779940.png'),
                        height: 200,
                        width: 150,
                      )
                    : Image(
                        image: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/4052/4052984.png'),
                        height: 200,
                        width: 150,
                      ),
              ),
              Padding(padding: EdgeInsets.only(top: 1)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "20°",
                    style: TextStyle(fontSize: 95, color: Colors.white),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    'CLOUDY 20°/12°',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.3)),
                        height: 190,
                        width: 350,
                        child: ListView(padding: EdgeInsets.all(20), children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.cloud,
                                color: Colors.white,
                              ),
                              Text(
                                'Time point',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 23,
                                    color: Colors.white),
                              ),
                              Text(
                                widget.timepoint1.toString(),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.cloud,
                                color: Colors.white,
                              ),
                              Text(
                                'Cloud cover',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 23,
                                    color: Colors.white),
                              ),
                              Text(
                                widget.cloudcover1.toString(),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.cloud,
                                color: Colors.white,
                              ),
                              Text(
                                'Seeing',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 23,
                                    color: Colors.white),
                              ),
                              Text(
                                widget.seeing1.toString(),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.cloud,
                                color: Colors.white,
                              ),
                              Text(
                                'Rh2m1',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 23,
                                    color: Colors.white),
                              ),
                              Text(
                                widget.rh2m1.toString(),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        )));
  }
}
