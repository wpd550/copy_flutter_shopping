import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginHomeView extends StatefulWidget {
  @override
  State<LoginHomeView> createState() => _LoginHomeViewState();
}

class _LoginHomeViewState extends State<LoginHomeView> {
  late TapGestureRecognizer _gestureRecognizer;
  late TapGestureRecognizer _gestureRecognizer2;
  final int groupValue = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gestureRecognizer = TapGestureRecognizer();
    _gestureRecognizer2 = TapGestureRecognizer();
  }

  @override
  Widget build(Object context) {
    var scaffold = Scaffold(
      appBar: buildAppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset("images/Login.jpeg", width: 60, height: 60),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '欢迎登陆，精彩每一天',
              style: TextStyle(fontSize: 22),
            ),
            Container(
                margin: EdgeInsets.only(top: 32),
                width: 220,
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    print("点击手机号码登录");
                  },
                  child: Text('手机号码登录'),
                )),
            SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: SizedBox()),
                Radio(
                    value: 0,
                    groupValue: groupValue,
                    onChanged: (value) {
                      print("点击Radio");
                    }),
                RichText(
                    text: TextSpan(
                        text: '同意登陆',
                        style: const TextStyle(color: Colors.grey),
                        children: [
                      TextSpan(
                        text: "用户协议",
                        style: const TextStyle(color: Colors.orange),
                        recognizer: _gestureRecognizer
                          ..onTap = () {
                            print("点击用户协议");
                          },
                      ),
                      TextSpan(text: '和'),
                      TextSpan(
                        text: "隐私协议",
                        style: const TextStyle(color: Colors.orange),
                        recognizer: _gestureRecognizer2
                          ..onTap = () {
                            print("点击隐私协议");
                          },
                      ),
                    ])),
                Expanded(child: SizedBox()),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 34),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomOvalButton(
                        iconData: Icons.app_blocking,
                        clickCallBack: () {
                          print('Clicl CustomOvalButton');
                        }),
                    SizedBox(
                      width: 22,
                    ),
                    CustomOvalButton(
                        iconData: Icons.android_rounded,
                        clickCallBack: () {
                          print('Clicl CustomOvalButton');
                        }),
                    SizedBox(
                      width: 22,
                    ),
                    CustomOvalButton(
                        iconData: Icons.more_horiz_outlined,
                        clickCallBack: () {
                          print('Clicl CustomOvalButton');
                        }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    return scaffold;
  }

  AppBar buildAppBar() {
    return AppBar(
      //阴影高度
      elevation: 0.0,
      title: const Text("haha"),
      leading: const IconButton(
          onPressed: null, icon: Icon(Icons.arrow_back_ios_new)),
      actions: const [
        TextButton(
            onPressed: null,
            child: Text(
              "登陆遇见问题",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      ],
      backgroundColor: Colors.white,
    );
  }
}

class CustomOvalButton extends StatefulWidget {
  final IconData iconData;
  final Function() clickCallBack;

  const CustomOvalButton(
      {required this.iconData, required this.clickCallBack, Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomOvalButtonState();
  }
}

class _CustomOvalButtonState extends State<CustomOvalButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      onTap: widget.clickCallBack,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Icon(
          widget.iconData,
          color: Colors.blue,
        ),
      ),
    );
  }
}
