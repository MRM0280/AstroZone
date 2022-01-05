import 'package:astro_zone/pages/screens.dart';
import 'package:astro_zone/widget/column_builder.dart';

class BirthChart extends StatelessWidget {
  BirthChart({Key key}) : super(key: key);

  final birthDataList = [
    {
      'planet': 'Sun',
      'degree': '15',
      'sign': 'Aquarius',
      'minutes': '45',
    },
    {
      'planet': 'Moon',
      'degree': '7',
      'sign': 'Libra',
      'minutes': '25',
    },
    {
      'planet': 'Mercury',
      'degree': '15',
      'sign': 'Aquarius',
      'minutes': '20',
    },
    {
      'planet': 'Venus',
      'degree': '7',
      'sign': 'Pisces',
      'minutes': '38',
    },
    {
      'planet': 'Mars',
      'degree': '15',
      'sign': 'Scorpio',
      'minutes': '08',
    },
    {
      'planet': 'Jupiter',
      'degree': '7',
      'sign': 'Pisces',
      'minutes': '20',
    },
    {
      'planet': 'Saturn',
      'degree': '15',
      'sign': 'Aries',
      'minutes': '49',
    },
    {
      'planet': 'Uranus',
      'degree': '7',
      'sign': 'Aquarius',
      'minutes': '51',
    },
    {
      'planet': 'Naptune',
      'degree': '7',
      'sign': 'Aquarius',
      'minutes': '20',
    },
    {
      'planet': 'Pluto',
      'degree': '15',
      'sign': 'Sagittarius',
      'minutes': '26',
    },
    {
      'planet': 'North Node',
      'degree': '7',
      'sign': 'Leo',
      'minutes': '32',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                children: [
                  birthHoroscope(),
                  birthData(),
                  heightSpace,
                  heightSpace,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: fixPadding * 3.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(maxWidth: 24),
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios),
                  color: whiteColor,
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Text(
                  'Birth Horoscope',
                  style: white18BoldTextStyle,
                ),
                Text(
                  'With Natal Chart',
                  style: white13RegularTextStyle,
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/bg3.png',
            height: 160,
            width: 160,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  birthHoroscope() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About your birth horoscope',
            style: black16BoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            'Lorem Ipsum is simply dummy text of the printing and dummy typesetting industry.',
            style: grey12RegularTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            'Lorem Ipsum has been the industry\'s standard dummy text evei ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            style: grey12RegularTextStyle,
          ),
        ],
      ),
    );
  }

  birthData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your astrological birth data',
          style: black16BoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding / 2,
          ),
          decoration: const BoxDecoration(color: Color(0xfff4f5f8)),
          child: Table(
            columnWidths: const {
              0: FractionColumnWidth(.08),
              1: FractionColumnWidth(.03),
              2: FractionColumnWidth(.27),
              3: FractionColumnWidth(.001),
            },
            children: [
              TableRow(
                children: [
                  Text(
                    'Planet',
                    style: black12MediumTextStyle,
                  ),
                  Text(
                    'Pisition\nDegrees',
                    textAlign: TextAlign.center,
                    style: black12MediumTextStyle,
                  ),
                  Text(
                    'Sign',
                    textAlign: TextAlign.center,
                    style: black12MediumTextStyle,
                  ),
                  Text(
                    'Position\nMinutes',
                    textAlign: TextAlign.center,
                    style: black12MediumTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
        ColumnBuilder(
          itemCount: birthDataList.length,
          itemBuilder: (context, index) {
            final item = birthDataList[index];
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding,
              ),
              decoration: BoxDecoration(
                color: index % 2 == 0 ? whiteColor : const Color(0xfff4f5f8),
              ),
              child: Table(
                columnWidths: const {
                  0: FractionColumnWidth(.08),
                  1: FractionColumnWidth(.03),
                  2: FractionColumnWidth(.27),
                  3: FractionColumnWidth(.001),
                },
                children: [
                  TableRow(
                    children: [
                      Text(
                        item['planet'],
                        style: black13MediumTextStyle,
                      ),
                      Text(
                        item['degree'],
                        textAlign: TextAlign.center,
                        style: black13MediumTextStyle,
                      ),
                      Text(
                        item['sign'],
                        textAlign: TextAlign.center,
                        style: black13MediumTextStyle,
                      ),
                      Text(
                        item['minutes'],
                        textAlign: TextAlign.center,
                        style: black13MediumTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
