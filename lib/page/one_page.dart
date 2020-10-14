
import 'package:flutter/material.dart';

//抽屉组件
class OnePage extends StatefulWidget {
  @override
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("抽屉"),
          ),
        body: Drawer(
          child: ListView(
            children: [

              UserAccountsDrawerHeader(
                accountName: Text(
                  "阿瑟大声地"
                ),
                accountEmail: Text(
                  "安徽省"
                ),

                onDetailsPressed: (){

                },
                otherAccountsPictures: [
                   Container(
                    child: Image.network("https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1991893742,1857699913&fm=11&gp=0.jpg"),
                  )
                ],
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.phone,),
                ),
                title: Text("我的相册"),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.portrait),
                ),
                title: Text("这是哥啥"),
              )

            ],
          ),
        ),
    );
  }
}
