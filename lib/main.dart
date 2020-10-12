import 'package:flutter/material.dart';
import 'package:flutterappday2/custome_gridview.dart';
import 'package:flutterappday2/input_selection.dart';
import 'package:flutterappday2/register_form.dart';
import 'package:flutterappday2/search_listview.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuTabbar(),
    ));

class MenuTabbar extends StatefulWidget {
  @override
  _MenuTabbarState createState() => _MenuTabbarState();
}

class _MenuTabbarState extends State<MenuTabbar>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          CustomeGridview(),
          RegisterForm(),
          InputSelection(),
          SearchListView()
        ],
        controller: tabController,
      ),
      bottomNavigationBar: BottomAppBar(
        child: TabBar(
          controller: tabController,
          labelColor: Colors.green,
          unselectedLabelColor: Colors.red,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.grid_on),
              text: "Gridview",
            ),
            Tab(
              icon: Icon(Icons.credit_card),
              text: "Register",
            ),
            Tab(
              icon: Icon(Icons.dashboard),
              text: "Selection",
            ),
            Tab(
              icon: Icon(Icons.search),
              text: "Search",
            )
          ],
        ),
      ),
    );
  }
}
