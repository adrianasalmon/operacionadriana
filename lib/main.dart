import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Frases Celebres",
      home: Operacion(),
    );
  }
}

class Operacion extends StatefulWidget {
  Operacion({Key key}) : super(key: key);

  @override
  _OperacionState createState() => _OperacionState();
}

class _OperacionState extends State<Operacion> {
  String mensaje = "";
  final TextEditingController parametrocontroller = new TextEditingController();

  Future obtenerOperacion(String valor) async {
    
    print("entro a la funcion");
    var response = await http.get(
      Uri.http("apioperaciona.azurewebsites.net","/api/Operacion/"+ valor));
    print(response.body);
    setState(() {
      mensaje=response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("OPERACION-ADRIANA",
            style: TextStyle(fontSize: 20.0, color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
              child: TextFormField(
            controller: parametrocontroller,
          )),
          Text("Response: $mensaje"),
          RaisedButton(
            onPressed: () async {
              await obtenerOperacion(parametrocontroller.text);
            },
            child: Text("Boton"),
          )
        ],
      ),
    );
  }
}
