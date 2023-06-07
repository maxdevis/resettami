import 'package:flutter/widgets.dart';

class AppConfig {
  static double width = 0;
  static double height = 0;
  static double blockSize = 0;
  static double blockSizeVertical = 0;

  void init(BuildContext context){
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    blockSize = width / 100;
    blockSizeVertical = height / 100;
  }


}