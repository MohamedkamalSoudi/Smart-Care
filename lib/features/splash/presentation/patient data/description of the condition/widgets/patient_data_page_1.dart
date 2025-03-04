import 'package:flutter/material.dart';

class PatientDataPage1 extends StatelessWidget {
  const PatientDataPage1({super.key});
  static const id = 'PatientDataPage1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBBE2FF),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Color.fromARGB(255, 108, 183, 241)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Description of the Condition',style: TextStyle(fontSize: 18),),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.blue, width: 2),
              
            ),
          ),
          onPressed: () => showDescriptionDialog(context),
          child: Text('Show Description Dialog',style: TextStyle(fontSize: 16,color: Colors.black),),
        ),
      ),
    );
  }

  void showDescriptionDialog(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: TextField(

            controller: _controller,
            maxLines: null, // This allows the text field to be multiline
            decoration: InputDecoration(
              hintText: 'Enter Description of the Condition',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                print('Description: ${_controller.text}');
              },
              child: Center(child: Text('Ok')),
            ),
          ],
        );
      },
    );
  }
}