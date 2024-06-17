import 'package:flutter/material.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:hirejobindia/modules/all_pages/pages/chat.dart';
import 'package:hirejobindia/widget/navbar.dart';

class Inbox extends StatefulWidget {
  static const String id = 'Inbox';

  const Inbox({Key? key}) : super(key: key);

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('MESSAGES'),
          centerTitle: true,
          titleSpacing: 0,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
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
        body: _buildBody());
  }

  Widget _buildBody() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 20,
      itemBuilder: (context, i) => Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Chat()));
            },
            leading: const CircleAvatar(
                backgroundImage: AssetImage('lib/assets/images/p1.jpg'),
                radius: 22),
            title: boldText('Emma Blanchard'),
            subtitle: greyTextSmall('Hey this is test message...'),
            trailing: greyTextSmall('5:42 pm'),
          ),
          const Divider(thickness: 1, color: backgroundColor)
        ],
      ),
    );
  }
}
