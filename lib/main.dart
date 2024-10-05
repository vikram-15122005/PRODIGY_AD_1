import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalculatorState();
  }
}

class CalculatorState extends State<Calculator>{
  String output = '';
  String _output = '';
  double _num1 = 0;
  double _num2 = 0;
  String _oprend = '';

  void _Calculation (_operator){
    if(_operator == 'C'){
      _num1 = 0;
      _num2 = 0;
      _output = '0';
      _oprend = '';

    }
    else if(_operator == '+' || _operator == '-' || _operator == '*' || _operator == '/' || _operator == '%' ){
      _num1 = double.parse(output);
      _oprend = _operator;
      _output = '';
    }
    else if(_operator == '.'){
      if(_output.contains('.')){
        print('Already contain decimal');
      }
      else {
        _output = _output + _operator;
      }
    }

    else if(_operator == '='){
      _num2 = double.parse(output);
      if(_oprend == '+'){
        _output = (_num1 + _num2).toString();
      }

      else if (_oprend == '-'){
        _output = (_num1 - _num2).toString();
      }

      else if (_oprend == '*'){
        _output = (_num1 * _num2).toString();
      }

      else if (_oprend == '/'){
        _output = (_num1 / _num2).toString();
      }

      else if (_oprend == '%'){
        _output = ((_num1 * _num2)/100).toString();
      }

      _num1 = 0;
      _num2 = 0;
      _oprend = '';
    }

    else{
      _output = _output + _operator;
    }

    print(output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget _buttonBuilder(String _operator){
    return ElevatedButton(
      onPressed: (){
        _Calculation(_operator);
      },
      child: Text('$_operator',
        style: TextStyle(fontSize:30),),
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
        elevation: WidgetStatePropertyAll(18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title:'Calculator',
        home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
        title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text('Calculator',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
    ],
    ),
    backgroundColor:Colors.white,
    ),
    body: Padding(
    padding: EdgeInsets.all(8),
    child: Column(

    children: [

    Container(
    width: double.maxFinite,
    height: 90,
    decoration: const BoxDecoration(
    color: Colors.white,
    boxShadow:[BoxShadow(
    color:Colors.blueAccent,
    blurStyle: BlurStyle.outer,
    spreadRadius: 15,
    blurRadius: 15,
    )],
    ),
    child: Column(
    children: [
    Text(_output),
    Text(output,
    style: TextStyle(fontSize:30),),
    ],
    ),
    alignment: Alignment.centerRight,
    ),

    SizedBox(height: 50),

    Expanded(
    child:GridView.count(
    crossAxisSpacing:5,
    mainAxisSpacing: 5,
    crossAxisCount:4,
    children: [
    _buttonBuilder('C'),
    _buttonBuilder('%'),
    _buttonBuilder('&'),
    _buttonBuilder('/'),
    _buttonBuilder('7'),
    _buttonBuilder('8'),
    _buttonBuilder('9'),
    _buttonBuilder('-'),
    _buttonBuilder('4'),
    _buttonBuilder('5'),
    _buttonBuilder('6'),
    _buttonBuilder('+'),
    _buttonBuilder('1'),
    _buttonBuilder('2'),
    _buttonBuilder('3'),
    _buttonBuilder('*'),
    _buttonBuilder('00'),
    _buttonBuilder('0'),
    _buttonBuilder('.'),
    _buttonBuilder('='),
    ],
    ),
    ),
    ],
    ),
    ),
        ),
    );
  }
}