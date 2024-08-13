import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bucky/screen/home_screen.dart';
import 'package:bucky/screen/request_screen.dart';
import 'package:bucky/screen/mypage_screen.dart';
import 'package:bucky/screen/profile_screen.dart'; // 추가된 부분

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller!.addListener(tabListener);
  }

  void tabListener() {
    setState(() {});
  }

  @override
  void dispose() {
    controller!.removeListener(tabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bucky'),
      ),
      body: TabBarView(
        controller: controller,
        children: renderChildren(),
      ),
      bottomNavigationBar: renderBottomNavigation(),
    );
  }

  List<Widget> renderChildren() {
    return [
      HomeScreen(number: 2),
      RequestScreen(),
      MypageScreen(),
    ];
  }

  BottomNavigationBar renderBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: controller!.index,
      onTap: (int index) {
        setState(() {
          controller!.animateTo(index);
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.house_fill),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.leaf_arrow_circlepath),
          label: '의수족 신청',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person_alt_circle_fill),
          label: '마이페이지',
        ),
      ],
    );
  }
}
