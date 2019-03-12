class AticleModel {
  String title = "dddd";
  String subtitle = "dddd";
  Aticle_kind kind = Aticle_kind.none;
  String content =
  '''<?xml version="1.0"?>
    <doc>
    ㄴㅐ내내내내내
    <doc>
  ''';

  static AticleModel fromMap(Map<String, dynamic> map){
    AticleModel rtn = new AticleModel();

    rtn.title = map["title"];
    rtn.subtitle = map["subtitle"];
    rtn.kind = Aticle_kind.values[map["kind"]];
    rtn.content = map["content"];

    return rtn;
  }
  Map toMap(){
    Map<String, Object> rtn = new Map();
    rtn.addAll({
      "title" : "$title",
      "subtitle" : "$subtitle",
      "kind" : "${Aticle_kind.values.indexOf(this.kind)}",
      "content" : "$content"
    });
  }
}

enum Aticle_kind{
  Science,
  Social,
  ect,
  none,
}