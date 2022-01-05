import 'package:astro_zone/pages/screens.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  userProfile(context),
                  divider(),
                  profileDetail(context),
                  heightSpace,
                  heightSpace,
                  logout(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  appBar() {
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
          Text(
            'Profile',
            style: white18BoldTextStyle,
          ),
        ],
      ),
    );
  }

  userProfile(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Row(
        children: [
          Hero(
            tag: 'profilePic',
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/users/user11.png'),
                  fit: BoxFit.cover,
                ),
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
                  'Samantha Shah',
                  style: black15BoldTextStyle,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '+91 1234567890',
                      style: grey11MediumTextStyle,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfile()),
                      ),
                      child: Image.asset(
                        'assets/icons/edit.png',
                        height: 18,
                        width: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  profileDetail(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        detail(
          ontap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Astrologers()),
          ),
          title: 'Astrologers',
          image: 'assets/icons/group.png',
        ),
        detail(
          ontap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Compatibility()),
          ),
          title: 'Compatibility',
          image: 'assets/icons/compatibility.png',
        ),
        detail(
          ontap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Numerology()),
          ),
          title: 'Numerology',
          image: 'assets/icons/numerology.png',
        ),
        detail(
          ontap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PalmReading()),
          ),
          title: 'Palm Reading',
          image: 'assets/icons/palm.png',
        ),
        detail(
          ontap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PremiumSubscription()),
          ),
          title: 'Premium Subscription',
          image: 'assets/icons/subscription.png',
        ),
        detail(
          ontap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ReferAndEarn()),
          ),
          title: 'Refer and Earn',
          image: 'assets/icons/share.png',
        ),
        detail(
          ontap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Settings()),
          ),
          title: 'Settings',
          image: 'assets/icons/setting.png',
        ),
        detail(
          ontap: () {},
          title: 'About App',
          image: 'assets/icons/about.png',
        ),
      ],
    );
  }

  detail({String title, String image, Function ontap}) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: fixPadding,
          horizontal: fixPadding * 2.0,
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              color: blackColor,
              height: 18,
              width: 18,
              fit: BoxFit.cover,
            ),
            widthSpace,
            widthSpace,
            widthSpace,
            Text(
              title,
              style: black15SemiBoldTextStyle,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: blackColor,
            )
          ],
        ),
      ),
    );
  }

  logout(context) {
    return InkWell(
      onTap: () => logoutDialog(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: fixPadding,
          horizontal: fixPadding * 2.0,
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
              child: Image.asset(
                'assets/icons/logout.png',
                height: 20,
                width: 20,
              ),
            ),
            widthSpace,
            widthSpace,
            widthSpace,
            GradientText(
              text: 'Logout',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              gradientDirection: GradientDirection.ttb,
              colors: const [primaryColor, lightBlueColor],
            ),
            const Spacer(),
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
                Icons.arrow_forward_ios,
                size: 15,
                color: blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  logoutDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(fixPadding * 1.5),
                child: Column(
                  children: [
                    Text(
                      'Sure You Want To Logout?',
                      style: black16BoldTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signin()),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: fixPadding * 2.0,
                              vertical: 6,
                            ),
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
                                  color: primaryColor.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Text(
                              'Logout',
                              style: white15BoldTextStyle,
                            ),
                          ),
                        ),
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: fixPadding * 2.0,
                              vertical: 6,
                            ),
                            alignment: Alignment.center,
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
                            child: GradientText(
                              text: 'Cancel',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                              colors: const [primaryColor, lightBlueColor],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  divider() {
    return Container(
      margin: const EdgeInsets.all(fixPadding * 2.0),
      color: greyColor,
      height: 1,
      width: double.infinity,
    );
  }
}
