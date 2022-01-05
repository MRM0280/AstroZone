import 'package:astro_zone/pages/screens.dart';
import 'package:astro_zone/widget/column_builder.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AstrologerProfile extends StatelessWidget {
  final String name;
  final String type;
  AstrologerProfile({Key key, this.name, this.type}) : super(key: key);

  final videoList = [
    {
      'image': 'assets/users/user3.png',
      'title': 'Weekly Horoscope With Aliza Kelly',
      'detail': 'January 6 - january 12 | Cosmopolitan',
    },
    {
      'image': 'assets/users/user5.png',
      'title': 'Drew’s News: October Astrology Report',
      'detail': 'The Drew Barrymore Show',
    },
    {
      'image': 'assets/users/user6.png',
      'title': 'Solar Eclipse and Dawn Of  The Age Of...',
      'detail': 'The Drew Barrymore Show',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(context),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  aboutAstrologer(),
                  socialMediaProfile(),
                  videos(),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      chatButton(context),
                      widthSpace,
                      widthSpace,
                      widthSpace,
                      widthSpace,
                      callButton(),
                    ],
                  ),
                  heightSpace,
                  heightSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  appBar(context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding * 4.0,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        image: DecorationImage(
          image: AssetImage('assets/users/user4.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(maxWidth: 24),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
                color: whiteColor,
              ),
              Text(
                name,
                style: white18BoldTextStyle,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: fixPadding * 2.5),
            child: Text(
              type,
              style: white12RegularTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  aboutAstrologer() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About $name',
            style: black16BoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            'Lorem Ipsum is simply dummy text of the printing and dummy typesetting industry',
            style: grey12RegularTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            'Lorem Ipsum is simply dummy text of the printing and dummy typesetting industry. Lorem Ipsum has been the industry\'s eit standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type this specimen book.',
            style: grey13MediumTextStyle,
          ),
        ],
      ),
    );
  }

  socialMediaProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social Media Profile',
            style: black16BoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(9),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xfffdf497),
                      Color(0xfffd5949),
                      Color(0xffd6249f),
                      Color(0xff285aeb),
                    ],
                  ),
                ),
                child: Image.asset(
                  'assets/icons/insta.png',
                  color: whiteColor,
                  height: 14,
                  width: 14,
                ),
              ),
              widthSpace,
              widthSpace,
              Container(
                padding: const EdgeInsets.all(9),
                decoration: const BoxDecoration(
                  color: Color(0xff2ba5da),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/icons/twitter.png',
                  color: whiteColor,
                  height: 14,
                  width: 14,
                ),
              ),
              widthSpace,
              widthSpace,
              Container(
                padding: const EdgeInsets.all(9),
                decoration: const BoxDecoration(
                  color: blackColor,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/icons/tiktok.png',
                  height: 14,
                  width: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  videos() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Videos',
            style: black16BoldTextStyle,
          ),
          ColumnBuilder(
            itemCount: videoList.length,
            itemBuilder: (context, index) {
              final item = videoList[index];
              return Padding(
                padding: const EdgeInsets.only(top: fixPadding * 1.5),
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.066,
                      width: MediaQuery.of(context).size.width / 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage(item['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.play_circle,
                          color: whiteColor,
                          size: 16,
                        ),
                      ),
                    ),
                    widthSpace,
                    widthSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'],
                            overflow: TextOverflow.ellipsis,
                            style: black13MediumTextStyle,
                          ),
                          Text(
                            item['detail'],
                            overflow: TextOverflow.ellipsis,
                            style: grey12RegularTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  chatButton(context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Messages(name: name),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2.5,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor,
              lightBlueColor,
            ],
          ),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/icons/chat.png',
              color: whiteColor,
              height: 18,
              width: 18,
            ),
            widthSpace,
            widthSpace,
            Text(
              'Chat',
              style: white15BoldTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  callButton() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.5,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (Rect bounds) => const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                primaryColor,
                lightBlueColor,
              ],
            ).createShader(bounds),
            child: const Icon(
              Icons.call,
              color: whiteColor,
              size: 18,
            ),
          ),
          widthSpace,
          widthSpace,
          GradientText(
            text: 'Call',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            gradientDirection: GradientDirection.ttb,
            colors: const [
              primaryColor,
              lightBlueColor,
            ],
          ),
        ],
      ),
    );
  }
}
