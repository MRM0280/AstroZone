import 'package:astro_zone/pages/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BirthChartInfo extends StatefulWidget {
  const BirthChartInfo({Key key}) : super(key: key);

  @override
  _BirthChartInfoState createState() => _BirthChartInfoState();
}

class _BirthChartInfoState extends State<BirthChartInfo> {
  String gender;
  bool accept = false;
  String selectedDate = '17/11/1999';
  TimeOfDay _time = const TimeOfDay(hour: 7, minute: 15);

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
                  Padding(
                    padding: const EdgeInsets.all(fixPadding * 2.0),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesett typesetting industry. Lorem Ipsum has been the industry\'s stan standard dummy text ever since the 1500s.',
                      style: grey12RegularTextStyle,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: fixPadding * 2.0),
                    padding: const EdgeInsets.fromLTRB(
                      0,
                      fixPadding * 1.5,
                      0,
                      fixPadding * 2.0,
                    ),
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
                    child: Column(
                      children: [
                        Text(
                          'Free Birth/Natal Chart Report',
                          style: black15SemiBoldTextStyle,
                        ),
                        Text(
                          'Your birth chart holds the key to your unique life path and  personality.',
                          textAlign: TextAlign.center,
                          style: grey11RegularTextStyle,
                        ),
                        heightSpace,
                        heightSpace,
                        Text(
                          'Enter your informarion',
                          style: black13SemiBoldTextStyle,
                        ),
                        nameTextField(),
                        emailTextField(),
                        Row(
                          children: [
                            widthSpace,
                            widthSpace,
                            widthSpace,
                            widthSpace,
                            genderTextField(),
                            widthSpace,
                            widthSpace,
                            widthSpace,
                            widthSpace,
                            timeTextField(),
                            widthSpace,
                            widthSpace,
                            widthSpace,
                            widthSpace,
                          ],
                        ),
                        heightSpace,
                        heightSpace,
                        Row(
                          children: [
                            widthSpace,
                            widthSpace,
                            widthSpace,
                            widthSpace,
                            dateTextField(),
                            widthSpace,
                            widthSpace,
                            widthSpace,
                            widthSpace,
                            locationTextField(),
                            widthSpace,
                            widthSpace,
                            widthSpace,
                            widthSpace,
                          ],
                        ),
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        termsAndPolicy(),
                        getButton(),
                      ],
                    ),
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
            'Birth Chart Calculator',
            style: white18BoldTextStyle,
          ),
        ],
      ),
    );
  }

  nameTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding,
        fixPadding * 2.0,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: black12SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: greyColor),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              keyboardType: TextInputType.name,
              cursorColor: primaryColor,
              style: black13MediumTextStyle,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding,
                ),
                hintText: 'Enter your name',
                hintStyle: grey13MediumTextStyle,
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  emailTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding,
        fixPadding * 2.0,
        fixPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: black12SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: greyColor),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              cursorColor: primaryColor,
              style: black13MediumTextStyle,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding,
                ),
                hintText: 'Email your address',
                hintStyle: grey13MediumTextStyle,
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  genderTextField() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gender',
            style: black12SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
            height: 41,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: fixPadding),
            decoration: BoxDecoration(
              border: Border.all(color: greyColor),
              borderRadius: BorderRadius.circular(5),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                elevation: 0,
                isDense: true,
                hint: Text(
                  'Female',
                  style: black13MediumTextStyle,
                ),
                iconEnabledColor: blackColor,
                value: gender,
                style: black13MediumTextStyle,
                onChanged: (String newValue) {
                  setState(() {
                    gender = newValue;
                  });
                },
                items: <String>[
                  'Female',
                  'Male',
                  'Other',
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
    );
  }

  timeTextField() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Time of Birth',
            style: black12SemiBoldTextStyle,
          ),
          heightSpace,
          InkWell(
            onTap: () => _selectTime(),
            child: Container(
              height: 41,
              padding: const EdgeInsets.all(fixPadding),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _time.format(context),
                    style: black13MediumTextStyle,
                  ),
                  const Icon(
                    Icons.access_time,
                    color: blackColor,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  dateTextField() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date of Birth',
            style: black12SemiBoldTextStyle,
          ),
          heightSpace,
          InkWell(
            onTap: () => dateDialog(),
            child: Container(
              height: 41,
              padding: const EdgeInsets.all(fixPadding),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedDate,
                    style: black13MediumTextStyle,
                  ),
                  const Icon(
                    Icons.calendar_today,
                    color: blackColor,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  dateDialog() async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked.toString().substring(0, 10);
      });
    }
  }

  locationTextField() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Birth Location',
            style: black12SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: greyColor),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              cursorColor: primaryColor,
              style: black13MediumTextStyle,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding,
                ),
                hintText: 'Enter location',
                hintStyle: grey13MediumTextStyle,
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  termsAndPolicy() {
    return Padding(
      padding: const EdgeInsets.only(left: fixPadding * 2.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                accept = !accept;
              });
            },
            child: Icon(
              accept ? Icons.check_box : Icons.check_box_outline_blank,
              color: accept ? primaryColor : greyColor,
              size: 26,
            ),
          ),
          widthSpace,
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'By accepting your agree to our',
                    style: grey10MediumTextStyle,
                  ),
                  TextSpan(
                    text: ' Terms of Service ',
                    style: black10MediumTextStyle,
                  ),
                  TextSpan(
                    text: 'and',
                    style: grey10MediumTextStyle,
                  ),
                  TextSpan(
                    text: ' Privacy Policy.',
                    style: black10MediumTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        0,
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BirthChart()),
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
            'Get Your Free Birth Chart',
            style: white16BoldTextStyle,
          ),
        ),
      ),
    );
  }
}
