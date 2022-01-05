import 'package:astro_zone/pages/screens.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReferAndEarn extends StatelessWidget {
  const ReferAndEarn({Key key}) : super(key: key);

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
                padding: const EdgeInsets.all(fixPadding * 2.0),
                children: [
                  codeTextField(),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  referFriends(),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  nowButton(context),
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
        vertical: fixPadding * 3.0,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            lightBlueColor,
            primaryColor,
          ],
        ),
      ),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(maxWidth: 24),
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
            color: whiteColor,
          ),
          Text(
            'Refer and Earn',
            style: white18BoldTextStyle,
          ),
        ],
      ),
    );
  }

  codeTextField() {
    return Container(
      padding: const EdgeInsets.all(fixPadding),
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
      child: Column(
        children: [
          Text(
            'WCQTV1710',
            style: black18SemiBoldTextStyle,
          ),
          Text(
            'Your referral code',
            style: black13MediumTextStyle,
          ),
          SizedBox(
            height: 35,
            child: TextField(
              cursorColor: primaryColor,
              style: black14MediumTextStyle,
              decoration: const InputDecoration(
                isDense: true,
                suffixIcon: Icon(
                  Icons.copy_rounded,
                  color: blackColor,
                  size: 20,
                ),
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  referFriends() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Refer a friend',
          style: black18SemiBoldTextStyle,
        ),
        Text(
          'And you both can earn 120 coins.',
          style: black13RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Row(
          children: [
            ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (Rect bounds) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [primaryColor, lightBlueColor],
              ).createShader(bounds),
              child: Image.asset(
                'assets/icons/about.png',
                height: 20,
                width: 20,
              ),
            ),
            widthSpace,
            widthSpace,
            widthSpace,
            GradientText(
              text: 'How it work',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              colors: const [primaryColor, lightBlueColor],
            ),
          ],
        ),
        heightSpace,
        heightSpace,
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(fixPadding * 1.2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryColor,
                    lightBlueColor,
                  ],
                ),
              ),
              child: Text(
                '1',
                style: white14ExtraBoldTextStyle,
              ),
            ),
            widthSpace,
            widthSpace,
            widthSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Invite your friends',
                  style: black14MediumTextStyle,
                ),
                Text(
                  'Just share link',
                  style: grey12RegularTextStyle,
                ),
              ],
            ),
          ],
        ),
        heightSpace,
        heightSpace,
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(fixPadding * 1.2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryColor,
                    lightBlueColor,
                  ],
                ),
              ),
              child: Text(
                '2',
                style: white14ExtraBoldTextStyle,
              ),
            ),
            widthSpace,
            widthSpace,
            widthSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'They install app',
                  style: black14MediumTextStyle,
                ),
                Text(
                  'You both get 120 coins.',
                  style: grey12RegularTextStyle,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  nowButton(context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: fixPadding * 1.3),
        alignment: Alignment.center,
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
        child: Text(
          'Refer Friends Now',
          style: white16BoldTextStyle,
        ),
      ),
    );
  }
}
