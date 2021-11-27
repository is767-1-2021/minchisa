import 'dart:developer';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_dashboard/components/stat_cardd.dart';
import 'package:fitness_dashboard/components/summary.dart';
import 'package:fitness_dashboard/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String username = 'Mojo';
  int notifyCount = 23;
  int workTime = 165;
  double burnCal = 500;
  int step = 5200;
  var user;
  Map<String, dynamic> stepsSet = {'start': 0, 'end': 6000};
  // List<Map<String, dynamic>> summary = [
  //   {'titleName': 'distance', 'value': 8500, 'unit': 'm'},
  //   {'titleName': 'calroies', 'value': 259, 'unit': 'cal'},
  //   {'titleName': 'heart rate', 'value': 103, 'unit': 'bpm'},
  // ];
  List<Map<String, dynamic>> stat = [
    {
      'titleName': 'Carbs',
      'achieved': 200.0,
      'total': 350.0,
      'color': Colors.orange,
      'image': 'assets/images/bolt.png'
    },
    {
      'titleName': 'Protien',
      'achieved': 350.0,
      'total': 300.0,
      'color': colorPrimary,
      'image': 'assets/images/fish.png'
    },
    {
      'titleName': 'Fats',
      'achieved': 100.0,
      'total': 200.0,
      'color': Colors.green,
      'image': 'assets/images/sausage.png'
    },
    // {'titleName': 'calroies', 'value': 259, 'unit': 'cal'},
    // {'titleName': 'heart rate', 'value': 103, 'unit': 'bpm'},
  ];

  Future userInfo() async {
    final data =
        await firestore.collection('user').doc('6202037211_users').get();
    setState(() {
      user = data;
    });
    // inspect(data['fullname']);
  }

  // Future userBmi() async {
  //   final data = await firestore
  //       .collection('Ondiet_bmi')
  //       .where('userId', isEqualTo: '6202037211_users')
  //       .get();
  //   // .then((value) => inspect(value))
  //   // .catchError((err) => print(err));
  //   // setState(() {
  //   //   user = data;
  //   // });
  //   inspect(data);
  // }

  Future updateStep(step) async {
    print(step);
    return firestore
        .collection('user')
        .doc('6202037211_users')
        .update({'step': step})
        .then((value) => print('update step successed'))
        .catchError((err) => print('Failed to update setep $err'));
  }

  @override
  void initState() {
    super.initState();
    // summary[0]['value'] = 5000;
    // summary[1]['value'] = 500;
    // summary[2]['value'] = 80;
    userInfo();
    // userBmi();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 10,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  'https://i.pravatar.cc/100',
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${user == null ? '' : user['fullname']}',
                  style: const TextStyle(
                    color: colorText,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Badge(
                badgeContent: Text('$notifyCount'),
                child: const Icon(
                  Icons.notifications,
                  color: colorText,
                  size: 30,
                )),
          )
        ],
      ),
      body: StreamBuilder(
        stream: firestore
            .collection('Ondiet_manu')
            .where('userId', isEqualTo: '6202037211_users')
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          // inspect(data.docs[0]['kcal']);
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(color: colorPrimary));
          }
          final data = snapshot.data;
          double drink = 0;
          double food = 0;
          double cal = 0;

          // print(data.docs.length);
          for (var item in data.docs) {
            if (item['drinks'] != '') {
              drink += 1;
            }
            if (item['foods'] != '') {
              food += 1;
            }
            cal += double.parse(item['kcal']);
            // inspect(item['kcal']);
          }
          // print('drink $drink and food $food');
          return StreamBuilder(
              stream: firestore
                  .collection('user')
                  .doc('6202037211_users')
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Text('...');
                }
                final data = snapshot.data;
                // inspect('121212');
                return GestureDetector(
                  onTapUp: (TapUpDetails tapDetail) {
                    if (tapDetail.globalPosition.dx > size.width / 2) {
                      // Tap Right ++
                      updateStep(data['step'] + 1);
                      // setState(() {
                      //   step++;
                      // });
                    } else if (tapDetail.globalPosition.dx < size.width / 2) {
                      // Tap Left --
                      updateStep(data['step'] - 1);
                      // setState(() {
                      //   step--;
                      // });
                    }
                  },
                  onHorizontalDragEnd: (DragEndDetails details) {
                    if (details.primaryVelocity! > 0) {
                      // User swiped Right ++
                      updateStep(data['step'] + 1);
                      // print('R=>L');
                      // setState(() {
                      //   step++;
                      // });
                    } else if (details.primaryVelocity! < 0) {
                      // User swiped Left --
                      updateStep(data['step'] - 1);
                      // print('L<=R');
                      // setState(() {
                      //   step--;
                      // });
                    }
                  },
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color:
                                  Theme.of(context).primaryColor.withAlpha(50),
                            ),
                            child: Image.asset(
                              'assets/images/shoe.png',
                              width: 60,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            '${data['step']}',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 80,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            width: size.width * 0.7,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      '${stepsSet['start']} Steps'
                                          .toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      '${stepsSet['end']} Steps'.toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                LinearPercentIndicator(
                                  lineHeight: 8.0,
                                  percent: step / stepsSet['end'],
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: colorSwatch.withAlpha(30),
                                  progressColor: Theme.of(context).primaryColor,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Text(
                            'Steps Taken'.toUpperCase(),
                            style: const TextStyle(
                              color: colorText,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'You walked $workTime min today',
                            style: const TextStyle(
                              color: colorText,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          StreamBuilder(
                              stream: firestore
                                  .collection('Ondiet_bmi')
                                  .where('userId',
                                      isEqualTo: '6202037211_users')
                                  .snapshots(),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (!snapshot.hasData) {
                                  return const Text('...');
                                }
                                final bmi = snapshot.data.docs;
                                print(bmi.length);
                                // inspect(bmi[0]['bmi']);
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: Summary(
                                          titleName: 'BMI',
                                          value: bmi.length == 0
                                              ? 0
                                              : bmi[15]['bmi'],
                                          unit: 'double'),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Summary(
                                          titleName: 'foods',
                                          value: food,
                                          unit: 'int'),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Summary(
                                          titleName: 'drinks',
                                          value: drink,
                                          unit: 'int'),
                                    ),
                                  ],
                                );
                              }),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text(
                                'DIET PROGRESS',
                                style: TextStyle(
                                  color: colorText,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              // Row(
                              //   children: <Widget>[
                              //     Image.asset(
                              //       'assets/images/down_orange.png',
                              //       width: 20,
                              //     ),
                              //     SizedBox(
                              //       height: size.height * 0.025,
                              //     ),
                              //     Text(
                              //       '$burnCal Calories',
                              //       style: const TextStyle(
                              //         color: Colors.orange,
                              //         fontWeight: FontWeight.w700,
                              //       ),
                              //     )
                              //   ],
                              // )
                            ],
                          ),
                          Container(
                            height: 250,
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                            child: ListView(
                              // physics: const ClampingScrollPhysics(),
                              // shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                ShowStatCard(
                                  title: 'calories',
                                  achieved: cal,
                                  total: double.parse(data['totalCal']),
                                  color: stat[0]['color'],
                                  image: Image.asset(
                                    '${stat[0]['image']}',
                                    width: 20,
                                  ),
                                ),
                                ShowStatCard(
                                  title: 'Protien',
                                  achieved: cal,
                                  total: double.parse(data['totalCal']),
                                  color: stat[1]['color'],
                                  image: Image.asset(
                                    '${stat[1]['image']}',
                                    width: 20,
                                  ),
                                ),
                                ShowStatCard(
                                  title: 'Fats',
                                  achieved: cal,
                                  total: double.parse(data['totalCal']),
                                  color: stat[2]['color'],
                                  image: Image.asset(
                                    '${stat[2]['image']}',
                                    width: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
