import 'package:flutter/material.dart';
import 'package:furniture_ui/utils/colors.dart';

import '../utils/constants.dart';
import 'furniture_more_screen.dart';

class FurnitureHomeScreen extends StatelessWidget {
  const FurnitureHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.backgroundColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Icon(
              Icons.arrow_back,
              color: ColorPicker.primaryColor,
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ClipPath(
                      clipper: BottomBorderClipper(),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.52,
                        width: MediaQuery.of(context).size.width * 0.95,
                        color: ColorPicker.secondaryColor,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipPath(
                        clipper: TopBorderClipper(),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.45,
                          width: MediaQuery.of(context).size.width * 0.7,
                          color: ColorPicker.primaryColor,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.38,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Image.asset('assets/bed.png'),
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.bookmark_outline,
                                color: ColorPicker.primaryColor,
                              ),
                              Icon(
                                Icons.favorite_outline,
                                color: ColorPicker.backgroundColor,
                              ),
                              Icon(
                                Icons.upload_outlined,
                                color: ColorPicker.backgroundColor,
                              ),
                              Icon(
                                Icons.chat_outlined,
                                color: ColorPicker.backgroundColor,
                              ),
                              SizedBox(
                                height: 80,
                              ),
                            ]),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.95,
                      color: Colors.transparent,
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Frama'.toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                color: ColorPicker.backgroundColor,
                              ),
                            ),
                            Text(
                              'Mega Daybed'.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                color: ColorPicker.backgroundColor,
                              ),
                            ),
                            const Text(
                              'Designer chris martin saw a rack of freshly baked food in bakery and found something instantly appealing..',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: ColorPicker.backgroundColor,
                              ),
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'from Frama'.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: ColorPicker.primaryColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const FurnitureMoreScreen()));
                      },
                      child: Row(
                        children: [
                          Text(
                            'more'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: ColorPicker.primaryColor.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: ColorPicker.primaryColor.withOpacity(0.5),
                            size: 15,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    itemBuilder: (context, index) {
                      var chair = chairs[index];
                      return Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: ColorPicker.primaryColor,
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Center(
                                child: Image.asset('assets/${chair['image']}')),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(chair['title'] ?? '',
                              style: const TextStyle(
                                color: ColorPicker.primaryColor,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 20),
                    itemCount: chairs.length),
              ),
            ],
          )),
        ],
      )),
    );
  }
}

class TopBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var h = size.height;
    var w = size.width;
    final path = Path()
      ..moveTo(0, h * 0.15)
      ..quadraticBezierTo(0, h * 0, w * 0.12, h * 0)
      ..lineTo(w * 0.86, h * 0)
      ..quadraticBezierTo(w, h * 0, w, h * 0.15)
      ..lineTo(w, h * 0.65)
      ..quadraticBezierTo(w, h * 0.85, w * 0.86, h * 0.85)
      ..lineTo(w * 0.12, h * 0.85)
      ..quadraticBezierTo(0, h * 0.85, 0, h);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class BottomBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var h = size.height;
    var w = size.width;
    final path = Path()
      ..moveTo(w * 0.68, 0)
      ..quadraticBezierTo(w * 0.68, h * 0.07, w * 0.75, h * 0.1)
      ..lineTo(w * 0.85, h * 0.1)
      ..quadraticBezierTo(w, h * 0.1, w, h * 0.2)
      ..lineTo(w, h * 0.85)
      ..quadraticBezierTo(w, h, w * 0.85, h)
      ..lineTo(w * 0.15, h)
      ..quadraticBezierTo(0, h, 0, h * 0.85)
      ..lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
