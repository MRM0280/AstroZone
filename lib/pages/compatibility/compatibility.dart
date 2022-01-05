import 'package:astro_zone/pages/screens.dart';

class Compatibility extends StatefulWidget {
  const Compatibility({Key key}) : super(key: key);

  @override
  _CompatibilityState createState() => _CompatibilityState();
}

class _CompatibilityState extends State<Compatibility> {
  double height;
  double width;
  String sign1 = 'Libra';
  String sign2 = 'Gemini';
  String isSelected = 'Work Compatibility';

  final compatibilityTypeList = [
    {
      'image': 'assets/icons/work.png',
      'compatibility': 'Work Compatibility',
    },
    {
      'image': 'assets/icons/love.png',
      'compatibility': 'Love Compatibility',
    },
    {
      'image': 'assets/icons/chinese_compatibility.png',
      'compatibility': 'Chinese Compatibility',
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
            appBar(context),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  selectCompatibility(),
                  compatibilityDetails(),
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
            'Compatibility',
            style: white18BoldTextStyle,
          ),
        ],
      ),
    );
  }

  selectCompatibility() {
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
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
            textAlign: TextAlign.center,
            style: grey12RegularTextStyle,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.0,
            vertical: fixPadding / 2,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
          ),
          itemCount: compatibilityTypeList.length,
          itemBuilder: (context, index) {
            final item = compatibilityTypeList[index];
            return InkWell(
              onTap: () {
                setState(() {
                  isSelected = item['compatibility'];
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: isSelected == item['compatibility']
                        ? [
                            primaryColor,
                            lightBlueColor,
                          ]
                        : [whiteColor, whiteColor],
                  ),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: isSelected == item['compatibility']
                          ? primaryColor.withOpacity(0.2)
                          : blackColor.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item['compatibility'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isSelected == item['compatibility']
                            ? whiteColor
                            : greyColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    Image.asset(
                      item['image'],
                      color: isSelected == item['compatibility']
                          ? whiteColor
                          : greyColor,
                      height: 30,
                      width: 30,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  compatibilityDetails() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 1.5,
        fixPadding * 2.0,
        fixPadding * 2.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isSelected,
            style: black16BoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
            style: grey12RegularTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Align(
            alignment: Alignment.center,
            child: Text(
              'CHOOSE TWO SIGN TO CREATE YOUR MATCH',
              style: black12BoldTextStyle,
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: height * 0.1,
                        width: width / 2 - 55,
                        margin: const EdgeInsets.only(top: fixPadding * 2.3),
                        padding: const EdgeInsets.all(fixPadding),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 2),
                              color: blackColor.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              sign1,
                              style: blue12SemiBoldTextStyle,
                            ),
                            heightSpace,
                            Text(
                              'Sep 22 - Oct 23',
                              style: blue12SemiBoldTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 50,
                        child: Image.asset(
                          'assets/icons/libra.png',
                          height: 45,
                          width: 45,
                        ),
                      ),
                    ],
                  ),
                  heightSpace,
                  heightSpace,
                  Container(
                    width: width / 2 - 55,
                    padding: const EdgeInsets.symmetric(
                      horizontal: fixPadding,
                      vertical: fixPadding / 4,
                    ),
                    decoration: BoxDecoration(
                      color: greyColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        elevation: 0,
                        isDense: true,
                        hint: Text(
                          sign1,
                          style: black12MediumTextStyle,
                        ),
                        iconEnabledColor: blackColor,
                        value: sign1,
                        style: black12MediumTextStyle,
                        onChanged: (String newValue) {
                          setState(() {
                            sign1 = newValue;
                          });
                        },
                        items: <String>[
                          'Gemini',
                          'Aries',
                          'Taurus',
                          'Pisces',
                          'Aquarius',
                          'Leo',
                          'Cancer',
                          'Sagitarius',
                          'Scorpio',
                          'Libra',
                          'Vigro',
                          'Capricorn',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: fixPadding * 4.5),
                child: Icon(
                  Icons.add,
                  color: greyColor,
                  size: 30,
                ),
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: height * 0.1,
                        width: width / 2 - 55,
                        margin: const EdgeInsets.only(top: fixPadding * 2.3),
                        padding: const EdgeInsets.all(fixPadding),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 2),
                              color: blackColor.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              sign2,
                              style: pink12SemiBoldTextStyle,
                            ),
                            heightSpace,
                            Text(
                              'May 20 - June 21',
                              style: pink12SemiBoldTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 50,
                        child: Image.asset(
                          'assets/icons/gemini.png',
                          height: 45,
                          width: 45,
                        ),
                      ),
                    ],
                  ),
                  heightSpace,
                  heightSpace,
                  Container(
                    width: width / 2 - 55,
                    padding: const EdgeInsets.symmetric(
                      horizontal: fixPadding,
                      vertical: fixPadding / 4,
                    ),
                    decoration: BoxDecoration(
                      color: greyColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        elevation: 0,
                        isDense: true,
                        hint: Text(
                          sign2,
                          style: black12MediumTextStyle,
                        ),
                        iconEnabledColor: blackColor,
                        value: sign2,
                        style: black12MediumTextStyle,
                        onChanged: (String newValue) {
                          setState(() {
                            sign2 = newValue;
                          });
                        },
                        items: <String>[
                          'Gemini',
                          'Aries',
                          'Taurus',
                          'Pisces',
                          'Aquarius',
                          'Leo',
                          'Cancer',
                          'Sagitarius',
                          'Scorpio',
                          'Libra',
                          'Vigro',
                          'Capricorn',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          getCompatibilityButton(),
        ],
      ),
    );
  }

  getCompatibilityButton() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WorkCompatibility(
            compatibility: isSelected,
            sign1: sign1,
            sign2: sign2,
          ),
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(fixPadding * 1.3),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [primaryColor, lightBlueColor],
          ),
        ),
        child: Text(
          'Get Your Compatibility',
          style: white16BoldTextStyle,
        ),
      ),
    );
  }
}
