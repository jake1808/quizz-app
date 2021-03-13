import 'dart:convert';

import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:quizz_app/models/catergory.dart';

import 'package:quizz_app/services/services.dart';

class DashBoard extends StatefulWidget {
  static String id = "DashBoard";
  DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<Catergory> catergories;
  bool loading = true;
  final pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    setState(() {
      Service(url: "https://quizapp1234.herokuapp.com/kategori")
          .fetchCatergory()
          .then((value) {
        Iterable list = json.decode(value.body);
        setState(() {
          catergories = list.map((e) => Catergory.fromJson(e)).toList();
          loading = false;
        });
      });
    });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'BeSmart Quiz',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 120),
            child: Icon(
              Icons.lightbulb_outline,
              size: 25,
            ),
          )
        ],
        elevation: 1,
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: pageController,
        children: [
          Scaffold(
            body: Center(child: Text("LeaderBoard")),
          ),
          Scaffold(
            body: loading
                ? Center(
                    child: Text('loading...'),
                  )
                : StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: catergories.length,
                    itemBuilder: (BuildContext context, int index) => Card(
                      child: InkWell(
                        child: Text(catergories[index].ad),
                        splashColor: Colors.black,
                        onTap: () {},
                      ),
                    ),
                    staggeredTileBuilder: (int index) =>
                        StaggeredTile.count(2, index.isEven ? 2 : 1),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
          ),
          Scaffold(
            body: Center(
              child: Text("Account"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        backgroundColor: Colors.teal,
        itemBackgroudnColor: Colors.teal,
        items: [
          CustomBottomNavigationBarItem(
            icon: Icons.leaderboard,
            title: 'Leaderboard',
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.home,
            title: 'Home',
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.account_circle,
            title: 'Account',
          ),
        ],
        onTap: (value) {
          setState(() {
            pageController.jumpToPage(value);
          });
        },
      ),
    );
  }
}
