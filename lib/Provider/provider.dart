import 'package:flutter/foundation.dart';
import 'package:to_do_list/Models/models.dart';

class todoProvider with ChangeNotifier{
  List<TaskObject> _Task = [
    // TaskObject(title:'wake up',doneOrNot: false),
    // TaskObject(title:'have breakfast',doneOrNot: false),
    // TaskObject(title:'brush your teeth',doneOrNot: false),
    // TaskObject(title:'take a shower',doneOrNot: false),
    // TaskObject(title:'get dressed',doneOrNot: false),
    // TaskObject(title:'go to school',doneOrNot: false),
    // TaskObject(title:'study English',doneOrNot: false),

  ];

  get Task => _Task;


  void setDoOrNotAtTheIndex(int index,bool value){
    _Task[index].doneOrNot = value;
    notifyListeners();
  }


  void setANewTask(String value){
    _Task.add(
      TaskObject(title:value,doneOrNot: false),
    );
    notifyListeners();
  }


}