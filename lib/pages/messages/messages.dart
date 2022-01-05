import 'package:astro_zone/pages/screens.dart';
import 'package:intl/intl.dart';

class Messages extends StatefulWidget {
  final String name;
  const Messages({Key key, this.name}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final messageController = TextEditingController();
  String _currentMessage;
  String currentTime = DateFormat.jm().format(DateTime.now());

  final messageList = [
    {
      'message': 'Lorem Ipsum is eit',
      'time': '1:15 pm',
      'isMe': true,
    },
    {
      'message': 'Lorem Ipsum is eit',
      'time': '1:17 pm',
      'isMe': false,
    },
    {
      'message':
          'Lorem Ipsum is simply dummy\ntext of the printing and type of\nindustry',
      'time': '1:20 pm',
      'isMe': true,
    },
    {
      'message': 'Lorem',
      'time': '1:25 pm',
      'isMe': false,
    },
    {
      'message': 'Lorem Ipsum is eit',
      'time': '1:25 pm',
      'isMe': false,
    },
    {
      'message':
          'Lorem Ipsum is simply dummy\ntext of the printing and type of\nindustry',
      'time': '1:25 am',
      'isMe': false,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  heightSpace,
                  heightSpace,
                  messagesList(),
                  textField(),
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
            widget.name,
            style: white18BoldTextStyle,
          ),
        ],
      ),
    );
  }

  messagesList() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        itemCount: messageList.length,
        itemBuilder: (context, index) {
          final item = messageList[index];
          return Row(
            mainAxisAlignment:
                item['isMe'] ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: fixPadding * 2.0),
                padding: const EdgeInsets.all(fixPadding / 2),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: item['isMe']
                        ? [primaryColor, lightBlueColor]
                        : [const Color(0xfff4f5f8), const Color(0xfff4f5f8)],
                  ),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: item['isMe']
                          ? primaryColor.withOpacity(0.1)
                          : greyColor.withOpacity(0.1),
                      spreadRadius: 2.5,
                      blurRadius: 2.5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          item['message'],
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: item['isMe'] ? whiteColor : blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          item['time'].toString(),
                          style: TextStyle(
                            color: item['isMe'] ? whiteColor : blackColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  textField() {
    var mes = {
      'message': _currentMessage,
      'isMe': true,
      'time': currentTime,
    };
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            primaryColor,
            lightBlueColor,
          ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _currentMessage = value;
                });
              },
              controller: messageController,
              cursorColor: whiteColor,
              style: white16BoldTextStyle,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(fixPadding),
                hintText: 'Write your message',
                hintStyle: white13MediumTextStyle,
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          widthSpace,
          widthSpace,
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.attach_file,
              size: 15,
              color: whiteColor,
            ),
          ),
          widthSpace,
          widthSpace,
          InkWell(
            onTap: () {
              messageController.clear();
              setState(() {
                messageList.add(mes);
              });
            },
            child: const Icon(
              Icons.send,
              size: 15,
              color: whiteColor,
            ),
          ),
          widthSpace,
          widthSpace,
        ],
      ),
    );
  }
}
