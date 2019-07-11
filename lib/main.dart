import 'package:flutter/material.dart';

import 'CustomShapeClipper.dart';

void main() => runApp(MaterialApp(
      title: 'FLight List Mock Up',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: appTheme,
    ));

ThemeData appTheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');
const TextStyle dropDownLabelStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //SE DIVIDIE LA PANTALLA PRINCIPAL EN DOS WIDGETS DENTRO DE UNA COLUMNA
      body: Column(
        children: <Widget>[
          //WIDGET TOP
          HomeScreenTopContainer(),
          homeScreenBottomPart
          //WIDGET DEBAJO
        ],
      ),
    );
  }
}

//LO HACEMOS STATEFUL YA QUE SE TENDRA QUE MODIFICAR CONTENIDO EN SU INTERIOR
class HomeScreenTopContainer extends StatefulWidget {
  @override
  _HomeScreenTopContainerState createState() => _HomeScreenTopContainerState();
}

class _HomeScreenTopContainerState extends State<HomeScreenTopContainer> {
  Color firstColor = Color(0xFFF47D15);
  Color secondColor = Color(0xFFEF772C);
  List<String> locations = ['Boston (BOS)', 'New York City (JFK)'];
  var selectedLocationIndex = 0;
  var isFlightSelected = true;

  @override
  Widget build(BuildContext context) {
    //USAMOS UN Stack PARA HACER CAMBIOS EN EL RENDER DEL CONTENEDOR
    return Stack(
      children: <Widget>[
        ClipPath(
          //CREAMOS UN CLIP CUSTOM PARA QUE HAGA LA FORMA QUE DESEAMOS
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            //AÑADIMOS UN GRADIENTE AL CONTENEDOR
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
            //AÑADIMOS UNA COLUMNA AL CONTENEDOR QUE CONTENDRA LOS ELEMENTOS INTERNOS
            child: Column(
              //EMPEZAMOS A AÑADIR LOS ELEMENTOS
              children: <Widget>[
                //AGREGAMOS UNA CAJA VACIA CON ALTURA PARA SITUAR MEJOR TODOS LOS ELEMENTOS
                SizedBox(
                  height: 50.0,
                ),
                //AÑADIMOS PADDING A LA PRIMERA FILA DE ELEMENTOS
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      PopupMenuButton(
                          onSelected: (index) {
                            setState(() {
                              selectedLocationIndex = index;
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              Text(
                                locations[selectedLocationIndex],
                                style: dropDownLabelStyle,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              )
                            ],
                          ),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuItem<int>>[
                                PopupMenuItem(
                                  child: Text(
                                    locations[0],
                                    style: dropDownMenuItemStyle,
                                  ),
                                  value: 0,
                                ),
                                PopupMenuItem(
                                  child: Text(
                                    locations[1],
                                    style: dropDownMenuItemStyle,
                                  ),
                                  value: 1,
                                )
                              ]),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  '¿A donde te gustaria ir?',
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: TextField(
                      controller: TextEditingController(text: locations[1]),
                      style: dropDownMenuItemStyle,
                      cursorColor: appTheme.primaryColor,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 14.0),
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: ChoiceChip(
                          Icons.flight_takeoff, "Vuelos", isFlightSelected),
                      onTap: () {
                        setState(() {
                          isFlightSelected = true;
                        });
                      },
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      child:
                          ChoiceChip(Icons.hotel, "Hoteles", !isFlightSelected),
                      onTap: () {
                        setState(() {
                          isFlightSelected = false;
                        });
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  ChoiceChip(this.icon, this.text, this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.all(Radius.circular(20.0)))
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20.0,
            color: Colors.white,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            widget.text,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          )
        ],
      ),
    );
  }
}

var viewAllStyle = TextStyle(fontSize: 14.0, color: appTheme.primaryColor);

var homeScreenBottomPart = Container(
  child: Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Vistos actualmente",
              style: dropDownMenuItemStyle,
            ),
            Spacer(),
            Text(
              "TODOS(12)",
              style: viewAllStyle,
            )
          ],
        ),
      ),
      Container(
        height: 130.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: cityCards
        ),
      )
    ],
  ),
);

List<CityCard> cityCards = [
  CityCard("assets/images/lasvegas.jpg","Las Vegas", "Feb 2019", "45", "4299", "2250"),
  CityCard("assets/images/athens.jpg","Atenas", "Apr 2019", "50", "9999", "4159"),
  CityCard("assets/images/sydney.jpeg","Sydney", "Dec 2019", "40", "5999", "2399"),
];

class CityCard extends StatelessWidget {
  final String imagePath, cityName, monthYear, discount, oldPrice, newPrice;

  CityCard(this.imagePath, this.cityName, this.monthYear, this.discount,
      this.oldPrice, this.newPrice);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Stack(
          children: <Widget>[
            Container(
              height:130.0,
              width: 160.0,
              child: Image.asset(imagePath, fit: BoxFit.cover,),
            ),
            Positioned(
              left: 10.0,
              bottom: 10.0,
              right: 5.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(cityName, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 18.0),),
                      Text(monthYear,style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white,fontSize: 14.0),)
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      child: Text("$discount%",style: TextStyle(color: Colors.black, fontSize: 14.0),)
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


