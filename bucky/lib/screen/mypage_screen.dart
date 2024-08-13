import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'profile_screen.dart'; // ProfileScreen을 import

class MypageScreen extends StatelessWidget {
  const MypageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
              child: Text(
                '개인정보수정',
                style: TextStyle(fontSize: 24, color: Colors.blue),
              ),
            ),
          ),
          Spacer(), // 남은 공간을 차지하여 로그아웃 텍스트가 하단에 위치하도록 함
          Padding(
            padding: const EdgeInsets.all(16.0), // 여백 추가
            child: InkWell(
              onTap: () {
                // 로그아웃 로직 추가
                print('로그아웃 텍스트가 눌렸습니다');
                // 로그아웃 처리 예: Navigator.of(context).pushReplacementNamed('/login');
                _showLogoutActionSheet(context);
              },
              child: Text(
                '로그아웃',
                style: TextStyle(
                  fontSize: 16, // 작은 크기의 텍스트
                  color: Colors.red, // 로그아웃 텍스트의 색상
                  decoration: TextDecoration.underline, // 밑줄 추가 (선택 사항)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutActionSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text('로그아웃'),
        message: Text('정말 로그아웃 하시겠습니까?'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: Text('로그아웃'),
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(context).pop();
              // 실제 로그아웃 로직 추가
              print('사용자가 로그아웃을 선택했습니다.');
              // 예: Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
          CupertinoActionSheetAction(
            child: Text('취소'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
