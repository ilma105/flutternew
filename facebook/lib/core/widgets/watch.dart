import 'package:flutter/material.dart';
import 'package:stack/core/widgets/my_appbar.dart';
import 'package:stack/pages/detailspage/detailspage.dart';
import 'package:stack/pages/main_page/ui/fragements/home_frag.dart';
import 'package:stack/pages/main_page/ui/main_page.dart';

import '../../pages/main_page/ui/fragements/fbproduct.dart';

class Watch extends StatefulWidget {
  @override
  _Watch createState() => _Watch();
}

class _Watch extends State<Watch>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  final List<Widget> _pages = [    HomePage(),    HomePage(),    FbProductFrag(),VideoPage(),   VideoPage()  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
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
                  
                  SizedBox(width: 8.0),
                  Text(
                    "Watch",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.people),
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
                 
                ],
              ),
            ),
            TabBar(
              controller: _tabController,
              labelColor: Colors.blueAccent,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blueAccent,
                labelPadding: EdgeInsets.symmetric(horizontal: 5.0), // Increase padding

              tabs: [
                Tab(text: "For You",),
                Tab(text: "Live",),
                Tab(text: "Gaming",),

                Tab(text: "Reels",),

                Tab(text: "Following",),

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
      appBar: AppBar(
        title: Text('Video Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Video Page'),
        ],
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

 