import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];
  final TextStyle bottomNavigationBatItemStyle = TextStyle(
    color:Colors.black,
    fontStyle: FontStyle.normal,
    fontSize: 10.0
  );

  CustomAppBar(){
    bottomBarItems.add(
      BottomNavigationBarItem(

          icon: Icon(Icons.home,color: Colors.black,),
          title: Text("Explora",style: bottomNavigationBatItemStyle)
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite,color: Colors.black,),
          title: Text("Lista de Deseos",style: bottomNavigationBatItemStyle)
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
          icon: Icon(Icons.local_offer,color: Colors.black,),
          title: Text("Ofertas",style: bottomNavigationBatItemStyle)
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
          icon: Icon(Icons.notifications,color: Colors.black,),
          title: Text("Notificaciones",style: bottomNavigationBatItemStyle)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: bottomBarItems,
      type: BottomNavigationBarType.fixed,
    );
  }
}
