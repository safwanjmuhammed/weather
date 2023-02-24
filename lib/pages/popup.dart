import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather/json/weatherapimeth.dart';
import 'package:weather/pages/weatherpage2.dart';

Future<Root> fetchWeather() async {
  var objSample2 = null;
  try {
    var url = Uri.parse(
        'https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0');

    final response = await http.get(url, headers: {});

    print("response :" + response.body.toString());

    if (response.statusCode == 200) {
      return Root.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load ');
    }
  } catch (error) {
    print("hello");
    print("error : " + error.toString());
  }
  return objSample2;
}

class WeatherApi4 extends StatefulWidget {
  WeatherApi4({super.key});

  @override
  State<WeatherApi4> createState() => _WeatherApi3State();
}

class _WeatherApi3State extends State<WeatherApi4> {
  late Future<Root> futureAlbum;
  late Root weathersample;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WEATHER"),
        backgroundColor: Color(0xFFb02b2e1),
      ),
      body: Center(
        child: FutureBuilder<Root>(
          future: fetchWeather(),
          builder: (context, snapshot2) {
            if (snapshot2.hasData) {
              weathersample = snapshot2.data!;
              return mainbody2(snapshot2.data!);
            } else if (snapshot2.hasError) {
              return Text("${snapshot2.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Widget mainbody2(weatherData) {
  return GridView.builder(
      itemCount: weatherData.dataseries.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 15, mainAxisSpacing: 15),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      shadowColor: Colors.black,
                      elevation: 50,
                      titlePadding: EdgeInsets.only(top: 60),
                      backgroundColor: Color(0xFFb02b2e1),
                      title: weatherData.dataseries[index].timepoint.isEven
                          ? Image(
                              image: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/1779/1779940.png'),
                              height: 150,
                              width: 100,
                            )
                          : Image(
                              image: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/4052/4052984.png'),
                              height: 150,
                              width: 100,
                            ),
                      content: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
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
                                weatherData.dataseries[index].timepoint
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
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
                                weatherData.dataseries[index].cloudcover
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
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
                                weatherData.dataseries[index].seeing.toString(),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
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
                                weatherData.dataseries[index].rh2m.toString(),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back)),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WeatherPage2(
                                            timepoint1: weatherData
                                                .dataseries[index].timepoint,
                                            cloudcover1: weatherData
                                                .dataseries[index].cloudcover,
                                            seeing1: weatherData
                                                .dataseries[index].seeing,
                                            rh2m1: weatherData
                                                .dataseries[index].rh2m,
                                          )),
                                );
                              },
                              child: Icon(Icons.sunny))
                        ],
                      ),
                    ));
          },
          child: Card(
            color: Color(0xFFb02b2e1),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(20)),
                Icon(
                  Icons.sunny,
                  color: Colors.yellow,
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Text(
                      'Time point : ${weatherData.dataseries[index].timepoint.toString()}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        'Cloud cover : ${weatherData.dataseries[index].cloudcover.toString()}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
