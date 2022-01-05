import 'package:astro_zone/pages/screens.dart';

class Astrologers extends StatelessWidget {
  Astrologers({Key key}) : super(key: key);

  final astrologerList = [
    {
      'image': 'assets/users/user1.png',
      'name': 'K.N Rao',
      'type': 'Magic ball reader',
    },
    {
      'image': 'assets/users/user3.png',
      'name': 'Aliza Kelly',
      'type': 'Magic ball reader',
    },
    {
      'image': 'assets/users/user7.png',
      'name': 'Chani Nicholas',
      'type': 'Tarot card reader',
    },
    {
      'image': 'assets/users/user8.png',
      'name': 'Bejan Daruwala',
      'type': 'Tarot card reader',
    },
    {
      'image': 'assets/users/user9.png',
      'name': 'Mystic Meg',
      'type': 'Crystal ball reader',
    },
    {
      'image': 'assets/users/user2.png',
      'name': 'Robert Hand',
      'type': 'Magic ball reader',
    },
    {
      'image': 'assets/users/user10.png',
      'name': 'Shakuntala Devi',
      'type': 'Magic ball reader',
    },
    {
      'image': 'assets/users/user12.png',
      'name': 'Liz Greene',
      'type': 'Magic ball reader',
    },
    {
      'image': 'assets/users/user13.png',
      'name': 'Joan Quigley',
      'type': 'Magic ball reader',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(context),
            astrologers(),
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
            'Astrologers',
            style: white18BoldTextStyle,
          ),
        ],
      ),
    );
  }

  astrologers() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: astrologerList.length,
        itemBuilder: (context, index) {
          final item = astrologerList[index];
          return Padding(
            padding: EdgeInsets.fromLTRB(
              fixPadding * 2.0,
              index == 0 ? fixPadding * 2.0 : 0,
              fixPadding * 2.0,
              fixPadding * 2.0,
            ),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AstrologerProfile(
                    name: item['name'],
                    type: item['type'],
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(fixPadding),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      color: blackColor.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage(item['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    widthSpace,
                    widthSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'],
                            style: black14SemiBoldTextStyle,
                          ),
                          Text(
                            item['type'],
                            style: grey12RegularTextStyle,
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: blackColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
