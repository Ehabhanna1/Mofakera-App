import 'package:mofakera/model/todoModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io' as io;


class Note{
  static Database? _db;
  Future <Database?> get db async{

    if (_db==null){
      _db=await initialDB();
      return _db;
    }
    else{
      return _db;
    }
  }

  initialDB() async {
    io.Directory directory=await getApplicationDocumentsDirectory();
    String path=join(directory.path,"todoList.db");
    var mydb=await openDatabase(path,version: 1,onCreate: _onCreate);
    return mydb;
  }



   _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE todo(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,dicription TEXT NOT NULL,title TEXT NOT NULL,date TEXT NOT NULL,done TEXT NOT NULL,)');
    print("todo TABLE Created");
  }
  Future <int>insertdb(Map<String,dynamic>data) async{

    Database? db_clint =await db;
    var reselt =await db_clint!.insert("todo", data);
    return reselt;
  }
  Future <int>deletetodo(int id) async{

    Database? db_clint =await db;
    var reselt =await db_clint!.rawUpdate('DELETE FROM todo WHERE id="$id"');
    return reselt;
  }
  Future <int>updatetodo(String note,int id) async{

    Database? db_clint =await db;
    var reselt =await db_clint!.rawUpdate('UPDATE todo SET note="$note" WHERE id="$id"');
    return reselt;
  }
  Future<List<TodoModel>> getdata() async {
    Database? db_clint =await db;
    List<TodoModel>list=[];
    var reselt =await db_clint!.query("todo");
    print(reselt);
    for (var i in reselt){
      TodoModel todoModel=TodoModel(i["id"],i["title"],i ["dicription"],i ["date"], i["done"]);
      list.add(todoModel);
    }
    return list;


  }
  Future <List>getSingelRow(int id) async{
    Database? db_clint =await db;
    var reselt =await db_clint!.query('todo',where:'id="$id"');
    return reselt;
  }
}