import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  //全局Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();

  String username;
  String password;
  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  void login(){
    //读取当前的fome状态
    var loginForm = loginKey.currentState;
    if(loginForm.validate()){
      loginForm.save();
      print("用户名:"+username+"  密码:"+password);
    }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二页"),
      ),
      body: Column(
        children: [
          Container(
            child: Form(
              key: loginKey,
              child: Column(
                children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: '请输入用户名'
                  ),
                  onSaved: (value){
                    this.username  = value;
                  },
                ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '请输入密码'
                    ),
                    obscureText: true,
                    //验证表单的方法
                    validator:(value){
                      return value.length<4?'密码长度不够四位':null;
                    },
                    onSaved: (value){
                      this.password = value;
                    },

                  )
                ],
              ),
            ),
          ),
          Container(
            width: 300,
            height: 50,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 5.0
              ),
              borderRadius: BorderRadius.all(Radius.circular(200.0))
            ),
            child:  InkWell(
                onTap: login,
                child: Text("登录",style: TextStyle(fontSize: 18.0),textAlign: TextAlign.center,),
              ),
          )
      
        ],
      ),
    );
  }
}
