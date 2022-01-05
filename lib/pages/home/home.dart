import 'package:astro_zone/pages/screens.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double height;
  double width;
  String isSelected = 'Libra';

  final zodiacSignList = [
    {
      'image': 'assets/zodiac_signs/gemini.png',
      'name': 'Gemini',
    },
    {
      'image': 'assets/zodiac_signs/aries.png',
      'name': 'Aries',
    },
    {
      'image': 'assets/zodiac_signs/taurus.png',
      'name': 'Taurus',
    },
    {
      'image': 'assets/zodiac_signs/pisces.png',
      'name': 'Pisces',
    },
    {
      'image': 'assets/zodiac_signs/aquarius.png',
      'name': 'Aquarius',
    },
    {
      'image': 'assets/zodiac_signs/leo.png',
      'name': 'Leo',
    },
    {
      'image': 'assets/zodiac_signs/cancer.png',
      'name': 'Cancer',
    },
    {
      'image': 'assets/zodiac_signs/sagitarius.png',
      'name': 'Sagitarius',
    },
    {
      'image': 'assets/zodiac_signs/scorpio.png',
      'name': 'Scorpio',
    },
    {
      'image': 'assets/zodiac_signs/libra.png',
      'name': 'Libra',
    },
    {
      'image': 'assets/zodiac_signs/vigro.png',
      'name': 'Vigro',
    },
    {
      'image': 'assets/zodiac_signs/capricorn.png',
      'name': 'Capricorn',
    },
  ];

  final bannerList = [
    {
      'title': 'STRESS REMOVER',
      'detail':
          'Lorem Ipsum is simply\ndummy text of the printing\nand typesetting industry.',
    },
    {
      'title': 'FREE HOROSCOPES',
      'detail':
          'Lorem Ipsum is simply\ndummy text of the printing\nand typesetting industry.',
    },
  ];

  final otherFeaturesList = [
    {
      'image': 'assets/otherFeatures/tarot_reading.png',
      'title': 'Tarot Reading',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    },
    {
      'image': 'assets/otherFeatures/crystal_ball_reading.png',
      'title': 'Crystal Ball Reading',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    },
    {
      'image': 'assets/otherFeatures/palm_reading.png',
      'title': 'Palm Reading',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    },
  ];

  final astrologerList = [
    {
      'image': 'assets/users/user1.png',
      'name': 'K.N Rao',
      'type': 'Magic ball reader',
      'charge': '\$5/min',
    },
    {
      'image': 'assets/users/user2.png',
      'name': 'Robert Hand',
      'type': 'Magic ball reader',
      'charge': '\$5/min',
    },
    {
      'image': 'assets/users/user3.png',
      'name': 'Aliza Kelly',
      'type': 'Magic ball reader',
      'charge': '\$5/min',
    },
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  zodiacSigns(),
                  banner(),
                  horoscopes(),
                  others(),
                  topAstrologer(),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Hey Samantha, Welcome to Astro Zone!',
                style: white14SemiBoldTextStyle,
              ),
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(maxWidth: 15),
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 18,
                ),
                color: whiteColor,
              ),
            ],
          ),
          Text(
            'Choose your sign',
            style: white12RegularTextStyle,
          ),
        ],
      ),
    );
  }

  zodiacSigns() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding * 2.0,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        mainAxisExtent: 64,
      ),
      shrinkWrap: true,
      itemCount: zodiacSignList.length,
      itemBuilder: (context, index) {
        final item = zodiacSignList[index];
        return InkWell(
          onTap: () {
            setState(() {
              isSelected = item['name'];
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ZodiacSignDetail(
                  image: item['image'],
                  name: item['name'],
                ),
              ),
            );
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(9),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: isSelected == item['name']
                        ? [
                            primaryColor,
                            lightBlueColor,
                          ]
                        : [whiteColor, whiteColor],
                  ),
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    BoxShadow(
                      color: blackColor.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Image.asset(
                  item['image'],
                  height: 30,
                  width: 30,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                item['name'],
                style: black9MediumTextStyle,
              ),
            ],
          ),
        );
      },
    );
  }

  banner() {
    return SizedBox(
      height: height * 0.22,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: bannerList.length,
          itemBuilder: (context, index) {
            final item = bannerList[index];
            return Container(
              height: height * 0.2,
              width: width * 0.79,
              margin: EdgeInsets.only(
                top: fixPadding,
                bottom: fixPadding,
                left: index == 0 ? fixPadding * 2.0 : 0,
                right: fixPadding * 2.0,
              ),
              padding: const EdgeInsets.symmetric(horizontal: fixPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                  image: AssetImage('assets/container_bg.png'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: lightBlueColor.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heightSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.lock,
                        color: whiteColor,
                        size: 12,
                      ),
                    ],
                  ),
                  Text(
                    item['title'],
                    style: white14BlackTextStyle,
                  ),
                  heightSpace,
                  Text(
                    item['detail'],
                    style: white11RegularTextStyle,
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.call,
                                color: whiteColor,
                                size: 9,
                              ),
                            ),
                            widthSpace,
                            Text(
                              'Call Astrologer',
                              style: primaryColor10BoldTextStyle,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  horoscopes() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: fixPadding * 1.5),
            child: Text(
              'Horoscopes',
              style: black16BoldTextStyle,
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChineseZodiac()),
                ),
                child: Container(
                  height: height * 0.19,
                  width: width / 3 - 27,
                  padding: const EdgeInsets.all(fixPadding),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                      image:
                          AssetImage('assets/horoscopes/month_horoscope.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(
                    'August Horoscopes',
                    style: white13BoldTextStyle,
                  ),
                ),
              ),
              widthSpace,
              widthSpace,
              widthSpace,
              Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChineseZodiac()),
                    ),
                    child: Container(
                      height: height * 0.08,
                      width: width / 3 - 27,
                      padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding / 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/horoscopes/chinese_zodiac_horoscope.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Text(
                        'Chinese Zodiac Horoscopes',
                        style: white11SemiBoldTextStyle,
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChineseZodiac()),
                    ),
                    child: Container(
                      height: height * 0.08,
                      width: width / 3 - 27,
                      padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding / 2),
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/horoscopes/year_horoscope.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Text(
                        '2021 Horoscopes',
                        style: white11SemiBoldTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
              widthSpace,
              widthSpace,
              widthSpace,
              Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChineseZodiac()),
                    ),
                    child: Container(
                      height: height * 0.045,
                      width: width / 3 - 17,
                      decoration: BoxDecoration(
                        color: const Color(0xffe1bee7),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/horoscopes/love_horoscope.png'),
                          const SizedBox(width: 2),
                          Text(
                            'Love\nHoroscopes',
                            style: white10SemiBoldTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChineseZodiac()),
                    ),
                    child: Container(
                      height: height * 0.045,
                      width: width / 3 - 17,
                      decoration: BoxDecoration(
                        color: const Color(0xffc5cae9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/horoscopes/work_horoscope.png'),
                          const SizedBox(width: 2),
                          Text(
                            'Work\nHoroscopes',
                            style: white10SemiBoldTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChineseZodiac()),
                    ),
                    child: Container(
                      height: height * 0.045,
                      width: width / 3 - 17,
                      decoration: BoxDecoration(
                        color: const Color(0xffb2dfdb),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/horoscopes/health_horoscope.png'),
                          const SizedBox(width: 2),
                          Text(
                            'Health\nHoroscopes',
                            style: white10SemiBoldTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  others() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding * 1.5,
          ),
          child: Text(
            'Others',
            style: black16BoldTextStyle,
          ),
        ),
        SizedBox(
          height: height * 0.22,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: otherFeaturesList.length,
            itemBuilder: (context, index) {
              final item = otherFeaturesList[index];
              return Container(
                width: width * 0.35,
                margin: EdgeInsets.only(
                  left: index == 0 ? fixPadding * 2.0 : 0,
                  right: fixPadding,
                ),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: ClipPath(
                    clipper: ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          item['image'],
                          height: height * 0.1,
                          width: width * 0.35,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(fixPadding / 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'],
                                overflow: TextOverflow.ellipsis,
                                style: black12MediumTextStyle,
                              ),
                              heightSpace,
                              Text(
                                item['detail'],
                                style: black9RegularTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  topAstrologer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding * 1.5,
          ),
          child: Text(
            'Top Astrologer',
            style: black16BoldTextStyle,
          ),
        ),
        SizedBox(
          height: height * 0.22,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: astrologerList.length,
            itemBuilder: (context, index) {
              final item = astrologerList[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? fixPadding * 2.0 : 0,
                  right: fixPadding,
                ),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: ClipPath(
                    clipper: ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          item['image'],
                          height: height * 0.1,
                          width: width * 0.35,
                          fit: BoxFit.cover,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(fixPadding / 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name'],
                                    style: black13MediumTextStyle,
                                  ),
                                  Text(
                                    item['type'],
                                    style: grey11RegularTextStyle,
                                  ),
                                  const SizedBox(height: 3),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Charges  ',
                                          style: grey11RegularTextStyle,
                                        ),
                                        TextSpan(
                                          text: item['charge'],
                                          style: black11SemiBoldTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            divider(),
                            Container(
                              width: width * 0.35,
                              padding: const EdgeInsets.all(fixPadding / 2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AstrologerProfile(
                                          name: item['name'],
                                          type: item['type'],
                                        ),
                                      ),
                                    ),
                                    child: GradientText(
                                      text: 'View Profile',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      gradientDirection: GradientDirection.ttb,
                                      colors: const [
                                        primaryColor,
                                        lightBlueColor,
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Messages(name: item['name']),
                                      ),
                                    ),
                                    child: GradientText(
                                      text: 'Message',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      gradientDirection: GradientDirection.ttb,
                                      colors: const [
                                        primaryColor,
                                        lightBlueColor,
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  divider() {
    return Container(
      width: width * 0.35,
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.5),
            spreadRadius: 0.3,
            blurRadius: 0.3,
          ),
        ],
      ),
    );
  }
}
