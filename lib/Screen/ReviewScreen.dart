import 'package:flutter/material.dart';

import 'package:mofakera/helper/function.dart';

import '../constants.dart';

class ReviewScreen extends StatefulWidget {
 var dicription;
 var title;
 var date;
 var done;
 ReviewScreen({this.dicription,this.title,this.date,this.done});

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("${widget.title}",style: TextStyle(
            color: textcolor,fontSize: fontLarge
        ),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back_ios,color: textcolor,size: 25,)),
        backgroundColor: primarydarkcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(RadiusCircular),
            bottomRight:  Radius.circular(RadiusCircular),
          ),
        ),
      ),
      backgroundColor: primarycolor,
      body: Padding(
        padding: const EdgeInsets.all(DPadding),
        child: Column(
          children: [
            Text("${widget.date}",style: TextStyle(fontWeight: FontWeight.bold),),
            Text("${widget.dicription}",style: TextStyle(fontSize: fonttitel),),
          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Fun.ShareLink("title:${widget.title}\n date:${widget.date}\n dicription:${widget.dicription}");


        },
        backgroundColor: primarydarkcolor,
        child: const Icon(Icons.share,color: textcolor,),
      ),
    );
  }
}
