import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Application',
      home: CalculatorApplication(),
    );
  }
}

class CalculatorApplication extends StatefulWidget {
  @override
  _CalculatorApplicationState createState() => _CalculatorApplicationState();
}

class _CalculatorApplicationState extends State<CalculatorApplication> {
  String _output = "";
  String _input = "";
  String _result = "";
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operator = "";

  void _onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        _output = "";
        _input = "";
        _num1 = 0.0;
        _num2 = 0.0;
        _operator = "";
        _result = "";
      }else if(value == "CE"){
        setState(() {
          if (_input.isNotEmpty) {
            _input = _input.substring(0, _input.length - 1);
            _output = _output.substring(0, _output.length - 1);
          }
        });
      }
      else if(value == "(" || value == ")"){
        _input += value;

      }
      else if(value == "." || value == "0" || value == "00" || value == "1" || value == "2" || value == "3" || value == "4" || value == "5" || value == "6" || value == "7" || value == "8" || value == "9"){
        _input += value;
        _output += value;
      }
      else if (value == "+" || value == "-" || value == "*" || value == "/" || value=="%") {
        _operator = value;
        _input += value;
        _num1 = double.parse(_output);
        _output = "";
      } else if (value == "=") {
        _num2 = double.parse(_output);
        if (_operator == "+") {
          _result = (_num1 + _num2).toString();
          _output = _result;
        } else if (_operator == "-") {
          _result = (_num1 - _num2).toString();
          _output = _result;
        } else if (_operator == "*") {
          _result = (_num1 * _num2).toString();
          _output = _result;
        } else if (_operator == "/") {
          _result = (_num1 / _num2).toStringAsFixed(10);
          _output = _result;
        }
        else if (_operator == "%") {
          _result = ((_num1 * _num2)/100).toString();
        }
        _operator = "";
        _num1 = 0.0;
        _num2 = 0.0;
      } else {
        _output += value;
      }
    });
  }

  Widget _buildButton(String value) {
    final Color buttonsCOlor = Color(0xFF0B344F);
    return Expanded(

      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all<Color>(buttonsCOlor),
          // Change this color
        ),
        onPressed: () => _onButtonPressed(value),
        child: Text(
          value,
          style: TextStyle(fontSize: 30.0,),
        ),
      ),
    );
  }

  Widget _lastBuildButton(String value) {
    final Color buttonsCOlor = Color(0xFF0B344F);
    return Container(
      width: 100,
      height: 58,
      child: ElevatedButton(

        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all<Color>(buttonsCOlor),
          // Change this color
        ),
        onPressed: () => _onButtonPressed(value),
        child: Text(
          value,
          style: TextStyle(fontSize: 30.0,),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final Color appbarAndBody = Color(0xFF0E2433);
    final Color buttonsCOlor = Color(0xFF0B344F);

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
        backgroundColor: appbarAndBody,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
        toolbarHeight: 60,
        leading: Icon(Icons.menu),
        elevation: 0,

      ),
      body: Form(

        child: Column(

          children: <Widget>[
            Container(
              color: appbarAndBody,
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              child: Column(
                children: [
                  Text(
                    _input.toString(),
                    style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(
                    height: 125.5,
                  ),

                  Text(
                    _result,
                    style: TextStyle(fontSize: 49.90, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],

              ),
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              decoration: BoxDecoration(
                color: buttonsCOlor,
              ),
              child: Column(
                children: [
                  Row(

                    children: <Widget>[
                      ElevatedButton(

                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(0),
                          backgroundColor: MaterialStateProperty.all<Color>(buttonsCOlor),
                          // Change this color
                        ),
                        onPressed: () => _onButtonPressed("down"),
                        child: Icon(Icons.arrow_drop_down),
                      ),
                      _buildButton("C"),
                      ElevatedButton(

                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(0),
                          backgroundColor: MaterialStateProperty.all<Color>(buttonsCOlor),
                          // Change this color
                        ),
                        onPressed: () => _onButtonPressed("CE"),
                        child: Icon(Icons.close),
                      ),
                      _buildButton("/"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      _buildButton("("),
                      _buildButton(")"),
                      _buildButton("%"),
                      _buildButton("*"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      _buildButton("1"),
                      _buildButton("2"),
                      _buildButton("3"),
                      _buildButton("-"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      _buildButton("4"),
                      _buildButton("5"),
                      _buildButton("6"),
                      _buildButton("+"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _lastBuildButton("7"),
                              _lastBuildButton("8"),
                              _lastBuildButton("9"),
                            ],
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _lastBuildButton("0"),
                              _lastBuildButton("00"),
                              _lastBuildButton("."),
                            ],
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Container(
                            width: 92,
                            height: 116,

                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(0),
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF296D98)),
                                // Change this color
                              ),
                              onPressed: () => _onButtonPressed("="),
                              child: Text(
                                "=",
                                style: TextStyle(fontSize: 30.0,),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

