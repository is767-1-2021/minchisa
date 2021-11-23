import 'package:fitness_dashboard/constants.dart';
import 'package:flutter/material.dart';

class Summary extends StatefulWidget {
  final String titleName;
  final double value;
  final String unit;
  const Summary(
      {Key? key,
      required this.titleName,
      required this.value,
      required this.unit})
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
            fontWeight: FontWeight.w700,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.unit == 'double'
                    ? widget.value.toStringAsFixed(2)
                    : widget.value.toStringAsFixed(0),
                style: const TextStyle(
                  fontSize: 20,
                  color: colorText,
                  fontWeight: FontWeight.w700,
                ),
              ),
              // TextSpan(
              //   text: ' ${widget.unit}',
              //   style: const TextStyle(
              //     color: Colors.grey,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
