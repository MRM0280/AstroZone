import 'package:astro_zone/pages/screens.dart';
import 'package:astro_zone/widget/column_builder.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';

class PremiumSubscription extends StatefulWidget {
  const PremiumSubscription({Key key}) : super(key: key);

  @override
  _PremiumSubscriptionState createState() => _PremiumSubscriptionState();
}

class _PremiumSubscriptionState extends State<PremiumSubscription> {
  int isSelected = 0;
  final planList = [
    {
      'time': '12 MONTH',
      'detail': 'Lorem Ipsum is simply dummy text',
      'price': '\$12.99',
    },
    {
      'time': '6 MONTH',
      'detail': 'Lorem Ipsum is simply dummy text',
      'price': '\$6.99',
    },
    {
      'time': '3 MONTH',
      'detail': 'Lorem Ipsum is simply dummy text',
      'price': '\$4.99',
    },
    {
      'time': '1 MONTH',
      'detail': 'Lorem Ipsum is simply dummy text',
      'price': '\$1.99',
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
                padding: const EdgeInsets.all(fixPadding * 2.0),
                children: [
                  unlockPremium(),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  selectPlan(),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  continueButton(),
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
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(maxWidth: 24),
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
            color: whiteColor,
          ),
          Text(
            'Premium Subscription',
            style: white18BoldTextStyle,
          ),
        ],
      ),
    );
  }

  unlockPremium() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Unlock Premium',
          style: black16BoldTextStyle,
        ),
        Text(
          'No commitment. Cancel anytime',
          style: grey12RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        detail('Detailed Horoscope'),
        heightSpace,
        heightSpace,
        detail('Compatibility Feature'),
        heightSpace,
        heightSpace,
        detail('Numerology Feature'),
        heightSpace,
        heightSpace,
        detail('Palm Reading Feature'),
      ],
    );
  }

  detail(detail) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(fixPadding / 5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [primaryColor, lightBlueColor],
            ),
          ),
          child: const Icon(
            Icons.done,
            color: whiteColor,
            size: 10,
          ),
        ),
        widthSpace,
        widthSpace,
        widthSpace,
        Text(
          detail,
          style: black13MediumTextStyle,
        ),
      ],
    );
  }

  selectPlan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select your Plan',
          style: black16BoldTextStyle,
        ),
        ColumnBuilder(
          itemCount: planList.length,
          itemBuilder: (context, index) {
            final item = planList[index];
            return Padding(
              padding: const EdgeInsets.only(top: fixPadding * 2.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isSelected = index;
                  });
                },
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: isSelected == index
                          ? const EdgeInsets.only(top: fixPadding * 2.0)
                          : EdgeInsets.zero,
                      padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding * 1.5,
                        vertical: fixPadding / 2,
                      ),
                      decoration: isSelected == index
                          ? BoxDecoration(
                              color: lightBlueColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 2),
                                  color: lightBlueColor.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                ),
                              ],
                              image: const DecorationImage(
                                image: AssetImage('assets/bg2.png'),
                                fit: BoxFit.cover,
                              ),
                            )
                          : BoxDecoration(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: isSelected == index ? 20 : 0),
                          Text(
                            item['time'],
                            style: isSelected == index
                                ? white11BoldletterSpacingTextStyle
                                : black11BoldletterSpacingTextStyle,
                          ),
                          Text(
                            item['detail'],
                            style: isSelected == index
                                ? white11RegularTextStyle
                                : black11RegularTextStyle,
                          ),
                          heightSpace,
                          heightSpace,
                          Text(
                            item['price'],
                            style: isSelected == index
                                ? white22BlackTextStyle
                                : black22BlackTextStyle,
                          ),
                        ],
                      ),
                    ),
                    isSelected == index
                        ? Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: fixPadding * 2.0,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(20),
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
                                  text: isSelected == 0
                                      ? 'Most Popular'
                                      : item['time'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                  colors: const [primaryColor, lightBlueColor],
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  continueButton() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SelectPaymentMethod()),
      ),
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
          'Continue',
          style: white16BoldTextStyle,
        ),
      ),
    );
  }
}
