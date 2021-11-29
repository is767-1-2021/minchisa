import 'package:flutter/material.dart';

class SixthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sixth Page'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.build_sharp),
        onPressed: () {},
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hi',
            ),
            Table(
              children: [
                TableRow(children: [
                  Container(
                    child: Center(child: Text('No')),
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Container(
                    child: Center(child: Text('Name')),
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Container(
                    child: Center(child: Text('Gender')),
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ]),
                TableRow(
                    children: [Text('1'), Text('Minchisa'), Text('Female')]),
                TableRow(
                  children: [
                    Text('2'),
                    Text('Grace'),
                    Text('Female'),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
