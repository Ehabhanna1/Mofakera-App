import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mofakera/constants.dart';
import 'package:mofakera/helper/helperNote.dart';

import 'ReviewScreen.dart';
import 'disscreen.dart';

class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

@override
  void initState() {
    // TODO: implement initState
  Note().db.then((value){

      print("value $value");

  });
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo",style: TextStyle(
          color: textcolor,fontSize: fontLarge
        ),),
        centerTitle: true,
        backgroundColor: primarydarkcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(RadiusCircular),
            bottomRight:  Radius.circular(RadiusCircular),
          ),
        ),
      ),
      backgroundColor: primarycolor,

      body: FutureBuilder(
        future: Note().getdata(),

        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            if (snapshot.data.length==0){
             return Center(
                     child: Text("Your ToDo List is Empty"),
                   );
            }
            else{
              return ListView.builder(
              itemCount: snapshot.data.length,

              itemBuilder: (BuildContext context, int index) {
                return Card(
                color: Colors.transparent,
                child: ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                      return  ReviewScreen(date: snapshot.data[index].date,dicription: snapshot.data[index].dicription,
                      title: snapshot.data[index].title,done: snapshot.data[index].done,);
                    }));
                  },
    title: Text("${snapshot.data[index].title}",style: TextStyle(color: textcolor),),
    subtitle: Text("${snapshot.data[index].date}",style: TextStyle(color: textcolor),),
    trailing: IconButton(onPressed: (){
      Note().deletetodo(snapshot.data[index].id).then((value){
        setState(() {
          print("value :$value");
        });

      });

    },
    icon: Icon(Icons.delete,color: Colors.red,size: 25,)),
    ),
                );
    },);
    }
          }
          else{
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: primarycolor,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          }



        },),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:(context){
            return DisScreen();
          }));

        },
        backgroundColor: primarydarkcolor,
        child: const Icon(Icons.add,color: textcolor,),
      ),
    );
  }
}
