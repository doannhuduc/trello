import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/log_in.dart';

class My_App extends StatefulWidget {
  const My_App({super.key});

  @override
  State<My_App> createState() => _My_AppState();
}

class _My_AppState extends State<My_App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          child: Icon(Icons.person),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return LogIn();
              },
            ));
          },
        ),
        title: Center(
            child: Text(
          "MOVIE",
          style: TextStyle(fontStyle: FontStyle.italic),
        )),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return LogIn();
                  },
                ));
              },
              child: Icon(Icons.login)),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.menu)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.red,
              height: 100,
              width: 200,
              child: CarouselSlider(
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      currentIndex = index;
                      setState(() {});
                    },
                    aspectRatio: 2 / 1,
                    autoPlay: true,
                    viewportFraction: 1,
                    enlargeFactor: 1,
                    height: 200),
                items: [
                  "assets/image/image_homepage.jpg",
                  "assets/image/image_homepage.jpg",
                  "assets/image/image_homepage.jpg",
                  "assets/image/image_homepage.jpg",
                  "assets/image/image_homepage.jpg",
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "$i",
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      );
                      // return Container(
                      //     width: MediaQuery.of(context).size.width,
                      //     margin: EdgeInsets.symmetric(horizontal: 5.0),
                      //     decoration: BoxDecoration(color: Colors.amber),
                      //     child: Text(
                      //       'text $i',
                      //       style: TextStyle(fontSize: 16.0),
                      //     ));
                    },
                  );
                }).toList(),
              ),
            ),
            Container(
              height: 30,
              child: new DotsIndicator(
                dotsCount: 5,
                position: currentIndex,
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.red,
                    margin: EdgeInsets.all(10),
                    height: 200,
                    width: 200,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
