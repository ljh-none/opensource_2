import 'package:flutter/material.dart';
import 'package:opensource_2/main.dart';
import 'package:provider/provider.dart';

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////홈페이지/////////////////////////////////
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //variable space
  late List<ItemData> homeItem;
  //function space
  Widget _buildListItem(BuildContext context, int index) {
    return Card(
      color: Colors.blue.shade50,
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: ListTile(
        leading: Image.asset("images/EmptyImage.png"),
        title: Text(Provider.of<ItemObject>(context).getItemName(index)),
        subtitle: Row(children: [
          Text(Provider.of<ItemObject>(context).getLocationName(index)),
          const Spacer(),
          Text(Provider.of<ItemObject>(context).getRegitimeName(index)),
        ]),
        onTap: () {
          gotoSub(context, HOMESUB, index);
        },
      ),
    );
  }

  //overriding space
  @override
  Widget build(BuildContext context) {
    homeItem = Provider.of<ItemObject>(context, listen: false).getItems;
    return homeItem.isNotEmpty
        ? ListView.builder(
            itemCount: homeItem.length,
            itemBuilder: _buildListItem,
          )
        : const Text("no Item");
  }
}

class HomePageSub extends StatefulWidget {
  final int index;
  const HomePageSub({super.key, required this.index});
  @override
  State<HomePageSub> createState() => _HomePageSubState();
}

class _HomePageSubState extends State<HomePageSub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${Provider.of<ItemObject>(context).getItemName(widget.index)}"),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset("images/EmptyImage.png"),
          ListTile(
              leading: Image.asset("images/EmptyProfileImage.png"),
              title: Text(
                  Provider.of<ItemObject>(context).getUserName(widget.index)),
              subtitle: Row(children: [
                Text(Provider.of<ItemObject>(context)
                    .getLocationName(widget.index)),
                const Spacer(),
                Text(Provider.of<ItemObject>(context)
                    .getRegitimeName(widget.index)),
              ])),
          ListTile(title: Text("describtion")),
        ],
      ),
      bottomNavigationBar: Row(children: [
        Text(
            Provider.of<ItemObject>(context).getPrice(widget.index).toString()),
        const Spacer(),
        const ElevatedButton(onPressed: nothing, child: Text("chat")),
      ]),
    );
  }
}
