import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:threat_intelligence_dashboard/util/constant.dart';
import 'package:http/http.dart' as http;

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class ReadyResponse{
  int? score;
  String? verdict;
  String? summary;
  ReadyResponse({required this.score,required this.verdict, required this.summary});

}

class _SearchBoxState extends State<SearchBox> {
late final TextEditingController _url ;
//static late final Map ready;
@override
void initState()
{
_url = TextEditingController();
super.initState();
getData();
}
@override
void dispose(){
_url.dispose();
super.dispose();
}
void getData()async{
  String? token = dotenv.env['token'];
  var headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer $token'
};
var request = http.Request('POST', Uri.parse('https://url-intel.gcp.us.pangea.cloud/v1/reputation'));
request.body = json.encode({
  "provider": "crowdstrike",
  "url": _url.text,
  "raw": true,
  "verbose": true
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  var responseBody =  await response.stream.bytesToString();
 var data = jsonDecode(responseBody);
 //ready = data;
  ReadyResponse(score: data['result']['data']['score'], verdict: data['result']['data']['verdict'], summary: data['summary']);
}
else {
  print(response.reasonPhrase);
}

}


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
       child: SizedBox( height: MediaQuery.of(context).size.height * 0.2,
       width: MediaQuery.of(context).size.width * 0.5,
       child: Column(children: [
        TextField(
        enableSuggestions: false,
        controller: _url,
        keyboardType: TextInputType.url,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontFamily: AutofillHints.url),
          fillColor: Colors.white,
          filled: true,
          hintText: 'Enter URL,IP or Domain to search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
        autocorrect:  false,

       ),
       SizedBox(
        height: 20.0,
       ),
       SizedBox(height: MediaQuery.of(context).size.height * 0.06,
       width: MediaQuery.of(context).size.width * 0.2,
        child: TextButton(onPressed: (){
          if(Uri.parse(_url.text).isAbsolute)
          {
            getData();
          }
          else
          {
            print("Wrong Uri");
          }
          
        }, child: Center(child: Row(children: [
        Expanded(child: Icon(Icons.search , color: Constant.blueLight ,),flex: 1,),
        
       Expanded(child: Text('Search'),flex: 2)
       ],)),
       style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Constant.purpleLight),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)))
       ),
       ),
       )
       ]
       )
       ,),
      ),
    );
  }
}