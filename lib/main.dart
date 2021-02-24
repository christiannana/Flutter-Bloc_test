import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxury/pages/menu.dart';
import 'package:luxury/service/cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
          title: 'Yeswebook',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
    
    )    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Yeswebook',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 72.0),
              child: Text(
                'Test App implementation des concept de la librairie Bloc',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12), // Theme.of(context).textTheme.headline4,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 3 - 100),
            SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Téléphone",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.red))),
            ),
            SizedBox(height: 13),
            SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                height: 45,
                child: RaisedButton(
                    color: Colors.indigo,
                    textColor: Colors.white,
                    child: Text('SE CONNECTER'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuPage()),
                      );
                    })),
            SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width - 25,
              height: 45,
              child: RaisedButton(
                  child: Text('CREER UN COMPTE'), onPressed: () {}),
            )
          ],
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
