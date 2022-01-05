import 'package:astro_zone/pages/screens.dart';
import 'package:dropdown_date_picker/dropdown_date_picker.dart';

class Numerology extends StatefulWidget {
  const Numerology({Key key}) : super(key: key);

  @override
  _NumerologyState createState() => _NumerologyState();
}

class _NumerologyState extends State<Numerology> {
  static final now = DateTime.now();

  final datePicker = DropdownDatePicker(
    firstDate: ValidDate(year: now.year - 100, month: 1, day: 1),
    lastDate: ValidDate(year: now.year, month: now.month, day: now.day),
    dateHint: const DateHint(month: 'Month', day: 'Day', year: 'Year'),
    dateFormat: DateFormat.mdy,
    textStyle: grey13MediumTextStyle,
    dropdownColor: lightBlueColor,
    ascending: false,
    underLine: Container(),
  );
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
                padding:
                    const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                children: [
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  selectDate(),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  aboutNumerology(),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  numerologyButton(),
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
            'Numerology',
            style: white18BoldTextStyle,
          ),
        ],
      ),
    );
  }

  selectDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Birthdate/Ocassion date',
          style: black16BoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        Container(
          height: 38,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(3),
          ),
          child: datePicker,
        ),
      ],
    );
  }

  aboutNumerology() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Numerology',
          style: black16BoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          'Lorem Ipsum is simply dummy text of the printing and typesett typesetting industry. Lorem Ipsum has been the industry\'s text standard dummy text ever since the 1500s.',
          style: grey12RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco dolor laboris nisi ut aliquip ex ea commodo consequat.',
          style: grey12RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, text eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',
          style: grey12RegularTextStyle,
        ),
      ],
    );
  }

  numerologyButton() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NumerologyDetail(
            date: datePicker.day == null ||
                    datePicker.month == null ||
                    datePicker.year == null
                ? ''
                : datePicker.getDate(),
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
          'Get Your Numerology',
          style: white16BoldTextStyle,
        ),
      ),
    );
  }
}
