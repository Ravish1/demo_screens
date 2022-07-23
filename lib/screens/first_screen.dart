import 'package:demo_screens/my_commons/UiHelper.dart';
import 'package:demo_screens/my_commons/my_common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../my_commons/PanelWidgetState.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool switchValue = true;
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;
  PanelController panelController = PanelController();
  PanelWidgetState? _pws;
  int panelvalue = 0;

  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
    _pws = PanelWidgetState.WIDGET_ONE;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          showDesigns(),
          showBottomSheett(),

          // the fab
        ],
      ),
    );
  }
//Here we are checking bottomsheet is opened or not if opened then change the background widget or viceversa
  showDesigns() {
   if(panelController.isAttached&& panelController != null) {
     if(panelController.isPanelOpen){
      return showmyCustomHeaderLayout();
     }
     else if(panelController.isPanelClosed)
     {
       print("Pannel is Closed");
      return showourBackgroundPannelDesign();

     }
     else if(panelController.isPanelShown){
       print("Pannel is shwoing.......");
       return showmyCustomHeaderLayout();



     }


}
   else{
     return showourBackgroundPannelDesign();
   }
   setState(() {

   });

  }
//Custom bar which is shwwoing like App Bar .The reason behind not using app bar is we cant custmize app bar more then defualt actions.
  buildCustomTopBar() {
    return Container(
      height: 60,
      color: Colors.teal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          myTextView(Colors.white, 15, FontWeight.bold, "Count Items"),
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
          Icon(
            Icons.location_off_outlined,
            color: Colors.white,
          ),
          myTextView(Colors.white, 15, FontWeight.bold, "Submit"),
        ],
      ),
    );
  }

  womensWearandTeam() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Row(
            children: [
              Icon(
                Icons.filter_list_sharp,
                color: Colors.lightBlueAccent,
              ),
              UiHelper.showHorizontalSpace(5),
              myTextView(
                  Colors.lightBlueAccent, 15, FontWeight.bold, "WomensWear"),
            ],
          )),
          UiHelper.showHorizontalSpace(5),
          Row(
            children: [
              Icon(
                Icons.people,
                color: Colors.lightBlueAccent,
              ),
              UiHelper.showHorizontalSpace(5),
              myTextView(Colors.lightBlueAccent, 15, FontWeight.bold,
                  "Team members:5"),
            ],
          ),
        ],
      ),
    );
  }

  locationIconandText() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.location_on,
            color: Colors.lightBlueAccent,
          ),
          UiHelper.showHorizontalSpace(5),
          myTextView(Colors.lightBlueAccent, 15, FontWeight.bold, "Location 3"),
        ],
      ),
    );
  }

  showDivider() {
    return UiHelper.addDivider(0, 1, Colors.grey);
  }

  buildCountTotalandstockTarget() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Row(
              children: [
                myTextView(
                    Colors.black, 15, FontWeight.bold, "Count Target: 6573"),
              ],
            )),
            UiHelper.showHorizontalSpace(5),
            Row(
              children: [
                myTextView(Colors.black, 15, FontWeight.bold,
                    "Site Stock Total:10320"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  itemScannedLocationText() {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: myTextView(Colors.black, 15, FontWeight.bold,
              "Item Scanned in other locations: 324")),
    );
  }

  triglessmodeandCount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SwitchListTile(
              title: Padding(
                  padding: const EdgeInsets.all(0),
                  child: myTextView(Colors.lightBlueAccent, 15, FontWeight.bold,
                      "Triggerles mode")),
              contentPadding: EdgeInsets.only(left: 0),
              controlAffinity: ListTileControlAffinity.leading,
              value: switchValue,
              activeColor: Colors.lightBlueAccent,
              onChanged: (bool value) {
                setState(() {
                  switchValue = value;
                });
              }),
        ),
        myTextView(Colors.black, 15, FontWeight.bold, "Your Count: 4939")
      ],
    );
  }
//TO create percent indicator
  buildRadiolGauge() {
    return Center(
      child: CircularPercentIndicator(
        radius: 100.0,
        animation: true,
        animationDuration: 2000,
        lineWidth: 10.0,
        percent: 0.30,
        reverse: true,
        arcBackgroundColor: Colors.blue,
        arcType: ArcType.FULL,
        center: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myTextView(Colors.blue, 15, FontWeight.bold, "6,573"),
            myTextView(Colors.blue, 15, FontWeight.bold, "Count Target")
          ],
        ),
        circularStrokeCap: CircularStrokeCap.square,
        backgroundColor: Colors.transparent,
        progressColor: Colors.grey,
      ),
    );
  }
