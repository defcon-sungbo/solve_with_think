import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
          body2 : TextStyle(fontSize: 20.0, fontFamily: 'Hind', color: Colors.blue),
        ),

      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Dialog TextDialog;
  Dialog NextDialog;
  void initState() {
    super.initState();
    TextDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height: 150.0,
        width: 200.0,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(30.0),
              child: Text('이 문장에서는 인물으 연대 지향성을 알수 있겟군.', style: TextStyle(color: Colors.red),),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('OK', style: TextStyle(color: Colors.purple, fontSize: 18.0),))
                ],
              ),
            ),
          ],
        ),
      ),
    );
    NextDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height: 150.0,
        width: 200.0,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(30.0),
              child: Text('얼마나 이해 하셧나요', style: TextStyle(color: Colors.red),),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('1', style: TextStyle(color: Colors.purple, fontSize: 18.0),)),

                  FlatButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('2', style: TextStyle(color: Colors.purple, fontSize: 18.0),)),

                  FlatButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('3', style: TextStyle(color: Colors.purple, fontSize: 18.0),)),

                  FlatButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('4', style: TextStyle(color: Colors.purple, fontSize: 18.0),)),

                  FlatButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('5', style: TextStyle(color: Colors.purple, fontSize: 18.0),)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _cou86nter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title
        title: Text(widget.title),
      ),
      body: Container(
          child : RichText(
            text: TextSpan(
              text: '',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(text: '역사가 신채호는 역사를 아(我)와 비아(非我)의 투쟁 과정이라고 정의한 바 있다. 그가 무장 투쟁의 필요성을 역설한 독립 운동가이기도 했다는 사실 때문에, 그의 이러한 생각은 그를 투 쟁만을 강조한 강경론자처럼 비춰지게 하곤 한다. '
                    ,style: Theme.of(context).textTheme.body1

                ),
                TextSpan(text: '하지만 그는 식민지 민중과 제국주의 국가 에서 제국주의를 반대하는 민중 간의 연대를 지향하기도 했다.',
                    style: Theme.of(context).textTheme.body2
                    ,recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      showDialog(context: context, builder: (BuildContext context) => TextDialog);
                    },
                )
              ],
            ),
          )
      )
        ,floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(context: context, builder: (BuildContext context) => NextDialog);
              },
              child: Icon(Icons.add),
          )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
