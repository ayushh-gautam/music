import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musico/constants/colors.dart';
import 'package:musico/constants/text.dart';
import 'package:musico/pages/album_page.dart';
import 'package:musico/pages/favourite_page.dart';
import 'package:musico/pages/new_page.dart';
import 'package:musico/pages/profile_page.dart';

class MyTabar extends StatelessWidget {
  MyTabar({super.key});

  List<String> myTabs = [
    'Suggested',
    'Songs',
    'Artists',
    'Albums',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundDark,
            leading: const Icon(
              Icons.sort_rounded,
              size: 20,
            ),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(CupertinoIcons.search))
            ],
            title: CustomText(
              text: 'Music',
              fontSize: 20,
            ),
            toolbarHeight: 45,
            bottom: TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                padding: const EdgeInsets.only(left: 10, bottom: 5),
                dividerColor: backgroundDark,
                tabs: [
                  CustomText(text: 'Suggested'),
                  CustomText(text: 'Songs'),
                  CustomText(text: 'Artists'),
                  CustomText(text: 'Albums'),
                ]),
          ),
          body: const TabBarView(
            children: [
              MainPage(),
              FavouritePage(),
              ProfilePage(),
              AlbumPage(),
            ],
          ),
        ));
  }
}
