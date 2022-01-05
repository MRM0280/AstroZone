import 'package:astro_zone/pages/screens.dart';

class PalmReading extends StatelessWidget {
  const PalmReading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg4.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Column(
                children: [
                  appBar(context),
                  const SizedBox(height: 135),
                  Image.asset(
                    'assets/palmReading.png',
                    height: 430,
                    width: 430,
                  ),
                ],
              ),
              Positioned(
                top: 444,
                left: 0,
                right: 0,
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: lightBlueColor,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff9a67ff).withOpacity(0.5),
                        spreadRadius: 10,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 75,
                left: 35,
                child: Container(
                  width: 115,
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Love',
                    style: black15SemiBoldTextStyle,
                  ),
                ),
              ),
              Positioned(
                bottom: 83,
                right: 68,
                child: Container(
                  width: 115,
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Money',
                    style: black15SemiBoldTextStyle,
                  ),
                ),
              ),
              Positioned(
                bottom: 225,
                left: 35,
                child: Container(
                  width: 115,
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Emotion',
                    style: black15SemiBoldTextStyle,
                  ),
                ),
              ),
              Positioned(
                bottom: 285,
                right: 45,
                child: Container(
                  width: 115,
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Intellect',
                    style: black15SemiBoldTextStyle,
                  ),
                ),
              ),
              Positioned(
                bottom: 445,
                left: 45,
                child: Container(
                  width: 115,
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Success',
                    style: black15SemiBoldTextStyle,
                  ),
                ),
              ),
              Positioned(
                bottom: 468,
                right: 70,
                child: Container(
                  width: 115,
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Health',
                    style: black15SemiBoldTextStyle,
                  ),
                ),
              ),
              Positioned(
                bottom: 550,
                right: 20,
                child: Container(
                  width: 115,
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Family',
                    style: black15SemiBoldTextStyle,
                  ),
                ),
              ),
            ],
          ),
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
            'Palm Reading',
            style: white18BoldTextStyle,
          ),
        ],
      ),
    );
  }
}