//Here we are changning bottomsheet widget according to click and backpress
  _panel(ScrollController sc) {
    if (_pws == PanelWidgetState.WIDGET_ONE) {
      return _panelOne(sc);
    } else if (_pws == PanelWidgetState.WIDGET_TWO) {
      return secondPannel(sc);
    } else if (_pws == PanelWidgetState.WIDGET_THREE) {
      return thirdPannel(sc);
    } else {
      return _panelOne(sc);
    }
  }

  Widget _panelOne(ScrollController sc) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              height: 5.0,
              width: 70.0,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10.0)),
            )
          ],
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: 30,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                if (i == 0) {
                  return pannelHeaderLayout();
                } else {
                  return pannelOnedesign(i);
                }
              },
            ),
          ),
        )
      ],
    );
  }

  Widget secondPannel(ScrollController sc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              InkWell(
                onTap: (){
                  onChange(PanelWidgetState.WIDGET_ONE);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    height: 8.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
        UiHelper.marginTop(10),
        UiHelper.addDivider(0, 1, Colors.grey),
        UiHelper.marginTop(10),
        Expanded(
          child: ListView.builder(
            itemCount: 30,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              if (i == 0) {
                return secondPannelHeaderLayout();
              } else {
                return secondPannelDesign(i);
              }
            },
          ),
        )
      ],
    );
  }
//Third bottomsheet Design
  Widget thirdPannel(ScrollController sc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              InkWell(
                onTap: (){
                  onChange(PanelWidgetState.WIDGET_TWO);
                  },
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    height: 8.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
        UiHelper.marginTop(10),
        UiHelper.addDivider(0, 1, Colors.grey),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Card(
            color: Colors.grey[100],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      color: Colors.teal,
                    ),
                    alignment: Alignment.center,
                    child: myTextView(Colors.white, 15, FontWeight.bold,
                        "Short Puma Traning"),
                  ),
                  UiHelper.marginTop(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 100,
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 80,
                        ),
                      ),
                      UiHelper.showHorizontalSpace(20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            myTextView(Colors.grey, 15, FontWeight.bold,
                                "SKU 70808090"),
                            myTextView(Colors.grey, 15, FontWeight.bold,
                                "Color: Black"),
                            myTextView(
                                Colors.grey, 15, FontWeight.bold, "Size: XS"),
                            myTextView(Colors.grey, 15, FontWeight.bold,
                                "Category: Something"),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: Card(
            color: Colors.grey[200],
            child:
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      color: Colors.teal[100],
                    ),
                    child: IntrinsicHeight(
                      child: Row(children: [
                        Expanded(
                          flex: 1,
                          child: textViewWithTextAlignment(Colors.black, 15,
                              FontWeight.w500, "Expected", TextAlign.center),
                        ),
                        VerticalDivider(
                          color: Colors.white,
                          thickness: 2,
                        ),
                        Expanded(
                          flex: 1,
                          child: textViewWithTextAlignment(Colors.black, 15,
                              FontWeight.w500, "Counted", TextAlign.center),
                        ),
                        VerticalDivider(
                          color: Colors.white,
                          thickness: 2,
                        ),
                        Expanded(
                          flex: 1,
                          child: textViewWithTextAlignment(Colors.black, 15,
                              FontWeight.w500, "Diffrence", TextAlign.center),
                        ),
                      ]),
                    ),
                  ),
                  UiHelper.marginTop(15),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: textViewWithTextAlignment(Colors.black, 15,
                            FontWeight.w500, "4", TextAlign.center),
                      ),
                      Expanded(
                        flex: 1,
                        child: textViewWithTextAlignment(Colors.black, 15,
                            FontWeight.w500, "1", TextAlign.center),

                      ),
                      Expanded(
                        flex: 1,
                        child: textViewWithTextAlignment(Colors.black, 15,
                            FontWeight.w500, "3", TextAlign.center),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
        )
      ],
    );
  }
//Bottomsheet which we shwoing as slide widget to top
  showBottomSheett() {
    _panelHeightOpen = MediaQuery.of(context).size.height * .60;
    return SlidingUpPanel(
      maxHeight: _panelHeightOpen,
      minHeight: _panelHeightClosed,
      parallaxEnabled: true,
      parallaxOffset: .5,
      collapsed: setCollpasedWidget(),
      body: Container(),
      controller: panelController,
      panelBuilder: (sc) => _panel(sc),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
      onPanelSlide: (double pos) => setState(() {
        _fabHeight =
            pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
      }),
    );
  }
