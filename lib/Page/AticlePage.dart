import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:solve_with_think/model/AticleModel.dart';
import 'package:xml/xml.dart' as xml;


class AticlePage extends StatefulWidget {
  @override
  _AticlePageState createState() => _AticlePageState();
  AticlePage({Key key, this.data}) : super(key: key);



  AticleModel data;

}

class _AticlePageState extends State<AticlePage> {

  _Data_to_TextSpan(AticleModel data) {

    List<TextSpan> rtn = new List<TextSpan>();

    var document = xml.parse(data.content);
    var Texted = document.findAllElements('part');
    Texted.forEach( (f) {
      var a = f.findElements('sentence');
      var d = f.findElements('data');
      var t =  a.single.text;
      TextSpan rtnval = (d.isEmpty) ? TextSpan(text: t,
          style: Theme.of(context).textTheme.body1
      ) : TextSpan(text: t,
        style: Theme.of(context).textTheme.body2,
        recognizer: TapGestureRecognizer()
          ..onTap = () {
//            showDialog(context: context, builder: (BuildContext context) => this.TextDialog(d.single.text));
          },
      );

      rtn.add(rtnval);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:  RichText(
          text: TextSpan(
            text: '',
              style: DefaultTextStyle.of(context).style,
              children: _Data_to_TextSpan(widget.data),
          ),
        ),
      ),
      appBar: AppBar(title: Text("${widget.data.title}")),
    );
  }
}
