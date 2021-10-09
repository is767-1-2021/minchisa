import 'package:fitness_app/pages/constants.dart';
import 'package:flutter/material.dart';

class Summary extends StatefulWidget {
  final String titleName;
  final int value;
  final String unit;
  const Summary({Key key, this.titleName, this.value, this.unit})
      : super(key: key);

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.titleName.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${widget.value}',
                style: const TextStyle(
                  fontSize: 20,
                  color: colorText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ' ${widget.unit}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
