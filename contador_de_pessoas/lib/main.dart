import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static int _people = 0;
  String _normalWorldText = "Pode entrar";
  String _upSideDownText = "Mundo invertido";
  String _infoText = "Pode entrar";

  String getNormalWorldText() {
    return _normalWorldText;
  }

  String getUpSideDownText() {
    return _upSideDownText;
  }

  void _setEntryText() {
    if(_people >=0) {
      _infoText = this.getNormalWorldText();
    } else {
      _infoText = this.getUpSideDownText();
    }
  }

  void _changePeople(int value) {
    setState(() {
      _people += value;
      this._setEntryText();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/restaurant.jpg", fit: BoxFit.cover, height: 1000.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_people",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("-1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white)),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("+1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white)),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                )
              ],
            ),
            Text(_infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0))
          ],
        )
      ],
    );
  }
}
