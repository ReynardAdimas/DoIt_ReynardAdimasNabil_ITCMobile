
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
      appBar: AppBar(
        title: Center(
          child: Text('Edit task'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Edit'
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
                child: Text('Batal')
                ), 
                ElevatedButton(
                  onPressed: () {
                    onSave(_controller.text);
                    Navigator.pop(context);
                  }, 
                  child: Text('Simpan')
                  )
            ],
          )
          ],
        ),
      ),
    );
  }
}