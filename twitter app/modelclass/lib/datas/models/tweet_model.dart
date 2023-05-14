class TweetModel{
int? id;
String? writer;
String? tweet;
String? postedat;
TweetModel({this.id,this.writer,this.tweet,this.postedat});
//name constructor
//json theke object toiri korche
TweetModel.fromjson(Map json)
{
  id=int.parse(json["id"]);
  writer=json["author"];
tweet=json["text"];
postedat=json["posted_at"];

}
//existing obj ke json e convert korbe
Map<String,String> tojson(){
  Map<String,String> dat={};
  dat["author"]= writer ?? "anom";
  dat["text"]=tweet ?? "tweet";
  return dat;

}
}