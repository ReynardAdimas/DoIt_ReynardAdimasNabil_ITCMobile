import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
//import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key, 
    required this.taskName, 
    required this.taskCompleted, 
    required this.onChanged, 
    required this.deleteFunction,
    required this.editFunction,
    });
    final String taskName; 
    final bool taskCompleted; 
    final Function(bool?)? onChanged; 
    final Function(BuildContext)? deleteFunction;
    final Function() editFunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20, 
        left: 20, 
        right: 20, 
        bottom: 0,
      ), 
      child: Slidable(
        endActionPane: ActionPane(
          motion:StretchMotion(), 
          children: [
            SlidableAction(
              backgroundColor: Color(0xffC64444),
              foregroundColor: Colors.black,
              onPressed: deleteFunction, 
              icon: MdiIcons.delete,
              label: "DELETE",
              borderRadius: BorderRadius.circular(15),
              padding: EdgeInsets.all(5),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: taskCompleted? BoxDecoration(
            color: Color(0xff373737),
            borderRadius: BorderRadius.circular(15), 
            border: Border.all(color: Color(0xff373737))
          ) : BoxDecoration(
            color: Color(0xff202020),
            borderRadius: BorderRadius.circular(15), 
            border: Border.all(color: Color(0xff373737))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: taskCompleted, 
                    onChanged: onChanged, 
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ],
              ), 
              Text(
                taskName, 
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 18,
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                  decorationColor: Colors.white, 
                  decorationThickness: 2,
                ),
              ),
              
              ElevatedButton.icon(
                iconAlignment: IconAlignment.start,
                style: taskCompleted ? ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(Color(0xffECBB5B)),
                ) : ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(Color(0xffECBB5B)),
                ), 
                onPressed: taskCompleted ? DoNothingAction.new : editFunction,
                icon: Icon(MdiIcons.pen, color: Colors.black,), 
                label:Text('Edit', 
                style: TextStyle(color: Colors.black),),
                )
            ],
            
          ),
          
        ),
        
      ),
    );
  }
}