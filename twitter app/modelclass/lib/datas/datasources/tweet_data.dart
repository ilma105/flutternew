import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modelclass/datas/models/tweet_model.dart';

class TweetData{
//for all tweets
static Future<List> getAlltweets() async {
    List<TweetModel> tweets=[];

http.Response res= await http.get(Uri.parse("https://642a9cf900dfa3b54749ed11.mockapi.io/tweet"));

if(res.statusCode==200){
  List parsedjson=jsonDecode(res.body);
 parsedjson.forEach((tweet) { 
  TweetModel tweetModel= TweetModel.fromjson(tweet);
  tweets.add(tweetModel);
 });
}
return tweets;
}
static Future<bool> posttwwet(TweetModel tweetm) async{
 
  http.Response resp=await http.post(Uri.parse("https://642a9cf900dfa3b54749ed11.mockapi.io/tweet"),
 body:  tweetm.tojson(),
 
  );
  if(resp.statusCode==200){
return true;
  }
  return false;
}
}