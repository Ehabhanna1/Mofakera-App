import 'package:share/share.dart';
class Fun{
 // static Future<void> openLink(String link)async{
  //  var urllink=link;
   // if (await canLaunch(urllink)){
   //   await launch(urllink);
  //  }
  //  else{
    //  await launch(urllink);
   // }
 // }
 static Future<void>ShareLink(String link)async {
   Share.share("$link");
 }
}