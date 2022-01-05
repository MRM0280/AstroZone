import 'package:astro_zone/pages/screens.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final notificationList = [
    {
      'image': 'assets/notifications/notification1.png',
      'title': 'Planet Overview',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    },
    {
      'image': 'assets/notifications/notification2.png',
      'title': 'Your Daily Libra Horoscope',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    },
    {
      'image': 'assets/notifications/notification3.png',
      'title': 'Card Of the Day',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    },
    {
      'image': 'assets/notifications/notification1.png',
      'title': 'Planet Overview',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    },
    {
      'image': 'assets/notifications/notification2.png',
      'title': 'Your Daily Libra Horoscope',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    },
    {
      'image': 'assets/notifications/notification3.png',
      'title': 'Card Of the Day',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(),
            notificationList.isEmpty
                ? notificationListEmpty()
                : notifications(),
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
            'Notifications',
            style: white18BoldTextStyle,
          ),
        ],
      ),
    );
  }

  notificationListEmpty() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.notifications_off,
            color: greyColor,
            size: 50,
          ),
          heightSpace,
          heightSpace,
          Text(
            'No new notification',
            style: grey14MediumTextStyle,
          ),
        ],
      ),
    );
  }

  notifications() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: notificationList.length,
        itemBuilder: (context, index) {
          final item = notificationList[index];
          return Dismissible(
            key: Key('$item'),
            background: Container(
              margin: const EdgeInsets.only(top: fixPadding * 2.0),
              color: primaryColor,
            ),
            onDismissed: (direction) {
              setState(() {
                notificationList.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item['title']} dismissed')),
              );
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                fixPadding * 2.0,
                fixPadding * 2.0,
                fixPadding * 2.0,
                0,
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(fixPadding * 1.2),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          primaryColor,
                          lightBlueColor,
                        ],
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(color: whiteColor, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      item['image'],
                      height: 28,
                      width: 28,
                    ),
                  ),
                  widthSpace,
                  widthSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'],
                          style: black13SemiBoldTextStyle,
                        ),
                        Text(
                          item['detail'],
                          style: grey12RegularTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
