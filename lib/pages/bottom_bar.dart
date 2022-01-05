import 'dart:io';

import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:astro_zone/pages/screens.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

int currentIndex = 0;

class _BottomBarState extends State<BottomBar> {
  DateTime currentBackPressTime;

  changeIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
        child: (currentIndex == 0)
            ? const Home()
            : (currentIndex == 1)
                ? const Notifications()
                : (currentIndex == 2)
                    ? Chat()
                    : const Profile(),
      ),
      bottomNavigationBar: Container(
        height: 55.0,
        alignment: Alignment.center,
        child: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getBottomBarItemTile(0, 'assets/icons/home.png', 'Home'),
              getBottomBarItemTile(
                  1, 'assets/icons/notification.png', 'Notification'),
              getBottomBarItemTile(2, 'assets/icons/chat.png', 'Chat'),
              getBottomBarItemTile(3, 'assets/icons/profile.png', 'Profile'),
            ],
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

  getBottomBarItemTile(int index, String icon, String title) {
    return InkWell(
      focusColor: primaryColor,
      onTap: () {
        changeIndex(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (Rect bounds) => LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: (currentIndex == index)
                  ? [
                      primaryColor,
                      lightBlueColor,
                    ]
                  : [
                      greyColor,
                      greyColor,
                    ],
            ).createShader(bounds),
            child: Image.asset(
              icon,
              height: 20,
              width: 20,
            ),
          ),
          GradientText(
            text: title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            gradientDirection: GradientDirection.ttb,
            colors: (currentIndex == index)
                ? [
                    primaryColor,
                    lightBlueColor,
                  ]
                : [
                    greyColor,
                    greyColor,
                  ],
          ),
        ],
      ),
    );
  }
}
