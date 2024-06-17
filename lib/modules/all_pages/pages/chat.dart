import 'package:flutter/material.dart';
import 'package:hirejobindia/components/styles.dart';

class Chat extends StatefulWidget {
  static const String id = 'Chat';

  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  void initState() {
    super.initState();
  }

  List<Item> messages = <Item>[
    const Item('left',
        'long established fact that a reader will be distracted by the readable content of a page when looking at its layout. '),
    const Item('right',
        'The point of using  a more-or-less normal distribution of letters, as'),
    const Item('left', 'Lorem Ipsum is that it has'),
    const Item('right',
        'The point of using  a more-or-less normal distribution of letters'),
    const Item(
        'left', 'ablished fact that a reader will be distracted by the re'),
    const Item('right', 'done'),
    const Item('right',
        'The point of using  a more-or-less normal distribution of letters'),
    const Item(
        'left', 'ablished fact that a reader will be distracted by the re'),
    const Item('right', 'done'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('Willie Velasco'),
          titleSpacing: 0,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[appColor2, appColor]),
            ),
          ),
          elevation: 0,
        ),
        bottomNavigationBar: _buildBottom(),
        body: _buildBody());
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: messages.map((Item msg) {
            return msg.side == 'left'
                ? Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    width: MediaQuery.of(context).size.width - 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        const CircleAvatar(
                          backgroundColor: appColor,
                          child: Icon(
                            Icons.support_agent,
                            size: 14,
                            color: Colors.white,
                          ),
                          radius: 12,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                padding: const EdgeInsets.all(16),
                                decoration: const BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16),
                                      topLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                    )),
                                child: Text(
                                  msg.msg,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 6),
                                child: smallText('10.34pm'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        width: MediaQuery.of(context).size.width - 120,
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        padding: const EdgeInsets.all(16),
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: <Color>[
                                                appColor2,
                                                appColor
                                              ]),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(16),
                                            topLeft: Radius.circular(16),
                                            bottomLeft: Radius.circular(16),
                                          ),
                                        ),
                                        child: Text(
                                          msg.msg,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.only(
                                              right: 10, top: 6),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              smallText('10.34pm'),
                                              const SizedBox(width: 4),
                                              const Icon(
                                                Icons.check,
                                                size: 16,
                                                color: appColor,
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
          }).toList(),
        ));
  }

  Widget _buildBottom() {
    return SingleChildScrollView(
      reverse: true,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(38.0),
                  ),
                ),
                child: TextField(
                  onChanged: (String txt) {},
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  cursorColor: appColor,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Write message',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 12)),
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundColor: appColor,
                radius: 24,
                child: Icon(Icons.near_me, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Item {
  const Item(this.side, this.msg);
  final String side;
  final String msg;
}
