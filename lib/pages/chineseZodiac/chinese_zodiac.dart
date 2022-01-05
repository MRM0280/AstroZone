import 'package:astro_zone/pages/screens.dart';

class ChineseZodiac extends StatefulWidget {
  const ChineseZodiac({Key key}) : super(key: key);

  @override
  _ChineseZodiacState createState() => _ChineseZodiacState();
}

class _ChineseZodiacState extends State<ChineseZodiac> {
  String isSelected = 'Rabbit';

  final chineseZodiacSignList = [
    {
      'image': 'assets/horoscopes/rat.png',
      'name': 'Rat',
      'years': '1960,1972,1984,\n1996,2008,2020',
    },
    {
      'image': 'assets/horoscopes/ox.png',
      'name': 'Ox',
      'years': '1961,1973,1985,\n1197,2209,2021',
    },
    {
      'image': 'assets/horoscopes/tiger.png',
      'name': 'Tiger',
      'years': '1962,1974,1986,\n1998,2010',
    },
    {
      'image': 'assets/horoscopes/rabbit.png',
      'name': 'Rabbit',
      'years': '1963,1975,1987,\n1999.2011',
    },
    {
      'image': 'assets/horoscopes/dragon.png',
      'name': 'Dragon',
      'years': '1964,1976,1989,\n2000,2012',
    },
    {
      'image': 'assets/horoscopes/snake.png',
      'name': 'Snake',
      'years': '1965,1977,1990,\n2001,2013',
    },
    {
      'image': 'assets/horoscopes/horse.png',
      'name': 'Horse',
      'years': '1966,1978,1991,\n2002,2014',
    },
    {
      'image': 'assets/horoscopes/sheep.png',
      'name': 'Sheep',
      'years': '1967,1979,1992,\n2003,2015',
    },
    {
      'image': 'assets/horoscopes/monkey.png',
      'name': 'Monkey',
      'years': '1968,1980,1993,\n2004,2016',
    },
    {
      'image': 'assets/horoscopes/rooster.png',
      'name': 'Rooster',
      'years': '1969,1981,1994,\n2005,2017',
    },
    {
      'image': 'assets/horoscopes/dog.png',
      'name': 'Dog',
      'years': '1970,1982,1995,\n2006,2018',
    },
    {
      'image': 'assets/horoscopes/pig.png',
      'name': 'Pig',
      'years': '1971,1983,1996,\n2008,2019',
    },
  ];

  final moreHoroscopeList = [
    {
      'image': 'assets/horoscopes/weekly_horoscope.png',
      'horoscope': 'Weekly Chinese\nHoroscope',
      'time': 'Aug15 - Aug21',
    },
    {
      'image': 'assets/horoscopes/weekly_horoscope.png',
      'horoscope': 'Monthly Chinese\nHoroscope',
      'time': 'Aug15 - Aug21',
    },
  ];

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
                  zodiacSigns(),
                  moreHoroscope(),
                  aboutHoroscope(),
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
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(maxWidth: 24),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
                color: whiteColor,
              ),
              Text(
                'Daily Chinese Horoscopes',
                style: white18BoldTextStyle,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: fixPadding * 2.5),
            child: Text(
              'Choose your sign',
              style: white12RegularTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  zodiacSigns() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding * 2.0,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 13,
        mainAxisSpacing: 10,
        mainAxisExtent: 100,
      ),
      shrinkWrap: true,
      itemCount: chineseZodiacSignList.length,
      itemBuilder: (context, index) {
        final item = chineseZodiacSignList[index];
        return InkWell(
          onTap: () {
            setState(() {
              isSelected = item['name'];
            });
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(fixPadding),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: isSelected == item['name']
                            ? [primaryColor, lightBlueColor]
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
                ],
              ),
              const SizedBox(height: 3),
              Text(
                item['name'],
                style: black9MediumTextStyle,
              ),
              const SizedBox(height: 3),
              Text(
                item['years'],
                textAlign: TextAlign.center,
                style: grey9RegularTextStyle,
              ),
            ],
          ),
        );
      },
    );
  }

  moreHoroscope() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'More personalized horoscopes',
            style: black16BoldTextStyle,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.18,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: moreHoroscopeList.length,
            itemBuilder: (context, index) {
              final item = moreHoroscopeList[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  index == 0 ? fixPadding * 2.0 : 0,
                  fixPadding * 1.5,
                  fixPadding * 2.0,
                  fixPadding * 2.0,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: blackColor.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['horoscope'],
                            style: black13MediumTextStyle,
                          ),
                          Text(
                            item['time'],
                            style: black12RegularTextStyle,
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Image.asset(
                          item['image'],
                          height: 55,
                          width: 55,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  aboutHoroscope() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About personalized horoscopes',
            style: black16BoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesett typesetting industry. Lorem Ipsum has been the industry\'s text standard dummy text.',
            style: grey12RegularTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            'Lorem Ipsum is simply dummy text of the printing and tyepsett typesetting industry. Lorem Ipsum has been the industry\'s text standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type booi specimen book.',
            style: grey12RegularTextStyle,
          ),
        ],
      ),
    );
  }
}
