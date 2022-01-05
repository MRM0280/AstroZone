import 'package:astro_zone/pages/screens.dart';
import 'package:astro_zone/widget/column_builder.dart';
import 'package:dropdown_date_picker/dropdown_date_picker.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ZodiacSignDetail extends StatefulWidget {
  final String image;
  final String name;
  const ZodiacSignDetail({Key key, this.name, this.image}) : super(key: key);

  @override
  _ZodiacSignDetailState createState() => _ZodiacSignDetailState();
}

class _ZodiacSignDetailState extends State<ZodiacSignDetail> {
  double height;
  int day = 3;
  String isSelected = 'Yesterday';
  final now = DateTime.now();

  final dayList = [
    {'day': 'S'},
    {'day': 'M'},
    {'day': 'T'},
    {'day': 'W'},
    {'day': 'T'},
    {'day': 'F'},
    {'day': 'S'},
  ];

  final horoscopeList = [
    {
      'image': 'assets/icons/love.png',
      'title': 'Love',
      'color': const Color(0xffff0000),
      'shadowColor': const Color(0xffFFABAB),
      'percentage': 0.50,
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesett ing industry. Lorem Ipsum has been the industry\'s standard eit dummy text ever since the 1500s.',
    },
    {
      'image': 'assets/icons/luck.png',
      'title': 'Luck',
      'color': const Color(0xff0090ff),
      'shadowColor': const Color(0xffB3DEFF),
      'percentage': 0.77,
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesett ing industry. Lorem Ipsum has been the industry\'s standard eit dummy text ever since the 1500s.',
    },
    {
      'image': 'assets/icons/health.png',
      'title': 'Health',
      'color': const Color(0xffffe400),
      'shadowColor': const Color(0xffFFF6A7),
      'percentage': 0.80,
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesett ing industry. Lorem Ipsum has been the industry\'s standard eit dummy text ever since the 1500s.',
    },
    {
      'image': 'assets/icons/money.png',
      'title': 'Money',
      'color': const Color(0xff3fb200),
      'shadowColor': const Color(0xffCCECBA),
      'percentage': 0.69,
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesett ing industry. Lorem Ipsum has been the industry\'s standard eit dummy text ever since the 1500s.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  selectDay(),
                  signs(),
                  horoscope(),
                  popularOnAstroZone(),
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
          Column(
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
                    '${widget.name} Daily Horoscope',
                    style: white18BoldTextStyle,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: fixPadding * 2.5),
                child: Text(
                  'For August 18, 2021 By K.N Rao\nSep23 - Oct22',
                  style: white12RegularTextStyle,
                ),
              ),
            ],
          ),
          widthSpace,
          widthSpace,
          widthSpace,
          widthSpace,
          Image.asset(
            widget.image,
            color: lightBlueColor,
            height: 50,
            width: 50,
          ),
        ],
      ),
    );
  }

  selectDay() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        SizedBox(
          height: height * 0.05,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dayList.length,
            itemBuilder: (context, index) {
              final item = dayList[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? fixPadding * 2.0 : 0,
                  right: fixPadding,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      day = index;
                    });
                  },
                  child: Container(
                    height: height * 0.04,
                    width: height * 0.04,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: day == index
                            ? [primaryColor, lightBlueColor]
                            : [whiteColor, whiteColor],
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Text(
                      item['day'],
                      style: TextStyle(
                        color: day == index ? whiteColor : greyColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.0,
            vertical: fixPadding * 2.0,
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = 'Yesterday';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding * 1.5,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: isSelected == 'Yesterday'
                            ? primaryColor
                            : greyColor),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: GradientText(
                    text: 'Yesterday',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    gradientDirection: GradientDirection.ttb,
                    colors: isSelected == 'Yesterday'
                        ? [
                            primaryColor,
                            lightBlueColor,
                          ]
                        : [
                            greyColor,
                            greyColor,
                          ],
                  ),
                ),
              ),
              widthSpace,
              widthSpace,
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = 'Tomorrow';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding * 1.5,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: isSelected == 'Tomorrow'
                            ? primaryColor
                            : greyColor),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: GradientText(
                    text: 'Tomorrow',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    gradientDirection: GradientDirection.ttb,
                    colors: isSelected == 'Tomorrow'
                        ? [
                            primaryColor,
                            lightBlueColor,
                          ]
                        : [
                            greyColor,
                            greyColor,
                          ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  signs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Check out other signs',
            style: black16BoldTextStyle,
          ),
          heightSpace,
          Text(
            'Aries • Taurus • Gemini • Cancer • Leo • Vigro • Libra •Scorpio • Sagittarius • Capricorn • Aquarius • Pisces',
            style: grey11RegularTextStyle,
          ),
        ],
      ),
    );
  }

  horoscope() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Text(
              'August 18, 2021',
              style: black16BoldTextStyle,
            ),
          ),
          heightSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesett ing industry. Lorem Ipsum has been the industry\'s standard of dummy text ever since the 1500s, when an unknown printer it’s took a galley of type and scrambled it to make a type specimen book.',
              style: grey12RegularTextStyle,
            ),
          ),
          heightSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Row(
              children: [
                Text(
                  '• Lucky Colors: ',
                  style: black12MediumTextStyle,
                ),
                Text(
                  'white,yellow,green',
                  style: grey12RegularTextStyle,
                ),
              ],
            ),
          ),
          heightSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Row(
              children: [
                Text(
                  '• Lucky Numbers: ',
                  style: black12MediumTextStyle,
                ),
                Text(
                  '1,4',
                  style: grey12RegularTextStyle,
                ),
              ],
            ),
          ),
          heightSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Row(
              children: [
                Text(
                  '• Lucky Flowers: ',
                  style: black12MediumTextStyle,
                ),
                Text(
                  'tulip,moming glory,peach blossom',
                  style: grey12RegularTextStyle,
                ),
              ],
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          SizedBox(
            height: height * 0.13,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: horoscopeList.length,
              itemBuilder: (context, index) {
                final item = horoscopeList[index];
                double pr = item['percentage'];
                var percentage = pr.toStringAsFixed(2).substring(2, 4);
                return Padding(
                  padding: (index == 0)
                      ? const EdgeInsets.symmetric(horizontal: fixPadding)
                      : const EdgeInsets.only(right: fixPadding),
                  child: Column(
                    children: [
                      Text(
                        item['title'],
                        style: black12SemiBoldTextStyle,
                      ),
                      heightSpace,
                      CircularPercentIndicator(
                        linearGradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            item['shadowColor'],
                            item['color'],
                          ],
                        ),
                        backgroundColor: greyColor.withOpacity(0.2),
                        radius: height * 0.1,
                        lineWidth: 7.0,
                        percent: item['percentage'],
                        center: Text(
                          '${percentage.toString()}%',
                          style: black16RegularTextStyle,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ColumnBuilder(
            itemCount: horoscopeList.length,
            itemBuilder: (context, index) {
              final item = horoscopeList[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Row(
                      children: [
                        Image.asset(
                          item['image'],
                          height: 16,
                          width: 16,
                          color: item['color'],
                        ),
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        Text(
                          item['title'],
                          style: TextStyle(
                            color: item['color'],
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    heightSpace,
                    Text(
                      item['detail'],
                      style: grey12RegularTextStyle,
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

  popularOnAstroZone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Most popular on Astro Zone',
            style: black16BoldTextStyle,
          ),
          heightSpace,
          Text(
            'Free Birth Chart',
            style: black14SemiBoldTextStyle,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(fixPadding / 2),
            margin: const EdgeInsets.symmetric(vertical: fixPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [primaryColor, lightBlueColor],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Discover the key to your unique\nlife path & personality',
                  textAlign: TextAlign.center,
                  style: white13SemiBoldTextStyle,
                ),
                heightSpace,
                heightSpace,
                Text(
                  'ENTER YOUR BIRTH DATE',
                  style: white11BoldTextStyle,
                ),
                heightSpace,
                heightSpace,
                Center(
                  child: Container(
                    width: 200,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: whiteColor),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: DropdownDatePicker(
                      firstDate:
                          ValidDate(year: now.year - 100, month: 1, day: 1),
                      lastDate: ValidDate(
                          year: now.year, month: now.month, day: now.day),
                      dateHint: const DateHint(
                          month: 'Month', day: 'Day', year: 'Year'),
                      dateFormat: DateFormat.mdy,
                      textStyle: white11SemiBoldTextStyle,
                      dropdownColor: lightBlueColor,
                      ascending: false,
                      underLine: Container(),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BirthChartInfo()),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(fixPadding),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: GradientText(
                      text: 'Get Your Free Birth Chart',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                      gradientDirection: GradientDirection.ttb,
                      colors: const [primaryColor, lightBlueColor],
                    ),
                  ),
                ),
                heightSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
