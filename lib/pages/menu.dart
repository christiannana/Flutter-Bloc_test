import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxury/service/cubit.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int valeur = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Yeswebook'),
      ),
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_balance, color: Colors.blueGrey, size: 65),
              Text(
                '\n\n\n\nGestion des partenaires,\nGestion des cleaners,\nGestion des voyageurs,',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1570129477492-45c003edd2be?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3 + 50,
              child: Center(
                child: BlocBuilder<CounterCubit, int>(
                  builder: (context, state) {
                    return Text(
                      state.toString(), //valeur.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 65,
                          color: state < 0
                              ? Colors.redAccent
                              : state == 0 ? Colors.grey : Colors.indigo),
                    );
                  },
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 3 + 20,
                      child: RaisedButton(
                          color: Colors.indigo,
                          child: Text(
                            '-',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).decrement();
                            // setState(() {
                            //   valeur = valeur - 1;
                            // });
                          }),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 3 + 20,
                      child: RaisedButton(
                          color: Colors.indigo,
                          child: Text(
                            '+',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).increment();
                            // setState(() {
                            //   valeur = valeur + 1;
                            // });
                          }),
                    )
                  ],
                ),
              ],
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
