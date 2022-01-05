import 'dart:io';

import 'package:astro_zone/pages/screens.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Signin extends StatefulWidget {
  const Signin({Key key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool visible = true;
  DateTime currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: whiteColor,
        image: DecorationImage(
          image: AssetImage('assets/corner_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: WillPopScope(
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      logo(),
                      Padding(
                        padding: const EdgeInsets.all(fixPadding * 2.0),
                        child: Text(
                          'Sign In',
                          style: black21BoldTextStyle,
                        ),
                      ),
                      nameTextField(),
                      passwordTextField(),
                      signinButton(),
                      signup(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: blackColor,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }

  logo() {
    return Center(
      child: Image.asset(
        'assets/logo.png',
        height: 80,
        width: 160,
      ),
    );
  }

  nameTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: greyColor)),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/profile.png',
            color: greyColor,
            height: 16,
            width: 16,
          ),
          widthSpace,
          widthSpace,
          Expanded(
            child: TextField(
              keyboardType: TextInputType.name,
              cursorColor: primaryColor,
              style: black14SemiBoldTextStyle,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'User Name',
                hintStyle: grey14MediumTextStyle,
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  passwordTextField() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: greyColor)),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.lock,
                  color: greyColor,
                  size: 20,
                ),
                widthSpace,
                widthSpace,
                Expanded(
                  child: TextField(
                    obscureText: !visible,
                    cursorColor: primaryColor,
                    style: black14SemiBoldTextStyle,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Password',
                      hintStyle: grey14MediumTextStyle,
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                  child: Icon(
                    visible ? Icons.visibility : Icons.visibility_off,
                    color: greyColor,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
          heightSpace,
          Text(
            'Forget password?',
            style: grey12RegularTextStyle,
          ),
        ],
      ),
    );
  }

  signinButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding,
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Signup()),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: fixPadding * 1.3),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
              ),
            ],
          ),
          child: GradientText(
            text: 'Sign In',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            gradientDirection: GradientDirection.ttb,
            colors: const [
              primaryColor,
              lightBlueColor,
            ],
          ),
        ),
      ),
    );
  }

  signup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have account? ',
          style: black16MediumTextStyle,
        ),
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Signup()),
          ),
          child: GradientText(
            text: 'Sign Up',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            colors: const [primaryColor, lightBlueColor],
          ),
        ),
      ],
    );
  }
}
