import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/addnewmedican.dart';

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/img/section1_img.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text('set time to start'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => medicanForm()),
                  );
                }
            ),]
          ,
        ),
        /*padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Icon(Icons.add),
                    Text("add New Medican"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => medicanForm()),
                  );
                })
          ],
        ),*/
      ),
    );
  }

  _showDialog() {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('medican has saved')));
  }
}
/*
Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
            RaisedButton(
            child: Text('set time to start'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => medicanForm()),
              );
            }
    ),]
    ,
    )
* */