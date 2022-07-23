import 'package:flutter/material.dart';

 class UiHelper{


  static marginTop(double height){
    return new SizedBox(
      height: height,
    );
  }
  static addImageView(double height,double width,String image)
  {
   return Image.asset(image,height: height,width: width,);
  }
  static addDivider(double height,double thickness,Color colors)
  {
    return new Divider(
      height: height,
      color: colors,
      thickness: thickness,
    );
  }
  static showHorizontalSpace(double width){
    return new SizedBox(
      width: width,
    );
  }



}