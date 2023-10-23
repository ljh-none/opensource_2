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
      icon: Icon(Icons.ac_unit),
      label: "one",
      backgroundColor: Colors.orange,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.access_alarm),
      label: "two",
      backgroundColor: Colors.orange,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.access_time),
      label: "three",
      backgroundColor: Colors.orange,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.access_time_filled),
      label: "four",
      backgroundColor: Colors.orange,
    ),
  ];
  //function
  void _onItemTapped(int index) {
    setState(() => _bottomIndex = index);
  }

  void nothing() {
    return;
  }

  //overriding part
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(onPressed: nothing, child: Text("location")),
          const Spacer(),
          ElevatedButton(onPressed: nothing, child: Text("a")),
          ElevatedButton(onPressed: nothing, child: Text("b")),
          ElevatedButton(onPressed: nothing, child: Text("c")),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomItem,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.blue,
        currentIndex: _bottomIndex,
        onTap: _onItemTapped,
      ),
      body: <Widget>[
        HomePage(),
        ChatPage(),
      ][_bottomIndex],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text("tile1"),
        ),
        ListTile(
          title: Text("tile2"),
        ),
      ],
    );
  }
}



// class CommunityPage extends StatefulWidget {
//   const CommunityPage({super.key});
//   @override
//   State<CommunityPage> createState() => _CommunityPageState();
// }

// class _CommunityPageState extends State<CommunityPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Text("CommunityPage"),
//     );
//   }
// }

// class SettingPage extends StatefulWidget {
//   const SettingPage({super.key});
//   @override
//   State<SettingPage> createState() => _SettingPageState();
// }

// class _SettingPageState extends State<SettingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Widget(
//       body: Text("SettingPage"),
//     );
//   }
// }
