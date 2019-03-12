import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:solve_with_think/Page/SigninPage.dart';

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
      home: SigninPage(),
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
  var bookshelfXml =
  '''
  <?xml version="1.0"?>
    <doc>
      ㄴㅐ내내내내내
    <doc>
    <key>
      <sentence>
      <sentence>
    <key>
  ''';

  int _counter = 0;
  Dialog NextDialog;
  List<TextSpan> source  = new List<TextSpan>();


  Dialog TextDialog(String t) {
    return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
    child: Container(
      height: 150.0,
      width: 200.0,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.all(30.0),
            child: Text(t, style: TextStyle(color: Colors.red),),
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
  }

  void initState() {

    super.initState();



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
//    var document = xml.parse(bookshelfXml);
//    var Texted = document.findAllElements('part');
//    Texted.forEach( (f) {
//      var a = f.findElements('sentence');
//      var d = f.findElements('data');
//      var t =  a.single.text;
//      TextSpan rtnval = (d.isEmpty) ? TextSpan(text: t,
//        style: Theme.of(context).textTheme.body1
//      ) : TextSpan(text: t,
//        style: Theme.of(context).textTheme.body2,
//        recognizer: TapGestureRecognizer()
//          ..onTap = () {
//            showDialog(context: context, builder: (BuildContext context) => this.TextDialog(d.single.text));
//          },
//      );
//
//      source.add(rtnval);
//    });
    print(source);
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
              children: this.source,
            ),
          )
      )
        ,floatingActionButton: FloatingActionButton(
              onPressed: () {
                Firestore.instance.collection('books').document()
                    .setData({ 'title': 'title', 'author': 'author' });
              },
              child: Icon(Icons.add),
          )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
