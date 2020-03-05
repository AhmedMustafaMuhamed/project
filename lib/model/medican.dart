

import 'dart:async';

import 'package:flutter/material.dart';

class medican{

   String name ;
   int timesofit;
   TimeOfDay timetostart ;

  medican({this.name, this.timesofit, this.timetostart});


   Map<String, dynamic> toMap(){
    return {
      'name': name,
      'timesofit': timesofit ,
      'timetostart':timetostart
    };
  }
}