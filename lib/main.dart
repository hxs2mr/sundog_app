import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sundog_app/provider/mychangen_notifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'provider测试'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final MyChangenNotifier notifier = MyChangenNotifier();
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(
          create: (_)=>notifier,
          child:    Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Consumer<MyChangenNotifier>(
              builder: (_,llnotifier,__)=>Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '点击加:',
                    ),
                    Text(
                      '${llnotifier.counter}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: notifier.addCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          )
      )
    ;
  }
}
