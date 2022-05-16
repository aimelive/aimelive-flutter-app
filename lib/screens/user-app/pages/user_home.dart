//import 'package:aimelive_app/api/notification_api.dart';
import 'package:aimelive_app/screens/user-app/pages/community.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:intl/intl.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final urlImages = [
    'slide1.jpg',
    'slide2.jpg',
    'slide3.jpg',
    'slide4.jpg',
    'slide5.jpg',
    'slide6.jpg'
  ];
  int activeIndex = 0;
  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: MyAppBar(),
            pinned: true,
            elevation: 0.0,
            floating: true,
            backgroundColor: Colors.grey,
            expandedHeight: 210.0,
            flexibleSpace: FlexibleSpaceBar(
              background: MyFlexiableAppBar(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // ElevatedButton(
                //     onPressed: () => NotificationApi.showNotification(
                //         title: "Aime Ndayambaje",
                //         body:
                //             "Hi, This is Aimelive. I am a freelance junior developer.",
                //         payload: "aime.live"),
                //     child: const Text("Push Notifications")),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CarouselSlider.builder(
                      carouselController: controller,
                      itemCount: urlImages.length,
                      itemBuilder: (context, index, realIndex) {
                        final urlImage = urlImages[index];
                        return buildImageSlides(urlImage, index);
                      },
                      options: CarouselOptions(
                          height: 300,
                          enlargeCenterPage: true,
                          //enlargeStrategy: CenterPageEnlargeStrategy.height,
                          //viewportFraction: 1,
                          autoPlay: true,
                          //reverse: true,
                          //pageSnapping: false,
                          //enableInfiniteScroll: false,
                          autoPlayInterval: const Duration(seconds: 2),
                          onPageChanged: (index, reason) =>
                              setState(() => activeIndex = index)),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    buildIndicator()
                  ],
                ),

                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Wide Community',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const CommunityList(),
                const SizedBox(
                  height: 90,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImageSlides(String urlImage, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.asset(
          "assets/slides/$urlImage",
          fit: BoxFit.cover,
        ),
      );
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        onDotClicked: animateToSlide,
        effect: const ScrollingDotsEffect(
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: Color(0xffecb22e),
            dotColor: Colors.black12),
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

class MyAppBar extends StatelessWidget {
  final double barHeight = 66.0;

  const MyAppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Aimelive App',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Poppins', fontSize: 20.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class MyFlexiableAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;

  const MyFlexiableAppBar();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    var now = DateTime.now();
    var formatter = DateFormat.yMMMMd('en_US');
    String formattedDate = formatter.format(now);
    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Projects",
                  style: TextStyle(color: Colors.white, fontSize: 28.0)),
              Text("\u002420,914.33",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 36.0)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text("\u002B24.93\u0025",
                    style: TextStyle(color: Colors.white70, fontSize: 20.0)),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Icon(
                  Icons.arrow_circle_up,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0, left: 8.0),
                child: Text("Recent",
                    style: TextStyle(color: Colors.white70, fontSize: 16.0)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
    );
  }
}
