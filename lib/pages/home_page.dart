import 'package:coba_to_do_app/pages/edit_page.dart';
import 'package:coba_to_do_app/util/todo_list.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';


abstract class BasePage<T> extends StatefulWidget implements OnReInitialize<T> {
  const BasePage({GlobalKey? key}) : super(key: key);
}

abstract class OnReInitialize<T> {
  void reInitialize(BuildContext context);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  final _controller = TextEditingController(); 
  List toDoList = []; 

  void checkBoxChanged(int index)
  {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  } 

  void saveNewTask() {
    setState(() {
      if(_controller.text != "")
      {
        toDoList.add([_controller.text, false]); 
        _controller.clear();
      }
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  } 

  void editFunction(int index)
  {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => EditPage(
          taskName: toDoList[index][0],
          onSave: (name) {
            setState(() {
              toDoList[index][0] = name;
            });
          },
        )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        title: Center(child: Text('Do It', style: TextStyle(fontWeight: FontWeight.bold),)),
        backgroundColor: Color(0xff202020),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: toDoList[index][0], 
            taskCompleted: toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(index), 
            deleteFunction: (context) => deleteTask(index), 
            editFunction: () => editFunction(index),
            );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20), 
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20), 
                child: TextField(
                  controller: _controller,
                  maxLength: 17,
                  style: TextStyle(
                    color: Colors.white, 
                    
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Masukkan kegiatan', 
                    hintStyle: TextStyle(
                      color: Colors.white
                    ),
                    filled: true, 
                    fillColor: Color(0xff202020),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff373737),
                      ), 
                      borderRadius: BorderRadius.circular(15),
                    ), 
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff373737)
                      ), 
                      borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                ),
                ),
  
              ), 
              FloatingActionButton(onPressed: saveNewTask, child: const Icon(MdiIcons.plusCircle, color: Colors.black,), backgroundColor: Color(0xff626ED9),)
          ],
        ),
        ),
    );
  }
}