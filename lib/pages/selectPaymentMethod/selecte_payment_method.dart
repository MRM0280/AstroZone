import 'package:astro_zone/pages/screens.dart';
import 'package:astro_zone/widget/column_builder.dart';

class SelectPaymentMethod extends StatefulWidget {
  const SelectPaymentMethod({Key key}) : super(key: key);

  @override
  _SelectPaymentMethodState createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  String isSelected = 'Credit card';
  final paymentMethodList = [
    {
      'image': 'assets/paymentMethod/mastercard.png',
      'name': 'Master card',
    },
    {
      'image': 'assets/paymentMethod/paypal.png',
      'name': 'Paypal',
    },
    {
      'image': 'assets/paymentMethod/visa.png',
      'name': 'Visa card',
    },
    {
      'image': 'assets/paymentMethod/creditcard.png',
      'name': 'Credit card',
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
                  selectPaymentMethod(),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  paymentButton(),
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
            'Select Payment Method',
            style: white18BoldTextStyle,
          ),
        ],
      ),
    );
  }

  selectPaymentMethod() {
    return ColumnBuilder(
      itemCount: paymentMethodList.length,
      itemBuilder: (context, index) {
        final item = paymentMethodList[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: fixPadding * 2.0),
          child: InkWell(
            onTap: () {
              setState(() {
                isSelected = item['name'];
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding * 1.5,
                vertical: fixPadding,
              ),
              decoration: BoxDecoration(
                color: isSelected == item['name'] ? primaryColor : whiteColor,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        item['image'],
                        height: 28,
                        width: 28,
                      ),
                      widthSpace,
                      widthSpace,
                      Text(
                        item['name'],
                        style: isSelected == item['name']
                            ? primaryColor14MediumTextStyle
                            : grey14MediumTextStyle,
                      ),
                    ],
                  ),
                  Icon(
                    isSelected == item['name']
                        ? Icons.radio_button_on
                        : Icons.radio_button_off,
                    color: isSelected == item['name'] ? whiteColor : greyColor,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  paymentButton() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PaymentSuccess()),
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
          'Make Payment',
          style: white16BoldTextStyle,
        ),
      ),
    );
  }
}
