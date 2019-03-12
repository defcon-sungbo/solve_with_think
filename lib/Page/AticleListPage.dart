import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

import 'package:solve_with_think/model/AticleModel.dart';

class AticleListPage extends StatefulWidget {

  AticleListPage({Key key, this.aticle_kind}) : super(key: key);
  Aticle_kind aticle_kind = Aticle_kind.none;
  String kind2string(Aticle_kind b) =>  "TODO : $aticle_kind";
  @override
  _AticleListPageState createState() => _AticleListPageState();

}

class _AticleListPageState extends State<AticleListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.kind2string(widget.aticle_kind))),
      body:
      new Container(
        child: new Center(
            child: new RefreshIndicator(
              child:
              ListView.separated(
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                      child : ListTile(title: Text('${a[index].title}')),
                      onTap : _CellOnclick,
                    ),
                separatorBuilder: (context, index) => Divider(color: Colors.grey,),
                itemCount: a.length,
                )
              ,
              onRefresh: _refreshStockPrices,
            )
        ),
      ),
    );
  }

  Future<void> _refreshStockPrices() async {
    print('refreshing stocks...');
    a.add(AticleModel());
    setState(() { });
  }

  _CellOnclick(){

  }



  final POSTKEY = "POSTKEY";
  Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
  List<AticleModel> a = List<AticleModel>();

  saveAticle() {
    sharedPreferences.then((v) {
      v.setString(POSTKEY, json.encode(a));
    });
  }
  loadAticle(){
    sharedPreferences.then((v) {
      a = jsonDecode(v.getString(POSTKEY));
      setState(() { });
    });
  }
  patchAticle(){
    Firestore.instance.collection('aticle').snapshots().listen((QuerySnapshot q){
          a.remove(true);
          q.documents.forEach((doc){
            a.add(AticleModel.fromMap(doc.data));
          });
    });
  }

//  StreamBuilder<QuerySnapshot>(
//  stream: Firestore.instance.collection('books').snapshots(),
//  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//  if (snapshot.hasError)
//  return new Text('Error: ${snapshot.error}');
//  switch (snapshot.connectionState) {
//  case ConnectionState.waiting:
//  return new Text('Loading...');
//  default:
//  return ListView.separated(
//  itemBuilder: (BuildContext context, int index) =>
//  ListTile(title: Text('item $index')),
//  separatorBuilder: (context, index) =>
//  Divider(color: Colors.grey,),
//  itemCount: a.length
//  );
//  }
//  }
//  ),

}
