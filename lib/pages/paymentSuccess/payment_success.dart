import 'dart:async';

import 'package:astro_zone/pages/screens.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key key}) : super(key: key);

  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        currentIndex = 0;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomBar()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline_rounded,
                color: whiteColor,
                size: 100,
              ),
              heightSpace,
              Text(
                'congratulations payment successfully paid\nNow, You are a subscribed user',
                textAlign: TextAlign.center,
                style: white14RegularTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
