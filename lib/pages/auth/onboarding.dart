import 'dart:async';
import 'dart:io';

import 'package:astro_zone/pages/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  double height;
  double width;
  final pageViewController = PageController(initialPage: 0);
  int currentPage = 0;
  DateTime currentBackPressTime;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 5),
      (Timer time) {
        if (currentPage < 2) {
          currentPage++;
        } else {
          currentPage = 0;
        }
        pageViewController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            primaryColor,
            lightBlueColor,
          ],
        ),
      ),
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            bool backStatus = onWillPop();
            if (backStatus) {
              exit(0);
            }
            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                logo(),
                Expanded(
                  child: PageView(
                    controller: pageViewController,
                    onPageChanged: onChanged,
                    children: [
                      page1(),
                      page2(),
                      page3(),
                    ],
                  ),
                ),
                pageIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: blackColor,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }

  logo() {
    return Center(
      child: Image.asset(
        'assets/logo.png',
        color: whiteColor,
        height: 80,
        width: 160,
      ),
    );
  }

  pageIndicator() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        0,
        fixPadding * 2.0,
        fixPadding * 1.5,
      ),
      color: whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          currentPage != 2
              ? InkWell(
                  onTap: () {
                    setState(() {
                      currentPage = 1;
                    });
                  },
                  child: Text(
                    'Skip',
                    style: black12BoldTextStyle,
                  ),
                )
              : Container(width: 30),
          SmoothPageIndicator(
            controller: pageViewController,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              dotColor: greyColor.withOpacity(0.6),
              activeDotColor: lightBlueColor,
            ),
          ),
          currentPage != 2
              ? InkWell(
                  onTap: () {
                    setState(() {
                      currentPage++;
                    });
                    pageViewController.animateToPage(
                      currentPage,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text(
                    'Next',
                    style: black12BoldTextStyle,
                  ),
                )
              : InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Signin()),
                  ),
                  child: Text(
                    'Sign in',
                    style: black12BoldTextStyle,
                  ),
                ),
        ],
      ),
    );
  }

  page1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        heightSpace,
        Image.asset(
          'assets/image1.png',
          height: height * 0.4,
          width: width / 2,
        ),
        heightSpace,
        heightSpace,
        Container(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding * 8.0,
          ),
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Text(
                'Astrology right in your pocket. Make everyday special',
                textAlign: TextAlign.center,
                style: black16BoldTextStyle,
              ),
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              Text(
                'Lorem Ipsum is simply dummy text of the printing\nand typesetting industry Lorem Ipsum is simply\ndummy text of the printing.',
                textAlign: TextAlign.center,
                style: black13RegularTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  page2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        heightSpace,
        Image.asset(
          'assets/image2.png',
          height: height * 0.4,
          width: width / 2,
        ),
        heightSpace,
        heightSpace,
        Container(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding * 8.0,
          ),
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Text(
                'See different zodiac signs and know more about them',
                textAlign: TextAlign.center,
                style: black16BoldTextStyle,
              ),
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              Text(
                'Lorem Ipsum is simply dummy text of the printing\nand typesetting industry Lorem Ipsum is simply\ndummy text of the printing.',
                textAlign: TextAlign.center,
                style: black13RegularTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  page3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        heightSpace,
        Image.asset(
          'assets/image3.png',
          height: height * 0.4,
          width: width / 2,
        ),
        heightSpace,
        heightSpace,
        Container(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding * 8.0,
          ),
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Text(
                'Select your zodiac signs and know more about them',
                textAlign: TextAlign.center,
                style: black16BoldTextStyle,
              ),
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              Text(
                'Lorem Ipsum is simply dummy text of the printing\nand typesetting industry Lorem Ipsum is simply\ndummy text of the printing.',
                textAlign: TextAlign.center,
                style: black13RegularTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
