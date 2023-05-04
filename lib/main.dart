import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _input = '';
  String _output = '';

  void _onPressed(String value) {
    setState(() {
      _input += value;
    });
  }

  void _calculate() {
    setState(() {
      _output = _input + ' = ' + _input;
    });
  }

  void _clear() {
    setState(() {
      _input = '';
      _output = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerRight,
              child: Text(
                _input,
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerRight,
              child: Text(
                _output,
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  _buildButton('7'),
                  _buildButton('8'),
                  _buildButton('9'),
                  _buildButton('/'),
                ],
              ),
              Row(
                children: [
                  _buildButton('4'),
                  _buildButton('5'),
                  _buildButton('6'),
                  _buildButton('*'),
                ],
              ),
              Row(
                children: [
                  _buildButton('1'),
                  _buildButton('2'),
                  _buildButton('3'),
                  _buildButton('-'),
                ],
              ),
              Row(
                children: [
                  _buildButton('0'),
                  _buildButton('.'),
                  _buildButton('+'),
                  _buildButton('='),
                ],
              ),
              Row(
                children: [
                  _buildButton('C'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _buildButton(String value) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: TextButton(
          onPressed: () {
            if (value == 'C') {
              _clear();
            } else if (value == '=') {
              _calculate();
            } else {
              _onPressed(value);
            }
          },
          style: TextButton.styleFrom(
            primary: Colors.black,
            backgroundColor: Colors.grey[200],
            padding: EdgeInsets.all(24.0),
          ),
          child: Text(
            value,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
