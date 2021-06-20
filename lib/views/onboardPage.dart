import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../objects.dart';
import 'homePage.dart';

class OnBoard extends StatefulWidget {

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int activeIndex=0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      imgList.forEach((imageUrl) {
        precacheImage(AssetImage(imageUrl), context);
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Builder(builder: (context) {
          final double height = MediaQuery
              .of(context)
              .size
              .height;
          return Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: height,
                  viewportFraction:1.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: Duration(seconds: 30),
                  autoPlayAnimationDuration: Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  onPageChanged:  (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  }
                ),
                items: imgList.map((item) =>
                    Container(
                      child: Image.asset(
                        item, fit: BoxFit.cover, height: height,),
                    )

                ).toList(),
              ),
              Positioned(
                left: 30.0,
                right: 0.0,
                top:30.0,
                child:AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count:  imgList.length,
                  effect: ExpandingDotsEffect(
                    expansionFactor: 4,
                    activeDotColor: Colors.black
                  ),
                )

              ),
            ],
          );
        }
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
        onPressed: () {
          Navigator.pushReplacement(context,
            MaterialPageRoute(
                builder: (context) => homePage()),
          );
        },
      ),
    );
  }

}