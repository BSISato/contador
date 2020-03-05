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

int _contadorA = 0;
int _contadorB = 0;
String timeA = "TIME A";
String timeB = "TIME B";

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  void _alteraContagemA(int comando) {
    setState(() {
      _contadorA += comando;
      if (_contadorA == -1) {
        //ORIENTADA A GAMBIARRA
        _contadorA = 0;
      } else if (_contadorA >= 10 && _contadorB <= _contadorA - 2) {
        showAlertDialogA(context);
        _contadorA = 0;
        _contadorB = 0;
      }
    });
  }

  void _alteraContagemB(int comando) {
    setState(() {
      _contadorB += comando;
      if (_contadorB == -1) {
        //ORIENTADA A GAMBIARRA
        _contadorB = 0;
      } else if (_contadorB >= 10 && _contadorA <= _contadorB - 2) {
        showAlertDialogB(context);
        _contadorA = 0;
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
                    "$timeA",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                Padding(
                  //ORIENTADA A GAMBIARRA
                  padding: EdgeInsets.all(5.0),
                  child: RaisedButton(
                    child: Text(
                      "RESULTADOS",
                      style: TextStyle(fontSize: 20.0, color: Colors.red),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Segunda()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "$timeB",
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
                    style: TextStyle(fontSize: 120.0, color: Colors.white),
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
                    style: TextStyle(fontSize: 120.0, color: Colors.white),
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
                  child: FlatButton(
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 55.0, color: Colors.black),
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
                  child: FlatButton(
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 55.0, color: Colors.black),
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
                  child: FlatButton(
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 55.0, color: Colors.black),
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
                      style: TextStyle(fontSize: 25.0, color: Colors.red),
                    ),
                    onPressed: () {
                      _zera();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: FlatButton(
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 55.0, color: Colors.black),
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
/////////////////////////////////////////////////
/////////////////////////////////////////////////

class Segunda extends StatefulWidget {
  @override
  _Segunda createState() => _Segunda();
}

class _Segunda extends State<Segunda> with SingleTickerProviderStateMixin {
  AnimationController _controller;

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    "$timeA",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "$timeB",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Align(
              //alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                child: Text(
                  "<<<",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}

showAlertDialogA(BuildContext context) {
  // configura o button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("FIM DO JOGO"),
    content: Text("Vitoria do $timeA\n\n"
        "$timeA  $_contadorA  x  $_contadorB  $timeB"),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

showAlertDialogB(BuildContext context) {
  // configura o button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("FIM DO JOGO"),
    content: Text("Vitoria do $timeB\n\n"
        "$timeA  $_contadorA  x  $_contadorB  $timeB"),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
