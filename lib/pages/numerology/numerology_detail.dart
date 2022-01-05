import 'package:astro_zone/pages/screens.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// ignore: must_be_immutable
class NumerologyDetail extends StatelessWidget {
  final String date;
  NumerologyDetail({Key key, this.date}) : super(key: key);

  double height;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
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
                  luckyNumber(),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  character(),
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
            'Numerology ',
            style: white18BoldTextStyle,
          ),
          Text(
            date == '' ? '11-17-1999' : '($date)',
            style: white12RegularTextStyle,
          ),
        ],
      ),
    );
  }

  luckyNumber() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 4.0,
            vertical: fixPadding * 2.0,
          ),
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
          child: GradientText(
            text: '3',
            style: const TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w800,
            ),
            colors: const [primaryColor, lightBlueColor],
          ),
        ),
        heightSpace,
        Text(
          'Lucky number',
          style: black12BoldTextStyle,
        ),
      ],
    );
  }

  character() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 10,
            mainAxisExtent: 140,
          ),
          children: [
            chart(
              title: 'Funny',
              percentage: 0.60,
              color: const Color(0xff37BECE),
              shadowColor: const Color(0xff37BECE).withOpacity(0.4),
            ),
            chart(
              title: 'Responsible',
              percentage: 0.25,
              color: const Color(0xffAF6FBA),
              shadowColor: const Color(0xffAF6FBA).withOpacity(0.4),
            ),
            chart(
              title: 'Honest',
              percentage: 0.80,
              color: const Color(0xffC33271),
              shadowColor: const Color(0xffC33271).withOpacity(0.4),
            ),
            chart(
              title: 'Obedient',
              percentage: 0.75,
              color: const Color(0xffCE5937),
              shadowColor: const Color(0xffCE5937).withOpacity(0.4),
            ),
            chart(
              title: 'Hard working',
              percentage: 0.90,
              color: const Color(0xff138077),
              shadowColor: const Color(0xff138077).withOpacity(0.4),
            ),
            chart(
              title: 'Smart',
              percentage: 0.50,
              color: const Color(0xff49599A),
              shadowColor: const Color(0xff49599A).withOpacity(0.4),
            ),
          ],
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'About Cahracter',
          style: black16BoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          'Lorem Ipsum is simply dummy text of the printing and type are typesetting industry.It is a long established fact that a reader be will be distracted by the readable content of a page when looking at its layout.',
          style: grey12RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'About Behaviour',
          style: black16BoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          'Lorem Ipsum is simply dummy text of the printing and type are typesetting industry.It is a long established fact that a reader be will be distracted by the readable content of a page when looking at its layout.',
          style: grey12RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'About Career',
          style: black16BoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          'Lorem Ipsum is simply dummy text of the printing and type are typesetting industry.It is a long established fact that a reader be will be distracted by the readable content of a page when looking at its layout.',
          style: grey12RegularTextStyle,
        ),
      ],
    );
  }

  chart({title, percentage, Color color, Color shadowColor}) {
    double value = percentage;
    var pr = value.toStringAsFixed(2).substring(2, 4);
    return Column(
      children: [
        CircularPercentIndicator(
          linearGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [shadowColor, color],
          ),
          radius: height * 0.11,
          lineWidth: 9.5,
          percent: percentage,
          backgroundColor: greyColor.withOpacity(0.2),
          center: Text(
            '$pr%',
            style: black15BoldTextStyle,
          ),
        ),
        heightSpace,
        Text(
          title,
          style: black13SemiBoldTextStyle,
        ),
      ],
    );
  }
}
