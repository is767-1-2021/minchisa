import 'dart:html';

import 'package:flutter/material.dart';

import 'dashboard.dart';

class Welcome extends class extends StatefulWidget {
  const ({ Key? key }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.white,
      body: SingleChildScrollView(
        child: contianer(
          padding: EdgeInsets.fromLTRB(25, 100, 25, 25),
            child: Center(
              child: Column(
                children: <Widget> [
                  Img.assets(
                    'assets/img/illustration.png',
                    width: 300
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                  ),
                  Text(
                    'Your Personal',
                    style: TextStyle(
                      color: Theme.of(context).accentColor
                      fontSize: 18,
                      fontWeight: FontWeight.blod,
                    ),                   
                  ),
                  Text(
                    'Workout Assistant'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 48,
                      color: Theme.of(context).pimaryColor,
                      fontFamily: 'Bebas',
                      fontWeight: FontWeight.blod,
                    ),
                  ),
                  Padding,
                    padding: EdgeInsets.only(top: 30),
                  ),
                  Text(
                    'Movement is a medicine for creating change in a persons physical
emotional and mental states'
                    style: TextStyle(
                      color: Color.grey,
                    ),
                    TextAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterailPageRoute(
                          builder: (context) => Dashbord(),
                          ),
                        );
                      },
                      minWidth: double.infinity,
                      height: 50,
                      child: Text(
                        'Get Started'.toUpperCase(),
                      ),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                  ),
                  Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                MaterialButton(
                  onPressed: () {},
                  minWidth: double.infinity,
                  height: 50,
                  textColor: Theme.of(context).primaryColor,
                  child: Text(
                    'Sign In'.toUpperCase(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}