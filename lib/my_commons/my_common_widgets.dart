import 'package:flutter/material.dart';

import 'PanelWidgetState.dart';
import 'UiHelper.dart';

Widget myTextView(Color color, double textsize, FontWeight fontWeight,
    String text) {
  return new Text(
    text, style: new TextStyle(
      color: color, fontSize: textsize, fontWeight: fontWeight),
  );
}

Widget textViewWithTextAlignment(Color color, double textsize,
    FontWeight fontweight, String text, TextAlign textAlign) {
  return Text(
    text, textAlign: textAlign,
    style: new TextStyle(
        color: color, fontSize: textsize, fontWeight: fontweight),
  );
}

Widget roundRectangleEditText(String hinttext, double radious,
    TextInputType textInputType, TextEditingController controller,
    TextAlign textAlign, TextS, Color hinttextcolor, Color bordersidecolor) {
  return TextField(
    textAlign: textAlign,
    controller: controller,
    keyboardType: textInputType,
    decoration: InputDecoration(
      hintText: hinttext,
      hintStyle: TextStyle(fontSize: 12, color: hinttextcolor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radious),
        borderSide: BorderSide(
            width: 1,
            color: bordersidecolor

        ),
      ),
      filled: true,
      contentPadding: EdgeInsets.all(10),
    ),
  );
}

Future myNavigator(BuildContext context, Widget widget) {
  return Navigator.push(context, new MaterialPageRoute(
      builder: (context) => widget
  ));
}

Future myNavigatorwithMap(BuildContext context, Widget widget, Map map) {
  return Navigator.push(context, new MaterialPageRoute(
      builder: (context) => widget
  ));
}

Widget myTextField(String hinttext, TextEditingController controller,
    TextInputType inputType) {
  return TextField(
    textAlign: TextAlign.start,
    keyboardType: inputType,
    obscureText: true,
    controller: controller,
    decoration: InputDecoration(
      hintText: hinttext,
      hintStyle: TextStyle(fontSize: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
            width: 0, style: BorderStyle.none, color: Colors.white),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.all(16),
    ),
  );
}

Widget myAppBar(String tittle, bool centertitle, Color backgroundColor,
    bool isBackButton, IconData leadingicon, Color titlecolor, double fontsize,
    Color iconcolor,BuildContext context) {
  return new AppBar(
    title: new Text(tittle, style: new TextStyle(
        color: titlecolor, fontSize: fontsize, fontWeight: FontWeight.bold),),
    centerTitle: centertitle,
    backgroundColor: backgroundColor,
    leading: isBackButton ? InkWell(
        onTap: (){
          Navigator.of(context).pop();
        },
        child: new Icon(leadingicon, color: iconcolor,)) : new Container(),
  );
}
Widget pannelHeaderLayout()
{
  return new Card(
    color: Colors.teal,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10))),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: IntrinsicHeight(
        child: new Row(
          children: [
            new Expanded(
              flex: 2,
              child: new Row(
                children: [
                  Expanded(child: myTextView(Colors.white, 15, FontWeight.bold, "Department")),
                  Icon(Icons.arrow_upward,size: 22,color: Colors.white,),
                  Icon(Icons.arrow_downward,size: 20,color: Colors.white,),

                ],
              ),
            ),
            VerticalDivider(
              color: Colors.white,
              thickness: 1,
            ),

            new Expanded(
              flex: 1,
              child: new Row(
                children: [
                  Expanded(child: myTextView(Colors.white, 15, FontWeight.bold, "Counted")),
                  Icon(Icons.arrow_upward,size: 22,color: Colors.white,),
                  Icon(Icons.arrow_downward,size: 20,color: Colors.white,),

                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
Widget secondPannelHeaderLayout()
{
  return new Card(
    color: Colors.teal,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: IntrinsicHeight(
          child: new Row(
            children: [
              new Expanded(
                  flex:2,
                  child: new Row(
                    children: [
                      Expanded(child: myTextView(Colors.white, 12, FontWeight.bold, "Name")),
                      Icon(Icons.arrow_upward,size: 22,color: Colors.white,),

                    ],
                  )),
              VerticalDivider(
                color: Colors.white,
                thickness: 2,
              ),
              new Expanded(
                  flex:1,
                  child: new Row(
                    children: [
                      myTextView(Colors.white, 12, FontWeight.bold, "Expected"),

                    ],
                  )),
              VerticalDivider(
                color: Colors.white,
                thickness: 2,
              ),
              new Expanded(
                  flex:1,
                  child: new Row(
                    children: [
                      myTextView(Colors.white, 12, FontWeight.bold, "Counted"),

                    ],
                  )),
              VerticalDivider(
                color: Colors.white,
                thickness: 2,
              ),
              new Expanded(
                  flex:2,
                  child: new Row(
                    children: [
                      Expanded(child: myTextView(Colors.white, 12, FontWeight.bold, "Diffrence")),
                      Icon(Icons.arrow_downward,size: 22,color: Colors.white,),
                    ],
                  )),
            ],
          ),
        ),
      ),
    ),
  );
}





