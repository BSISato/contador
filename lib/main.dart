import 'package:flutter/material.dart';
import 'package:flutter/services.Dart';

void main() {
  //no "runApp é necessário passar um Widget que no caso esta sendo
  //passado o "MaterialApp"
  runApp(MaterialApp(title: "Contador", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int _contadorA = 0;
  int _contadorB = 0;

  void _alteraContagemA(int comando) {
    setState(() {
      _contadorA += comando;
      if (_contadorA == -1) {
        //ORIENTADA A GAMBIARRA
        _contadorA = 0;
      }
    });
  }

  void _alteraContagemB(int comando) {
    setState(() {
      _contadorB += comando;
      if (_contadorB == -1) {
        //ORIENTADA A GAMBIARRA
        _contadorB = 0;
      }
    });
  }

  void _zera() {
    setState(() {
      _contadorA = 0;
      _contadorB = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
  ]);
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'images/placar.jpg',
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Linha TIME A e B
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "Time A",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                Padding(
                  //ORIENTADA A GAMBIARRA
                  padding: EdgeInsets.all(5.0),
                  child: FlatButton(
                    child: Text(
                      "",
                      style: TextStyle(fontSize: 20.0, color: Colors.red),
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "Time B",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ],
            ),
            //PLACAR
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text(
                    "$_contadorA",
                    style: TextStyle(fontSize: 140.0, color: Colors.white),
                  ),
                ),
                Padding(
                  //ORIENTADA A GAMBIARRA
                  padding: EdgeInsets.all(2.0),
                  child: FlatButton(
                    child: Text(
                      "",
                      style: TextStyle(fontSize: 20.0, color: Colors.red),
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text(
                    "$_contadorB",
                    style: TextStyle(fontSize: 140.0, color: Colors.white),
                  ),
                ),
              ],
            ),
            //Linha de incrementar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: FloatingActionButton(
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _alteraContagemA(1);
                    },
                  ),
                ),
                Padding(
                  //ORIENTADA A GAMBIARRA
                  padding: EdgeInsets.all(2.0),
                  child: FlatButton(
                    child: Text(
                      "",
                      style: TextStyle(fontSize: 20.0, color: Colors.red),
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: FloatingActionButton(
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _alteraContagemB(1);
                    },
                  ),
                ),
              ],
            ),
            //Linha de decrementar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: FloatingActionButton(
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _alteraContagemA(-1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: RaisedButton(
                    child: Text(
                      "ZERAR",
                      style: TextStyle(fontSize: 20.0, color: Colors.red),
                    ),
                    onPressed: () {
                      _zera();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: FloatingActionButton(
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _alteraContagemB(-1);
                    },
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
