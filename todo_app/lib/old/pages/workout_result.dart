import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_firestore_example/old/models/first_form_model.dart';

class result extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('work out record'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Consumer<FirstFormModel>(
                builder: (context, form, child) {
                  return Text(
                      '${form.date} ${form.workout} ${form.time} ${form.kcal} ');
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/nine');
                },
                child: Text('Fill this form please'),
                style: TextButton.styleFrom(
                  primary: Colors.orangeAccent,
                  backgroundColor: Colors.green[900],
                  onSurface: Colors.black12,
                )),
          ],
        ),
      ),
    );
  }
}
