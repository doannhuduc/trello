import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/log_in.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  int currentIndexCarouselSlider = 0;
  int currentIndexManyChoiceOfUser = 0;

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary500,
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
          style: AppStyle.textAppar,
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
            carouselSlider(),
            SizedBox(
              height: 10,
            ),
            choiceOfUser(),
            SizedBox(
              height: 10,
            ),
            featuredMovie(),
            SizedBox(
              height: 10,
            ),
            cinemaLocation(),
            SizedBox(height: 10),
            manyChoiceOfUser(),
            SizedBox(
              height: 10,
            ),
            listViewWhatHot(),
            listViewVideos(),
          ],
        ),
      ),
    );
  }

  Widget carouselSlider() {
    return Stack(children: [
      Image.asset(
        "assets/image/image_background_for_carousel_slider.png",
        height: 250,
        width: 420,
        fit: BoxFit.cover,
      ),
      Positioned(
        height: 250,
        width: 420,
        child: CarouselSlider(
          options: CarouselOptions(
            height: 200,
            onPageChanged: (index, reason) {
              currentIndexCarouselSlider = index;
              setState(() {});
            },
            aspectRatio: 2 / 1,
            autoPlay: true,
            viewportFraction: 1,
            enlargeFactor: 1,
            initialPage: 0,
          ),
          items: [
            "assets/image/image_homepage_carousel_slider_1.jpg",
            "assets/image/image_homepage_carousel_slider_2.png",
            "assets/image/image_homepage_carousel_slider_3.jpg",
            "assets/image/image_homepage_carousel_slider_4.png",
            "assets/image/image_homepage_carousel_slider_5.png"
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "$i",
                    width: 330,
                    fit: BoxFit.fill,
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
      Positioned(
        top: 200,
        left: 150,
        child: new DotsIndicator(
          dotsCount: 5,
          position: currentIndexCarouselSlider,
          decorator: DotsDecorator(
            color: Colors.black,
            size: const Size.square(16.0),
            activeSize: const Size(24.0, 14.0),
            activeColor: Colors.deepOrange,
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ),
    ]);
  }

  Widget choiceOfUser() {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Text(
          "Now Showing",
          style: AppStyle.textBodyScaffoldBigType1,
        ),
        SizedBox(
          width: 80,
        ),
        Text(
          "Special",
          style: AppStyle.textBodyScaffoldBigType1,
        ),
        SizedBox(
          width: 70,
        ),
        Text(
          "Coming Soon",
          style: AppStyle.textBodyScaffoldBigType1,
        ),
      ],
    );
  }

  Widget featuredMovie() {
    return Stack(
      children: [
        Image.asset(
          "assets/image/image_background_homepage.jpg",
          height: 400,
          width: 420,
          fit: BoxFit.cover,
        ),
        Positioned(
          child: Container(
            height: 360,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(14),
                  child: Image.asset(
                    "assets/image/image_homepage_listview_1.jpg",
                    height: 360,
                    width: 260,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
            left: 10,
            top: 360,
            child: Text(
              "DUNGEONS & DRAGONS",
              style: AppStyle.textBodyScaffoldBigType1,
            )),
        Positioned(
            left: 10,
            top: 382,
            child: Row(
              children: [
                Text(
                  "2hrs 14mins 21 Apr, 2023",
                  style: AppStyle.textBodyScaffoldSmall,
                ),
              ],
            )),
        Positioned(
            left: 300,
            top: 350,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18))),
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () {},
                child: Text(
                  "Book Now",
                  style: AppStyle.textBodyScaffoldBigType1,
                )))
      ],
    );
  }

  Widget cinemaLocation() {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Text(
          "CGV Rice City",
          style: AppStyle.textBodyScaffoldBigType2,
        ),
        SizedBox(
          width: 200,
        ),
        Text(
          "1.7km",
          style: AppStyle.textBodyScaffoldSmall,
        ),
        SizedBox(
          width: 30,
        ),
        Icon(
          Icons.gps_fixed_outlined,
          size: 26,
        )
      ],
    );
  }

  Widget manyChoiceOfUser() {
    return Stack(
      children: [
        Container(
            color: Color.fromARGB(255, 138, 117, 81),
            height: 180,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/image/image_homepage_gridview_1.jpg",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "CGV STORE",
                      style: AppStyle.textBodyScaffoldBigType2,
                    ),
                  ],
                );
              },
            )),
        Positioned(
            top: 150,
            left: 190,
            child: SmoothPageIndicator(
              axisDirection: Axis.horizontal,
              controller: controller,
              count: 2,
            ))
      ],
    );
  }

  Widget listViewWhatHot() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 10),
            Text(
              "What's Hot",
              style: AppStyle.textBodyScaffoldBigType1,
            ),
            SizedBox(width: 240),
            Container(
              child: Center(
                  child: Text(
                "All",
                style: AppStyle.textBodyScaffoldBigType1,
              )),
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1.4),
                  borderRadius: BorderRadius.circular(14)),
            )
          ],
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/image/image_listview_what_hot.jpg",
                        height: 120,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    '''PHIM TƯƠNG TÁC
 PHI VỤ NỬA ĐÊM''',
                    style: AppStyle.textBodyScaffoldBigType2,
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }

  Widget listViewVideos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 10),
            Text(
              "Videos",
              style: AppStyle.textBodyScaffoldBigType1,
            ),
            SizedBox(width: 268),
            Container(
              child: Center(
                  child: Text(
                "All",
                style: AppStyle.textBodyScaffoldBigType1,
              )),
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1.4),
                  borderRadius: BorderRadius.circular(14)),
            )
          ],
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/image/image_listview_videos.jpg",
                        height: 120,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "THIỆN ÁC ĐỐI ĐẦU 3",
                    style: AppStyle.textBodyScaffoldBigType2,
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
