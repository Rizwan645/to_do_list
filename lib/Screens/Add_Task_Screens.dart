import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/Provider/provider.dart';
import 'package:to_do_list/utils/utils.dart';
import 'package:provider/provider.dart';


class Add_Task_Screens extends StatelessWidget {
  Add_Task_Screens({Key? key}) : super(key: key);

  late String _Task = "";

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
        color: myBlue,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: myBlue,
            elevation: 0,
            title: const Text('Enter your task'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 200,
                width: 300,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: myBlue,
                        width: 2
                    ),
                    borderRadius: BorderRadius.circular(20)
                ),

                child: TextField(
                  onChanged: (value){
                    // print(value);
                    _Task=value;
                  },
                  autofocus: true,
                  style: TextStyle(
                    color: myBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    focusColor: Colors.transparent,
                    border: InputBorder.none,
                    hintText: 'Enter Your Task Here !',
                  ),

                ),
              )
            ],
          ),
          floatingActionButton: Consumer<todoProvider>(builder: (context,provider,child){
            return GestureDetector(
              onTap: (){
                var Task = this._Task;
                if(Task==""){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("No Task Added, Please Add a Task"),
                      duration: Duration(seconds: 1),
                    ),
                  );

                }else{
                  provider.setANewTask(_Task);
                  Navigator.pop(context);
                }

              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: myBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Text('Add Task',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            );
          },),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        )
    );
  }
}
