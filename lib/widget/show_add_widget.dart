
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sundog_app/provider/third_notifier.dart';

class ShowAddWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThirdNotifier provider=  Provider.of<ThirdNotifier>(context);
    return Container(
      child:Column(
        children: [
          RaisedButton(
            child: Text("新增ADD"),
            onPressed: (){
              provider.add();
            },
          ),
          RaisedButton(
              child: Text("递减——"),
              onPressed: (){
              provider.minus();
              }
          )

        ],
      )


    );
  }
}
