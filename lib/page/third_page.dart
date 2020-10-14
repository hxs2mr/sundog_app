
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sundog_app/provider/mychangen_notifier.dart';
import 'package:sundog_app/provider/third_notifier.dart';
import 'package:sundog_app/widget/addnumber_widget.dart';
import 'package:sundog_app/widget/show_add_widget.dart';

//provider状态管理
class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("asd"),
      ),
      body: Center(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create:(context){
                return ThirdNotifier();
              },
            ),
            ChangeNotifierProvider(
              create: (context){
                return MyChangenNotifier();
              },
            )
          ],
          child: Column(
            children: [
              AddNumberPage(),
              ShowAddWidget()
            ],
          ),
        )
      ),
    );
  }
}
