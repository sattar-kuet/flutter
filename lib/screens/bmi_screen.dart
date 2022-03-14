import 'package:flutter/material.dart';
import '../shared/menu_bottom.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final double fontSize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;

  late List<bool> isSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      bottomNavigationBar: MenuBottom(),
      body: Column(
        children: [
          ToggleButtons(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Metric',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Metric',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
            ],
            isSelected: isSelected,
            onPressed: (value) {
              switch (value) {
                case 0:
                  isMetric = true;
                  isImperial = false;
                  break;
                case 1:
                  isMetric = false;
                  isImperial = true;
                  break;
              }
              setState(() {
                isSelected = [isMetric, isImperial];
              });
            },
          ),
        ],
      ),
    );
  }
}