//Bottomsheet First screen
  Widget pannelOnedesign(int i) {
    return InkWell(
      onTap: () {
        onChange(PanelWidgetState.WIDGET_TWO);
      },
      child: Container(
        color: i.isEven ? Colors.teal[100] : Colors.grey[100],
        child: Container(
          margin: EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                  child: myTextView(
                      Colors.black, 15, FontWeight.bold, "Menswear")),
              myTextView(Colors.black, 15, FontWeight.bold, "86%"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
//This Method is used to change the bottomsheet widget with click and backpress
  void onChange(PanelWidgetState widget_two) {
    if (PanelWidgetState.WIDGET_ONE == widget_two) {
      _pws = PanelWidgetState.WIDGET_ONE;
    } else if (PanelWidgetState.WIDGET_TWO == widget_two) {
      _pws = PanelWidgetState.WIDGET_TWO;
    } else if (PanelWidgetState.WIDGET_THREE == widget_two) {
      _pws = PanelWidgetState.WIDGET_THREE;
    } else {
      _pws = PanelWidgetState.WIDGET_ONE;
    }
    setState(() {});
  }
//Second Pannel Design
  Widget secondPannelDesign(int i) {
    return InkWell(
      onTap: () {
        onChange(PanelWidgetState.WIDGET_THREE);
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.all(5),
        color: i.isEven ? Colors.teal[100] : Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                          child: myTextView(
                              Colors.black, 12, FontWeight.bold, showText(i))),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                          child: myTextView(Colors.black, 12, FontWeight.bold,
                              showDifferText(i))),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                          child: myTextView(
                              Colors.black, 12, FontWeight.bold, "0")),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                          child: myTextView(Colors.black, 12, FontWeight.bold,
                              showDiffrence(i))),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  String showText(int i) {
    return i.isEven ? "Red Tshirt M" : "Black Tshirt 42";
  }

  String showDifferText(int i) {
    return i.isEven ? "4" : "6";
  }

  String showDiffrence(int i) {
    return i.isEven ? "3" : "7";
  }
//here when panel is closed we will show our body
   showourBackgroundPannelDesign() {
    return Column(
      children: [
        buildCustomTopBar(),
        SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                womensWearandTeam(),
                UiHelper.marginTop(10),
                locationIconandText(),
                UiHelper.marginTop(25),
                showDivider(),
                UiHelper.marginTop(5),
                buildCountTotalandstockTarget(),
                UiHelper.marginTop(5),
                showDivider(),
                UiHelper.marginTop(5),
                itemScannedLocationText(),
                UiHelper.marginTop(5),
                showDivider(),
                UiHelper.marginTop(10),
                triglessmodeandCount(),
                UiHelper.marginTop(25),
                buildRadiolGauge(),
              ],
            ),
          ),
        )
      ],
    );
  }
//this method will fire when bottomsheet is opened.
   showmyCustomHeaderLayout() {
    return Column(
      children: [
       Container(
      height: 60,
      
      color: Colors.teal,
      child: Container(
        margin: EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(child: myTextView(Colors.white, 15, FontWeight.bold, "Count Items")),


            myTextView(Colors.white, 15, FontWeight.bold, "Submit"),
          ],
        ),
      ),
    ),
        buildseekbar(),


      ],
    );
  }
//this creates the header when bottomsheet opned
  buildseekbar() {
    return Container(
      margin: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              myTextView(Colors.black, 15, FontWeight.w500, "5781 Total Item Scanned"),
              myTextView(Colors.black, 15, FontWeight.w500, "75%"),
              UiHelper.marginTop(10),

            ],
          ),
          UiHelper.marginTop(10),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 80,
            animation: true,
            lineHeight: 25.0,
            animationDuration: 2500,
            percent: 0.8,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.blue,
          ),

        ],

      ),
    );
  }
//Here when bottomsheet collpaseed then change the header layout.
  setCollpasedWidget() {
    if (_pws == PanelWidgetState.WIDGET_ONE)
    {
      return pannelHeaderLayout();
    } else if (_pws == PanelWidgetState.WIDGET_TWO)
    {
      return secondPannelHeaderLayout();
    }
    else if (_pws == PanelWidgetState.WIDGET_THREE)
    {
      return new Container();
    } else {
      return pannelHeaderLayout();
    }

  }
}
