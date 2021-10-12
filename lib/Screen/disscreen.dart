import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mofakera/helper/helperNote.dart';

import '../constants.dart';
import 'homescreen.dart';
class DisScreen extends StatefulWidget {
  const DisScreen({Key? key}) : super(key: key);

  @override
  _DisScreenState createState() => _DisScreenState();
}

class _DisScreenState extends State<DisScreen> {
  String? Title,datetime,dicription;
  Note note=Note();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add ToDo",style: TextStyle(
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
            padding: const EdgeInsets.all(6.0),

                  

                      child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,


                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Title",
                              labelStyle: TextStyle(color: green),
                              hintText: "Enter Title",
                              contentPadding: EdgeInsets.all(DPadding),
                              helperStyle: TextStyle(color: primarydarkcolor),
                              fillColor: primarydarkcolor,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(DPadding)),
                                borderSide: BorderSide(color: primarydarkcolor,width: 0.5),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(DPadding)),
                                borderSide: BorderSide(color: primarydarkcolor,width: 0.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(DPadding)),
                                borderSide: BorderSide(color: primarydarkcolor,width: 0.5),
                              ),

                            ),
                            onChanged: (value){
                              setState(() {
                                Title=value;
                              });
                            },
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              labelText: "Date Time",
                              labelStyle: TextStyle(color: green),
                              hintText: "Enter Date Time",
                              contentPadding: EdgeInsets.all(DPadding),
                              helperStyle: TextStyle(color: primarydarkcolor),
                              fillColor: primarydarkcolor,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(DPadding)),
                                borderSide: BorderSide(color: primarydarkcolor,width: 0.5),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(DPadding)),
                                borderSide: BorderSide(color: primarydarkcolor,width: 0.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(DPadding)),
                                borderSide: BorderSide(color: primarydarkcolor,width: 0.5),
                              ),

                            ),
                            onChanged: (value){
                              setState(() {
                                datetime=value;
                              });
                            },
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            maxLines: 8,
                            decoration: InputDecoration(
                              labelText: "Note",
                              labelStyle: TextStyle(color: green),
                              hintText: "Enter Note",
                              contentPadding: EdgeInsets.all(DPadding),
                              helperStyle: TextStyle(color: primarydarkcolor),
                              fillColor: primarydarkcolor,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(DPadding)),
                                borderSide: BorderSide(color: primarydarkcolor,width: 0.5),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(DPadding)),
                                borderSide: BorderSide(color: primarydarkcolor,width: 0.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(DPadding)),
                                borderSide: BorderSide(color: primarydarkcolor,width: 0.5),
                              ),

                            ),
                            onChanged: (value){
                              setState(() {
                                dicription=value;
                              });
                            },
                            onSaved: (value){
                              setState(() {
                                Title=value;
                              });
                            },
                            validator: (value){
                              if (value!.isEmpty){
                                return "Please Enter note";
                              }
                            },
                          ),

                          SizedBox(height: 10),




                          ElevatedButton.icon(onPressed: (){
                            note.insertdb({
                              'dicription':dicription,
                              'title':Title,
                              'date':datetime,
                              'done':"Note is Done",
                            }).then((value) {
                              print("inserted note successfully:$value");
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                                return HomeScreen();
                              }));
                            });




                          },
                            style: ElevatedButton.styleFrom(primary: primarydarkcolor),
                              icon:Icon(Icons.add,size: 18,color: textcolor,),
                              label: Text("ADD",style: TextStyle(color: textcolor),),
                          ),
                        ],
                      ),
                    ),

      
              

    );
  }
}
