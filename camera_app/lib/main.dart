import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

//상태를 반환하는 메서드
//이 메서드를 통해 화면의 상태가 반환된다고 보면 됨

class _MyAppState extends State<MyApp> {
  XFile? _image; // 이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); // ImagePicker 초기화

  Future<void> getImage(ImageSource imageSource) async {
    try {
      final XFile? pickedFile = await picker.pickImage(source: imageSource);
      if (pickedFile != null) {
        setState(() {
          _image = XFile(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Error'),
            content: Text('Unable to pick image: $e'),
            actions: [
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  //화면 구성하기
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Camera Test"),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30, width: double.infinity),
              _buildPhotoArea(),
              SizedBox(height: 20),
              _buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  //사진공간
  Widget _buildPhotoArea() {
    return _image != null
        ? Container(
            width: 300,
            height: 300,
            child: Image.file(File(_image!.path)), // 가져온 이미지를 화면에 띄워주는 코드
          )
        : Container(
            width: 300,
            height: 300,
            color: CupertinoColors.systemGrey,
          );
  }

  //이미지를 가져오기 위한 버튼
  Widget _buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoButton(
          color: const Color.fromARGB(255, 170, 208, 235),
          onPressed: () {
            getImage(ImageSource.camera); // getImage 함수를 호출해서 카메라로 찍은 사진 가져오기
          },
          child: Text("카메라"),
        ),
        SizedBox(width: 30),
        CupertinoButton(
          color: const Color.fromARGB(255, 174, 199, 226),
          onPressed: () {
            getImage(ImageSource.gallery); // getImage 함수를 호출해서 갤러리에서 사진 가져오기
          },
          child: Text("갤러리"),
        ),
      ],
    );
  }
}
