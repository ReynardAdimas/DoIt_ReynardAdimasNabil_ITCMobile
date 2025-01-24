
import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  EditPage({
    super.key, 
    required this.taskName, 
    required this.onSave
  });

  final String taskName; 
  final Function(String) onSave;
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _controller.text = taskName;
    
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Center(
          child: Text('Edit task', style: TextStyle(
            fontWeight: FontWeight.bold, 
            color: Colors.white
          ), ),
        ),
        backgroundColor: Color(0xff202020),
      ),
      body: Padding(
        padding: EdgeInsets.all(16), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              maxLength: 17,
              style: TextStyle(
                color: Colors.white
              ),
              decoration: InputDecoration(
                hintText: 'Edit',
                hintStyle: TextStyle(
                  color: Colors.white
                ), 
                filled: true, 
                fillColor: Color(0xff202020), 
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xff373737),
                  ), 
                  borderRadius: BorderRadius.circular(15)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xff373737)
                  ), 
                  borderRadius: BorderRadius.circular(15)
                ) 
                
              ),
            ),
          SizedBox(height: 20,), 
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                }, 
                child: Text('Batal',
                style: TextStyle(
                  color: Colors.white
                ),)
                ), 
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Color(0xff626ED9)),
                  ),
                  onPressed: () {
                    onSave(_controller.text);
                    Navigator.pop(context);
                  }, 
                  child: Text('Simpan', style: TextStyle(color: Colors.black),)
                  )
            ],
          )
          ],
        ),
      ),
    );
  }
}