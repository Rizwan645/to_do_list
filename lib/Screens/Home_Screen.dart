import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:to_do_list/Models/models.dart';
import 'package:to_do_list/Provider/provider.dart';
import 'package:to_do_list/Screens/Add_Task_Screens.dart';
import 'package:to_do_list/utils/utils.dart';
import 'package:provider/provider.dart';



class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
        color: myBlue,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue.shade200,
            elevation: 0,
            title: const Text("ToDo List"),
            centerTitle: true,
          ),

          body: Consumer<todoProvider>(builder: (context,provider,child){
            return ListView.builder(
                itemCount: provider.Task.length,
                itemBuilder: (context , index){
                  return CheckboxListTile(
                    value:provider.Task[index].doneOrNot,
                    onChanged: (value){
                      provider.setDoOrNotAtTheIndex(index, value!);
                      // setState((){
                      //   provider.Task[index].doneOrNot = value!;
                      // });
                    },
                    activeColor: Colors.blue.shade200,
                    title: provider.Task[index].doneOrNot?
                    Text(provider.Task[index].title,
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.black12,
                        fontSize: 20,
                      ),
                    ):Text(provider.Task[index].title,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45
                      ),
                    ),
                  );
                }
            );
          },),

          floatingActionButton: FloatingActionButton(
            backgroundColor: myBlue,
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context)=> Add_Task_Screens()),
              );
            },
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        )
    );
  }
}
