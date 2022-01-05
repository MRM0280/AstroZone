import 'package:astro_zone/pages/screens.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// ignore: must_be_immutable
class WorkCompatibility extends StatelessWidget {
  final String compatibility;
  final String sign1;
  final String sign2;
  WorkCompatibility({Key key, this.compatibility, this.sign1, this.sign2})
      : super(key: key);

  double height;
  double width;

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
                padding:
                    const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                children: [
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  workCompatibility(),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  overallCompatibility(),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  matchButton(context),
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
            compatibility,
            style: white18BoldTextStyle,
          ),
          widthSpace,
          Text(
            '($sign1 - $sign2)',
            style: white12RegularTextStyle,
          ),
        ],
      ),
    );
  }

  workCompatibility() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lorem Ipsum is simply dummy text of the printing and type set typesetting industry.',
          style: grey12RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Padding(
              padding: const EdgeInsets.only(top: fixPadding * 3.0),
              child: Column(
                children: [
                  CircularPercentIndicator(
                    linearGradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff7B87A3),
                        Color(0xff2FA8CC),
                      ],
                    ),
                    backgroundColor: greyColor.withOpacity(0.2),
                    radius: height * 0.055,
                    lineWidth: 6.0,
                    percent: 0.50,
                  ),
                  heightSpace,
                  Text(
                    '50%',
                    style: black11BlackTextStyle,
                  ),
                ],
              ),
            ),
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
          ],
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
          style: grey12RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
          style: grey12RegularTextStyle,
        ),
      ],
    );
  }

  overallCompatibility() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overall Compatibility',
          style: black16BoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          'Lorem Ipsum is simply dummy text of the printing and type set typesetting industry.',
          style: grey12RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
          style: grey12RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
          style: grey12RegularTextStyle,
        ),
      ],
    );
  }

  matchButton(context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
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
          'Try Another Match',
          style: white16BoldTextStyle,
        ),
      ),
    );
  }
}
