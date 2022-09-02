
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c6_sat/date_widget.dart';
import 'package:todo_c6_sat/home/home_screen.dart';

import '../../dialoge_utils.dart';
import '../../my_database.dart';
import '../../task.dart';


class EditTaskScreen extends StatefulWidget {
 static String routeName = 'edit_task';

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  var formKey = GlobalKey<FormState>();
  late Task task;
   TextEditingController titleController = TextEditingController();
   TextEditingController descController = TextEditingController();
   DateTime selectedDate = DateTime.now();

  void initState(){
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    task = ModalRoute.of(context)!.settings.arguments as Task ;
    titleController.text =  task.title!;
    descController.text =  task.content!;
    selectedDate = task.dateTime!;
  });
  }

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text('To Do List ',
        style: TextStyle(
          fontSize: 22,
        fontWeight: FontWeight.bold),),),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height:ScreenHeight * .1,
                color: Colors.blue,
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(
                  left: ScreenWidth * .1,top: ScreenHeight * .04),
                width: ScreenWidth * .8,
                height:ScreenHeight *.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(child: Text('Edit Task')),
                    TextFormField(

                      controller: titleController,
                      validator: (currentText){
                        if(currentText==null||currentText.trim().isEmpty){
                          return 'please enter title';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                    TextFormField(
                      controller: descController,
                      validator: (text){
                        if(text==null||text.isEmpty){
                          return 'please enter details';
                        }
                        return null;
                      },
                      minLines: 4,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: 'Details',
                      ),
                    ),
                    SizedBox(height: 12),
                    Text('Select Date',
                    style: Theme.of(context).textTheme.titleMedium!
                        .copyWith(color:Colors.black,fontSize: 20 )),
                    DateWidget(selectedDate, (date)
                    {selectedDate = date ;}),
                    ElevatedButton(
                        style:ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: BorderSide(color: Theme.of(context).primaryColor)
                                )
                            )
                        ),
                        onPressed: (){
                          editTask();
                          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                        }, child:Text('Submit',style: TextStyle(
                        fontSize: 18
                    ),) )
                  ],
                ),
              ),),
            ],
          ),
        ],
      ),
    );
  }





  void editTask(){
    if(formKey.currentState?.validate()==true){
      // title, desc,date
      print(titleController.text);
          task.title = titleController.text;
          task.dateTime = selectedDate;
          task.content = descController.text;
      var tasksRef = MyDataBase.getTasksCollection();
          print(task.toFireStore());
      tasksRef.doc(task.id).update(task.toFireStore());
    }

  }
}



