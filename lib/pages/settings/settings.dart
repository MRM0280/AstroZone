import 'package:astro_zone/pages/screens.dart';
import 'package:flutter/cupertino.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool notification = true;
  bool location = true;

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
                  notifications(),
                  locations(),
                  heightSpace,
                  Text(
                    'Clear Cache',
                    style: black14MediumTextStyle,
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    'Connected Services',
                    style: black14MediumTextStyle,
                  ),
                  Text(
                    'Google,Instagram,Facebook,Twitter',
                    style: grey12RegularTextStyle,
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    'Privacy Policy',
                    style: black14MediumTextStyle,
                  ),
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
            'Settings',
            style: white18BoldTextStyle,
          ),
        ],
      ),
    );
  }

  notifications() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Notifications',
          style: black14MediumTextStyle,
        ),
        Transform.scale(
          scale: 0.5,
          child: CupertinoSwitch(
            activeColor: primaryColor,
            trackColor: greyColor.withOpacity(0.6),
            value: notification,
            onChanged: (bool value) {
              setState(() {
                notification = value;
              });
            },
          ),
        ),
      ],
    );
  }

  locations() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Location',
          style: black14MediumTextStyle,
        ),
        Transform.scale(
          scale: 0.5,
          child: CupertinoSwitch(
            activeColor: primaryColor,
            trackColor: greyColor.withOpacity(0.6),
            value: location,
            onChanged: (bool value) {
              setState(() {
                location = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
