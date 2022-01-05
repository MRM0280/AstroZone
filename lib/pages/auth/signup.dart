import 'package:astro_zone/pages/screens.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';

class Signup extends StatefulWidget {
  const Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool psw = true;
  bool confirmPsw = true;

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
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                        Text(
                          'Sign Up',
                          style: black21BoldTextStyle,
                        ),
                      ],
                    ),
                    nameTextField(),
                    emailTextField(),
                    phoneNumberTextField(),
                    passwordTextField(),
                    confirmPasswordTextField(),
                    signupButton(),
                    signin(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
      margin: const EdgeInsets.all(fixPadding * 2.0),
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

  emailTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: greyColor)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.email,
            color: greyColor,
            size: 20,
          ),
          widthSpace,
          widthSpace,
          Expanded(
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              cursorColor: primaryColor,
              style: black14SemiBoldTextStyle,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Email address',
                hintStyle: grey14MediumTextStyle,
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  phoneNumberTextField() {
    return Container(
      margin: const EdgeInsets.all(fixPadding * 2.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: greyColor)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.phone_android,
            color: greyColor,
            size: 20,
          ),
          widthSpace,
          widthSpace,
          Expanded(
            child: TextField(
              keyboardType: TextInputType.phone,
              cursorColor: primaryColor,
              style: black14SemiBoldTextStyle,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Phone number',
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
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
              obscureText: !psw,
              cursorColor: primaryColor,
              style: black14SemiBoldTextStyle,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Password',
                hintStyle: grey14MediumTextStyle,
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                psw = !psw;
              });
            },
            child: Icon(
              psw ? Icons.visibility : Icons.visibility_off,
              color: greyColor,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }

  confirmPasswordTextField() {
    return Container(
      margin: const EdgeInsets.all(fixPadding * 2.0),
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
              obscureText: !confirmPsw,
              cursorColor: primaryColor,
              style: black14SemiBoldTextStyle,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Confirm password',
                hintStyle: grey14MediumTextStyle,
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                confirmPsw = !confirmPsw;
              });
            },
            child: Icon(
              confirmPsw ? Icons.visibility : Icons.visibility_off,
              color: greyColor,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }

  signupButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding,
      ),
      child: InkWell(
        onTap: () {
          currentIndex = 0;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BottomBar()),
          );
        },
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
            text: 'Sign Up',
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

  signin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have account? ',
          style: black16MediumTextStyle,
        ),
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Signin()),
          ),
          child: GradientText(
            text: 'Sign In',
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
