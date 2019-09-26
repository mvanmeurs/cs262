import 'package:flutter/material.dart';

void main() => runApp(new MyCalculatorHomework1App());

class MyCalculatorHomework1App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp (
        title: 'Calculator',
      home:MyCalculator()
    );
  }
}

class MyCalculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Calculator();
}

class Calculator extends State<MyCalculator>{

  //Register controller for the two text fields
  final controller_numberA = TextEditingController();
  final controller_numberB = TextEditingController();
  final my_form_key = GlobalKey<FormState>();

  String textToShow = "";

  //Sum function
  void Sum(){
    //Validate Form
    if(my_form_key.currentState.validate()){
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA + numberB;

      setState(() {
        textToShow = "$numberA + $numberB = $result";
      });
    }
  }

  //Subtract function
  void Subtract(){
    //Validate Form
    if(my_form_key.currentState.validate()){
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA - numberB;

      setState(() {
        textToShow = "$numberA - $numberB = $result";
      });
    }
  }

  //Multiply function
  void Multiply(){
    //Validate Form
    if(my_form_key.currentState.validate()){
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA * numberB;

      setState(() {
        textToShow = "$numberA * $numberB = $result";
      });
    }
  }

  //Divide function
  void Divide(){
    //Validate Form
    if(my_form_key.currentState.validate()){
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      double result = numberA / numberB;

      setState(() {
        textToShow = "$numberA / $numberB = $result";
      });
    }
  }


  @override
  Widget build(BuildContext context){

    //Create Layout
    return new Scaffold(body:Form(key:my_form_key,child:
        Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Create 2 text fields
            TextFormField(
              controller: controller_numberA,
                validator: (value){
                  if(value.isEmpty) return "Please enter an input";
                },
                decoration: InputDecoration(hintText: "Value 1"),
                keyboardType: TextInputType.number),
            TextFormField(
                controller: controller_numberB,
                validator: (value){
                  if(value.isEmpty) return "Please enter an input";
                },
                decoration: InputDecoration(hintText: "Value 2"),
                keyboardType: TextInputType.number),

            //Create 4 butons in 1 row
            Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
              RaisedButton(onPressed: Sum,child: Text('+'),),
              RaisedButton(onPressed: Subtract,child: Text('-'),),
              RaisedButton(onPressed: Multiply,child: Text('*'),),
              RaisedButton(onPressed: Divide,child: Text('/'),),
            ],),

            //Create Result TextField
            Text (textToShow,style:TextStyle(fontSize: 24.0),),
          ],)));
  }
}