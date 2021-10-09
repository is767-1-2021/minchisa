import 'package:badges/badges.dart';
import 'package:fitness_app/pages/components/stat_cardd.dart';
import 'package:fitness_app/pages/components/summary.dart';
import 'package:fitness_app/pages/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String username = 'Mr.John';
  int notifyCount = 23;
  int workTime = 165;
  double burnCal = 500;
  int step = 5300;
  Map<String, dynamic> stepsSet = {'start': 0, 'end': 6000};
  List<Map<String, dynamic>> summary = [
    {'titleName': 'distance', 'value': 8500, 'unit': 'm'},
    {'titleName': 'calroies', 'value': 259, 'unit': 'cal'},
    {'titleName': 'heart rate', 'value': 103, 'unit': 'bpm'},
  ];
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
                  username,
                  style: const TextStyle(
                    color: colorText,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Text(
                //   'Feb 25, 2018',
                //   style: TextStyle(
                //     color: colorText,
                //     fontSize: 12,
                //   ),
                // ),
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
      body: GestureDetector(
        onTapUp: (TapUpDetails tapDetail) {
          if (tapDetail.globalPosition.dx > size.width / 2) {
            // Tap Right
            setState(() {
              step++;
            });
          } else if (tapDetail.globalPosition.dx < size.width / 2) {
            // Tap Left
            setState(() {
              step--;
            });
          }
        },
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity > 0) {
            // User swiped Right
            setState(() {
              step++;
            });
          } else if (details.primaryVelocity < 0) {
            // User swiped Left
            setState(() {
              step--;
            });
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
                    color: Theme.of(context).primaryColor.withAlpha(50),
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
                  '$step',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '${stepsSet['start']} Steps'.toUpperCase(),
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
                    fontWeight: FontWeight.bold,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Summary(
                          titleName: '${summary[0]['titleName']}',
                          value: summary[0]['value'],
                          unit: '${summary[0]['unit']}'),
                    ),
                    Expanded(
                      flex: 3,
                      child: Summary(
                          titleName: '${summary[1]['titleName']}',
                          value: summary[1]['value'],
                          unit: '${summary[1]['unit']}'),
                    ),
                    Expanded(
                      flex: 3,
                      child: Summary(
                          titleName: '${summary[2]['titleName']}',
                          value: summary[2]['value'],
                          unit: '${summary[2]['unit']}'),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'DIET PROGRESS',
                      style: TextStyle(
                        color: colorText,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/down_orange.png',
                          width: 20,
                        ),
                        SizedBox(
                          height: size.height * 0.025,
                        ),
                        Text(
                          '$burnCal Calories',
                          style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                    height: 250,
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: stat.length,
                        itemBuilder: (context, index) {
                          return ShowStatCard(
                            title: '${stat[index]['titleName']}',
                            achieved: stat[index]['achieved'] as double,
                            total: stat[index]['total'],
                            color: stat[index]['color'],
                            image: Image.asset(
                              '${stat[index]['image']}',
                              width: 20,
                            ),
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
