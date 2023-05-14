import 'package:flutter/material.dart';
import 'package:stack/core/widgets/my_appbar.dart';
import 'package:stack/core/widgets/watch.dart';
import 'package:stack/pages/detailspage/detailspage.dart';
import 'package:stack/pages/main_page/ui/fragements/home_frag.dart';
import 'package:stack/pages/main_page/ui/main_page.dart';

import 'main_page/ui/fragements/fbproduct.dart';
import 'main_page/ui/fragements/wish_frag.dart';

class FacebookNavigationBar extends StatefulWidget {
  @override
  _FacebookNavigationBarState createState() => _FacebookNavigationBarState();
}

class _FacebookNavigationBarState extends State<FacebookNavigationBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  final List<Widget> _pages = [    HomeFrag(),    Watch(),    FbProductFrag(),VideoPage(),   VideoPage(),VideoPage()  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Color.fromARGB(115, 238, 235, 235),
                    child: Icon(Icons.menu, color: Colors.black),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    "facebook",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      // _tabController.animateTo(2);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // _tabController.animateTo(3);
                    },
                  ),
                  IconButton(
                    icon:  Image.asset("assests/graphics/common/m.png",width: 18.0,),

                    onPressed: () {
                      // _tabController.animateTo(4);
                    },
                  ),
                ],
              ),
            ),
            TabBar(
              controller: _tabController,
              labelColor: Colors.blueAccent,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blueAccent,
              tabs: [
                Tab(icon: Icon(Icons.home_outlined)),
                Tab(icon: Icon(Icons.ondemand_video_outlined)),
                Tab(icon: Image.asset("assests/graphics/common/cart1.png",width: 30.0,),
),
                Tab(icon: Image.asset("assests/graphics/common/game.png",width: 30.0,color: Colors.grey,),
),
                Tab(icon: Icon(Icons.notifications)),
                                Tab(icon: Icon(Icons.menu)),

              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: _pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watch'),
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Video Page'),
      // ),
      body: SingleChildScrollView(
        scrollDirection:Axis.horizontal,
        child: Row(
          children: [
           Container(color: Colors.blueAccent,height: 100.0,width: 100.0,),
                      Container(color: Color.fromARGB(255, 255, 68, 227),height: 100.0,width: 100.0,),
           Container(color: Color.fromARGB(255, 68, 255, 124),height: 100.0,width: 100.0,),
           Container(color: Colors.blueAccent,height: 100.0,width: 100.0,),
           Container(color: Color.fromARGB(255, 255, 236, 68),height: 100.0,width: 100.0,),
           Container(color: Colors.blueAccent,height: 100.0,width: 100.0,),
           Container(color: Color.fromARGB(255, 255, 152, 68),height: 100.0,width: 100.0,),
           Container(color: Colors.blueAccent,height: 100.0,width: 100.0,),
           Container(color: Color.fromARGB(255, 255, 68, 236),height: 100.0,width: 100.0,),
           Container(color: Colors.blueAccent,height: 100.0,width: 100.0,),
           Container(color: Color.fromARGB(255, 255, 68, 71),height: 100.0,width: 100.0,),
           Container(color: Colors.blueAccent,height: 100.0,width: 100.0,),
           Container(color: Color.fromARGB(255, 152, 255, 68),height: 100.0,width: 100.0,),
           Container(color: Colors.blueAccent,height: 100.0,width: 100.0,),


          ],
        ),
      ),
    );
  }
}

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Page'),
      ),
      body: Center(
        child: Text('Group Page'),
      ),
    );
  }
}

 