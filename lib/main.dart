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

//페이지 이동을 위한 상수 및 함수
const String HOMESUB = "homesub";
const String CHATSUB = "chatsub";
const String FLOATSUB = "floatsub";
const String CATEGORYSUB = "categorysub";
const String ALERTSUB = "alertsub";
const String SEARCHSUB = "searchsub";

Function gotoSub = (BuildContext context, String cls) {
  switch (cls) {
    case HOMESUB:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HomePageSub()));
      break;
    case CHATSUB:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ChatPageSub()));
      break;
    case FLOATSUB:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const FloatingSub()));
      break;
    case CATEGORYSUB:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CategorySub()));
      break;
    case ALERTSUB:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AlertSub()));
      break;
    case SEARCHSUB:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SearchSub()));
      break;
    default:
      break;
  }
};

//데이터 클래스
class ItemData {
  var _item;
  var _user;
  var _category;
  var _regitime;
}

class userData {
  var _name;
  var _location;
}

class SettingData {
  var _filter;
}

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

//Read Me
//1. 메인 화면 구성
//하단 바를 통한 페이지 이동 시 navigation pop 없이 이동하고 싶다.
//우선 메인 화면에 상단바, 하단바, 플로팅 버튼으로 구성된 프레임을 만든다.
//하단 바를 클릭할 때마다 body부분만 바뀐다 -> homepage, chatpage, settingpage
//2. 서브 화면 구성 -> navigation pop
// - home, chat, setting 페이지의 아이템 클릭 시
// - appbar의 카테고리, 검색, 알람 버튼 클릭 시
// - floating button 클릭 시
//3. 다이얼로그 화면 구성
// - location 버튼 클릭 시
////////////////////////////메인 프레임////////////////////////////////////////////////////////
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
          title: const Text("Search Location"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextField(),
              ElevatedButton(onPressed: nothing, child: const Text("search")),
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
              onPressed: () {
                gotoSub(context, CATEGORYSUB);
              },
              icon: const Icon(Icons.format_align_justify)),
          IconButton(
              onPressed: () {
                gotoSub(context, SEARCHSUB);
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                gotoSub(context, ALERTSUB);
              },
              icon: const Icon(Icons.add_alert_rounded)),
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
      floatingActionButton: FloatingActionButton(onPressed: () {
        gotoSub(context, FLOATSUB);
      }),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////홈페이지/////////////////////////////////////////////
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
        onTap: () {
          gotoSub(context, HOMESUB);
        },
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

class HomePageSub extends StatefulWidget {
  const HomePageSub({super.key});
  @override
  State<HomePageSub> createState() => _HomePageSubState();
}

class _HomePageSubState extends State<HomePageSub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item Page"),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////채팅 페이지/////////////////////////////////////////////
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
          onTap: () {
            gotoSub(context, CHATSUB);
          }),
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

class ChatPageSub extends StatefulWidget {
  const ChatPageSub({super.key});
  @override
  State<ChatPageSub> createState() => _ChatPageSubState();
}

class _ChatPageSubState extends State<ChatPageSub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User name"),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////세팅 페이지/////////////////////////////////////////////
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
/////////////////////////////////////////////////////////////////////////////////////////////

class FloatingSub extends StatefulWidget {
  const FloatingSub({super.key});
  @override
  State<FloatingSub> createState() => _FloatingSubState();
}

class _FloatingSubState extends State<FloatingSub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item add"),
      ),
    );
  }
}

class CategorySub extends StatefulWidget {
  const CategorySub({super.key});
  @override
  State<CategorySub> createState() => _CategorySubState();
}

class _CategorySubState extends State<CategorySub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("category page"),
      ),
    );
  }
}

class SearchSub extends StatefulWidget {
  const SearchSub({super.key});
  @override
  State<SearchSub> createState() => _SearchSubState();
}

class _SearchSubState extends State<SearchSub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search page"),
      ),
    );
  }
}

class AlertSub extends StatefulWidget {
  const AlertSub({super.key});
  @override
  State<AlertSub> createState() => _AlertSubState();
}

class _AlertSubState extends State<AlertSub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert page"),
      ),
    );
  }
}
