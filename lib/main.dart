// - 과제 3: 1차 개발
//     - 팀 과제에서 지난번에 작성된 산출물을 다음과 같이 개선할 것
//         - 산출물을 한번 정리Refine할 것
//         - 공통되는 기능들을 포함하는 간단한 화면 설계를 추가할 것
//             - 메인 화면 1개, 5개 정도의 서브화면(화면 또는 다이얼로그)
//             - 과제 2의 결과물 활용을 추천
//         - 위에서 설계한 화면을 Flutter로 작성할 것
//             - 화면에 나타나는 정보는 별도의 클래스로 작성할 것
//             - Model-View Seperation

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'application',
      home: MainFrame(),
    );
  }
}

class MainFrame extends StatefulWidget {
  const MainFrame({super.key});
  @override
  State<MainFrame> createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {
  //variable namespace
  int _bottomIndex = 0;
  var bottomItem = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "home",
      backgroundColor: Colors.orange,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat_outlined),
      label: "chat",
      backgroundColor: Colors.orange,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "setting",
      backgroundColor: Colors.orange,
    ),
  ];

  //function
  void _tapBottom(int index) {
    setState(() => _bottomIndex = index);
  }

  void nothing() {
    return;
  }

  void isLocation() {
    showDialog(
      context: context,
      //barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Search Location"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(),
              ElevatedButton(onPressed: nothing, child: Text("search")),
            ],
          ),
        );
      },
    );
  }

  //overriding part
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(onPressed: isLocation, child: const Text("location")),
          const Spacer(),
          IconButton(
              onPressed: nothing, icon: const Icon(Icons.format_align_justify)),
          IconButton(onPressed: nothing, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: nothing, icon: const Icon(Icons.add_alert_rounded)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomItem,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.blue,
        currentIndex: _bottomIndex,
        onTap: _tapBottom,
      ),
      body: <Widget>[
        const HomePage(),
        const ChatPage(),
        const SettingPage(),
      ][_bottomIndex],
      floatingActionButton: FloatingActionButton(onPressed: nothing),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //variable space
  //function space
  Widget _buildListItem(BuildContext context, int index) {
    return Card(
      color: Colors.blue.shade50,
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: ListTile(
        leading: Image.asset("images/EmptyImage.png"),
        title: Text("item $index"),
        subtitle:
            const Row(children: [Text("Location"), Spacer(), Text("time")]),
      ),
    );
  }

  //overriding space
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: _buildListItem,
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //function space
  Widget _buildListItem(BuildContext context, int index) {
    return Card(
      color: Colors.orange.shade50,
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: ListTile(
        leading: Image.asset("images/EmptyProfileImage.png"),
        title: Text("user $index"),
        subtitle:
            const Row(children: [Text("Location"), Spacer(), Text("time")]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: _buildListItem,
    );
  }
}

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  //overriding space
  @override
  Widget build(BuildContext context) {
    return const Text("setting");
  }
}
