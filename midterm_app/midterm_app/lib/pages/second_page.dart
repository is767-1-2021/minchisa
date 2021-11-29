import 'package:flutter/material.dart';
import 'package:midterm_app/models/first_form_model.dart';
import 'package:provider/provider.dart';
import 'package:midterm_app/pages/thrid_page.dart';


class SecondPage extends StatefulWidget{
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page Second Page'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward)),
          IconButton(onPressed: (){}, icon: Icon(Icons.agriculture)),
          IconButton(
            onPressed: (){
              Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => ThirdPage(),
                ),
              );
            }, 
            icon: Icon(Icons.bus_alert)
          ),
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/3');
            }, 
            icon: Icon(Icons.medication)
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.food_bank)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Consumer<FirstFormModel>(
                builder: (context, form, child) {
                  return Text('${form.firstName} ${form.lastName} ${form.age}');
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/1');
              },
              child: Text('Fill this form please'),
            ),
          ],
        ),
      ),
    );
  }
}