import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sundog_app/page/one_page.dart';
import 'package:sundog_app/page/second_page.dart';
import 'package:sundog_app/page/third_page.dart';
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

  var colors1=Colors.red;
  var colors2 = Colors.blueAccent;
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
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '点击加:',
                    ),
                    Text(
                      '${llnotifier.counter}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color:colors1,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: Border.all(
                          color: colors2,
                          width: 8.0,
                        )

                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          colors2 = Colors.deepOrangeAccent  ;
                          colors1 = Colors.blueGrey;
                        });
                      },
                      child: Text("点击"),
                    ),
                    IconButton(
                      alignment: Alignment.centerLeft,
                        icon:Icon(Icons.new_releases,size: 48.0,),
                        tooltip: "跳转第一页",
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>OnePage()));
                        }),
                    RaisedButton(
                      color: Colors.amber,
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(_){
                          return SecondPage();
                        }));
                      },
                      child: Text("跳转第二页"),
                    ),
                    RaisedButton(
                        color: Colors.deepOrange,
                        onPressed:(){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_){
                            return ThirdPage();
                          }));
                        },
                      child: Text("跳转第三页"),

                    )

                  ],
                ),
              ),
            ),  
            floatingActionButton: FloatingActionButton(
              onPressed: notifier.addCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),   // This trailing comma makes auto-formatting nicer for build methods.
          )
      );
  }
}
