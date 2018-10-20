import 'package:flutter/material.dart';

class SurveyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/image19.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
          alignment: Alignment.bottomLeft,
          child: Text('Survey', style: TextStyle(color: Colors.black))),
    );
  }
}


class CriteriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red,);
  }
}
