import 'package:astro_zone/pages/screens.dart';
import 'package:flutter/cupertino.dart';

class Chat extends StatelessWidget {
  Chat({Key key}) : super(key: key);

  final chatList = [
    {
      'image': 'assets/users/user3.png',
      'name': 'Aliza Kelly',
      'message': 'Lorem Ipsum is simply dummy text',
      'time': '10:45 am',
      'messageCount': '2',
    },
    {
      'image': 'assets/users/user1.png',
      'name': 'K.N Rao',
      'message': 'Lorem Ipsum is simply dummy text',
      'time': '10:40 am',
      'messageCount': '0',
    },
    {
      'image': 'assets/users/user2.png',
      'name': 'Robert Hand',
      'message': 'Lorem Ipsum is simply dummy text',
      'time': '1 days ago',
      'messageCount': '0',
    },
    {
      'image': 'assets/users/user7.png',
      'name': 'Chani Nicholas',
      'message': 'Lorem Ipsum is simply dummy text',
      'time': '1 days ago',
      'messageCount': '0',
    },
    {
      'image': 'assets/users/user8.png',
      'name': 'Bejan Daruwala',
      'message': 'Lorem Ipsum is simply dummy text',
      'time': '2 days ago',
      'messageCount': '2',
    },
    {
      'image': 'assets/users/user9.png',
      'name': 'Mystic Meg',
      'message': 'Lorem Ipsum is simply dummy text',
      'time': '2 days ago',
      'messageCount': '0',
    },
    {
      'image': 'assets/users/user10.png',
      'name': 'Shakuntala Devi',
      'message': 'Lorem Ipsum is simply dummy text',
      'time': '3 days ago',
      'messageCount': '0',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(),
            chat(),
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
          Text(
            'Chat',
            style: white18BoldTextStyle,
          ),
        ],
      ),
    );
  }

  chat() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final item = chatList[index];
          return Padding(
            padding: EdgeInsets.fromLTRB(
              fixPadding * 2.0,
              index == 0 ? fixPadding * 2.0 : fixPadding,
              fixPadding * 2.0,
              0,
            ),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Messages(name: item['name']),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            margin: const EdgeInsets.only(bottom: fixPadding),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: whiteColor, width: 2),
                              image: DecorationImage(
                                image: AssetImage(item['image']),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: blackColor.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                          ),
                          item['messageCount'] == '0'
                              ? Container()
                              : Positioned(
                                  bottom: 5,
                                  right: 5,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: whiteColor),
                                    ),
                                    child: Text(
                                      item['messageCount'],
                                      style: white9SemiBoldTextStyle,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      widthSpace,
                      widthSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  item['time'],
                                  style: grey11RegularTextStyle,
                                ),
                              ],
                            ),
                            Text(
                              item['name'],
                              style: black13SemiBoldTextStyle,
                            ),
                            Text(
                              item['message'],
                              style: grey12RegularTextStyle,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  heightSpace,
                  divider(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  divider() {
    return Container(
      color: greyColor,
      height: 1,
      width: double.infinity,
    );
  }
}
