import 'package:flutter/material.dart';
import 'main.dart';
import 'CustomShapeClipper.dart';

final Color discountBackgroundColor = Color(0xFFFFE08D);
final Color flightBorderColor =       Color(0xFFE6E6E6);
final Color chipBackgroundColor =     Color(0xFFF6F6F6);

class FlightListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultados"),
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            FlightListPart(),
            SizedBox(height: 20.0,),
            FlighListBottomPart()
          ],
        ),
      ),
    );
  }
}

class FlightListPart extends StatelessWidget {
  Color firstColor = Color(0xFFF47D15);
  Color secondColor = Color(0xFFEF772C);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 160.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                firstColor,
                secondColor
              ])
            ),
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 20.0,),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Boston (BOS)",style: TextStyle(fontSize: 16.0),),
                          Divider(color: Colors.grey, height: 20.0,),
                          Text("New York City (JFK)",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(flex: 1,child: Icon(Icons.import_export,color: Colors.black,size: 28.0,))
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class FlighListBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Mejores ofertas",style: dropDownMenuItemStyle,),
          ),
          SizedBox(height: 10.0,),
          ListView(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
            ],
          ),

        ],
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: flightBorderColor),
            ),
            //height: 100.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("${formatCurrency.format(4159)}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                      SizedBox(width: 4.0,),
                      Text("(${formatCurrency.format(9999)})",style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 16.0, decoration: TextDecoration.lineThrough),)
                    ],
                  ),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: -8.0,
                    children: <Widget>[
                      FlightDetailChip(Icons.calendar_today, "Ene 2019"),
                      FlightDetailChip(Icons.flight_takeoff, "Jet Ariways"),
                      FlightDetailChip(Icons.star, "4.4"),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 10.0,
            right: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text("55%", style: TextStyle(color: appTheme.primaryColor,fontSize: 14.0,fontWeight: FontWeight.bold),),
              decoration: BoxDecoration(
                color: discountBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FlightDetailChip extends StatelessWidget {
  final IconData chipIcon;
  final String nameChip;

  FlightDetailChip(this.chipIcon,this.nameChip);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      avatar: Icon(chipIcon,size: 14.0,),
      label: Text(nameChip),
      labelStyle: TextStyle(color: Colors.black, fontSize: 14.0),
      backgroundColor: chipBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );
  }
}


