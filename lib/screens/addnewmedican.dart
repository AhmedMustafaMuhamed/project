
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/medican.dart';
import '../model/sqlmedican.dart';

class medicanForm extends StatefulWidget {
  String title = "Add New Medican";

  @override
  _medicanFormState createState() => _medicanFormState();
}

class _medicanFormState extends State<medicanForm> {
  final _formkey = GlobalKey<FormState>();
  final scafoldKey = GlobalKey<ScaffoldState>();
  final sqlmedican obj = sqlmedican();
  final medican _med = medican();
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay _picked;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'Assets/img/stethoscope.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Builder(
            builder: (context) => Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'enter medican name'),
                      validator: (val) {
                        if (val.isEmpty) return "please enter medican name";
                      },
                      onSaved: (val) => setState(() => _med.name = val),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'num of times'),
                      validator: (val) {
                        if (val.isEmpty) return "please enter num of times";
                      },
                      onSaved: (val) =>
                          setState(() => _med.timesofit = int.parse(val)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: RaisedButton(
                          child: Text('set time to start'),
                          onPressed: () {
                            final form = _formkey.currentState;
                            if (form.validate()) {
                              sellectTime(context);

                            }
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: RaisedButton(
                          child: Text('save medican'),
                          onPressed: () async{
                            final form = _formkey.currentState;
                            if (form.validate()) {
                              setState(() {
                                Navigator.pop(context);
                              });
                              await obj.opendatabase();
                              await obj.insert(_med);
                            }
                          }),
                    ),
                  ],
                ))),
      ),
    );
  }
  sellectTime(context)async{

    _picked=await showTimePicker(context: context, initialTime: _time);
    setState(() {
      _med.timetostart = _picked;
      // print(_picked);

    });
  }
}
