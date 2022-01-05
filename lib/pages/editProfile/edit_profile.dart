import 'package:astro_zone/pages/screens.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key key}) : super(key: key);

  final nameController = TextEditingController(text: 'Samantha John');
  final emailController = TextEditingController(text: 'shahsamantha@gmail.com');
  final phoneNumberController = TextEditingController(text: '(+91) 1234567890');
  final passwordController = TextEditingController(text: 'Samantha John');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(context),
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
                  profileImage(context),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  nameTextField(),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  emailTextField(),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  mobileNumberTextField(),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  passwordTextField(),
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
                  Row(
                    children: [
                      saveButton(context),
                      widthSpace,
                      widthSpace,
                      widthSpace,
                      widthSpace,
                      cancelButton(context),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
            'Edit Profile',
            style: white18BoldTextStyle,
          ),
        ],
      ),
    );
  }

  profileImage(context) {
    return Stack(
      children: [
        Center(
          child: InkWell(
            onTap: () => changeProfilePick(context),
            child: Hero(
              tag: 'profilePic',
              child: Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/users/user11.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 188,
          child: InkWell(
            onTap: () => changeProfilePick(context),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryColor,
                    lightBlueColor,
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: whiteColor,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  changeProfilePick(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: whiteColor,
          child: Wrap(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Choose Option',
                      textAlign: TextAlign.center,
                      style: black16BoldTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.camera_alt,
                            color: blackColor,
                            size: 18.0,
                          ),
                          widthSpace,
                          widthSpace,
                          Text(
                            'Take picture',
                            style: black13MediumTextStyle,
                          ),
                        ],
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.photo_library,
                            color: blackColor,
                            size: 18.0,
                          ),
                          widthSpace,
                          widthSpace,
                          Text(
                            'Select from gallery',
                            style: black13MediumTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  nameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'User Name',
          style: grey14MediumTextStyle,
        ),
        TextField(
          controller: nameController,
          keyboardType: TextInputType.name,
          cursorColor: primaryColor,
          style: black14SemiBoldTextStyle,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(
              top: 1,
              bottom: 8,
            ),
            border:
                UnderlineInputBorder(borderSide: BorderSide(color: greyColor)),
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: greyColor)),
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: greyColor)),
          ),
        ),
      ],
    );
  }

  emailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: grey14MediumTextStyle,
        ),
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          cursorColor: primaryColor,
          style: black14SemiBoldTextStyle,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(
              top: 1,
              bottom: 8,
            ),
            border:
                UnderlineInputBorder(borderSide: BorderSide(color: greyColor)),
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: greyColor)),
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: greyColor)),
          ),
        ),
      ],
    );
  }

  mobileNumberTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mobile Number',
          style: grey14MediumTextStyle,
        ),
        TextField(
          controller: phoneNumberController,
          keyboardType: TextInputType.phone,
          cursorColor: primaryColor,
          style: black14SemiBoldTextStyle,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(
              top: 1,
              bottom: 8,
            ),
            border:
                UnderlineInputBorder(borderSide: BorderSide(color: greyColor)),
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: greyColor)),
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: greyColor)),
          ),
        ),
      ],
    );
  }

  passwordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: grey14MediumTextStyle,
        ),
        TextField(
          obscureText: true,
          controller: passwordController,
          cursorColor: primaryColor,
          style: black14SemiBoldTextStyle,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(
              top: 1,
              bottom: 8,
            ),
            border:
                UnderlineInputBorder(borderSide: BorderSide(color: greyColor)),
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: greyColor)),
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: greyColor)),
          ),
        ),
      ],
    );
  }

  saveButton(context) {
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.pop(context),
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
            'Save',
            style: white16BoldTextStyle,
          ),
        ),
      ),
    );
  }

  cancelButton(context) {
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.pop(context),
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
            text: 'Cancel',
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
}
