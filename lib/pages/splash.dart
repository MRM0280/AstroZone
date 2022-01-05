import 'dart:async';
import 'dart:io';

import 'package:astro_zone/pages/screens.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Onboarding()),
      ),
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
      child: WillPopScope(
        onWillPop: () => exit(0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Image.asset(
              'assets/logo1.png',
              height: 250,
              width: 250,
            ),
          ),
        ),
      ),
    );
  }
}
