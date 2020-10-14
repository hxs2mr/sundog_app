import 'package:flutter/material.dart';

//悬乎状态栏
class SlivePage extends StatefulWidget {
  @override
  _SlivePageState createState() => _SlivePageState();
}

class _SlivePageState extends State<SlivePage> {
  
  List _list = List.generate(20, (index) => '第$index个----');

  Widget _builder(context,index){
    return Container(child: Text(
        _list[index],
        style: TextStyle(
          color: Colors.blueGrey,
          decoration: TextDecoration.none
        ),
    ))  ;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Icon(Icons.arrow_back),
            title: Text('这是测试标题'),
            backgroundColor: Colors.deepOrangeAccent,
            floating: false, //先出下面的控件再出过渡页面
            snap: false,
            pinned: true,
            expandedHeight: 330,
            actions: [
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Icon(Icons.list),
              ),
            ],
            flexibleSpace:
            Container(
              //中间过渡占的高度
              height: 370,
              child:  Row(
                children: [
                  Expanded(child: Image.network("https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1469866515,2584200433&fm=26&gp=0.jpg",fit: BoxFit.cover,height: 370,)),
                ],
              )
            )
           ,
          ),
          SliverPadding(
            padding: EdgeInsets.all(10.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) => Container(
                color: Colors.lightBlueAccent,
              ),
                  childCount: 15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 5.0/2.0
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) =>  _builder(context, index),
                childCount: _list.length),
          ),
        ],
      ),

    );
  }
}
