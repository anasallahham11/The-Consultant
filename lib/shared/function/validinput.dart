import 'package:flutter/material.dart';

validinput(String val, int min, int max, String type) {

  /*if (val.isEmpty) {
    //return "can't be Empty";
  }*/

  if (val.length < min) {
    return "can't be less than $min";
  }
  if (val.length > max) {
    return "can't be larger than $max";
  }
}
