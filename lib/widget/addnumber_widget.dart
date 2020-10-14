import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sundog_app/provider/third_notifier.dart';

class AddNumberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThirdNotifier thirdNotifier= Provider.of<ThirdNotifier>(context);
    int num = thirdNotifier.number;
    return Container(
      margin: EdgeInsets.only(top: 200),
      child: Column(
        children: <Widget>[
          Text('($num)')
        ],

      ),
    );
  }
}
