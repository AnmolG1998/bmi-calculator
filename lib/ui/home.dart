import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BmiState();
  }
}

class BmiState extends State<Bmi> {
  final TextEditingController _agecontroller = new TextEditingController();
  final TextEditingController _heightcontroller = new TextEditingController();
  final TextEditingController _weightcontroller = new TextEditingController();
  double inches=0.0;
  double result=0.0;
  String _resultReading="";

  String _finalResult="";
  void _calculateBMI(){
    setState(() {
      int age=int.parse(_agecontroller.text);
      double height = double.parse(_heightcontroller.text);
      inches=height*12;
      double weight=double.parse(_weightcontroller.text);
      if((_agecontroller.text.isEmpty || age>0)
      &&((_heightcontroller.text.isNotEmpty||weight>0))) {
        result=weight/(inches*inches)*703;
        if (double.parse(result.toStringAsFixed(1))<18.5){
          _resultReading="Underweight";
          print(_resultReading);
        }else if(double.parse(result.toStringAsFixed(1))>=18.5&& result<25) {
          _resultReading = "Great shape|";
          print(_resultReading);
        }else if(double.parse(result.toStringAsFixed(1))>=25.0&&result<30){
          _resultReading="Overweihht";
        }else if(double.parse(result.toStringAsFixed(1))>=30.0){
          _resultReading="Obese";}
      }else{
        result=0.0;
      }
    });
    _finalResult="Your Bmi:${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset(
              'images/bmilogo.png',
              height: 85.0,
              width: 75.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              height: 245.0,
              width: 290.0,
              color: Colors.grey.shade200,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _agecontroller,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Age",
                        hintText: "eg.:34",
                        icon: new Icon(Icons.person_outline)),
                  ),
                  new TextField(
                    controller: _heightcontroller,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "HEight in feet",
                        hintText: "eg.:3,4",
                        icon: new Icon(Icons.insert_chart)),
                  ),
                  new TextField(
                    controller: _weightcontroller,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "weight in lbs",
                        hintText: "eg.180lbs",
                        icon: new Icon(Icons.line_weight)),
                  ),
                  new Padding(padding: new EdgeInsets.all(10.6)),
                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(onPressed: _calculateBMI,
                    color: Colors.pinkAccent,
                      child: new Text("Calculate"),
                      textColor: Colors.white,
                  ),
                  )
                ],

              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("$_finalResult",
                style: new TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontSize: 19.9
                ),),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new Text("$_resultReading",
                style: new TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontSize: 19.9
                ),)
              ],
            )
          ],

        ),
      ),
    );
  }
}
