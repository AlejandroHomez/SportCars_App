import 'dart:async';

import 'package:flutter/material.dart';
import 'package:productos_app/models/navigation_model.dart';
import 'package:productos_app/models/pinterest_menu_model.dart';
import 'package:productos_app/widgets/book_car.dart';
import 'package:productos_app/widgets/car_widget.dart';
import 'package:productos_app/widgets/constants.dart';
import 'package:productos_app/widgets/data.dart';
import 'package:provider/provider.dart';

class AvailableCars extends StatefulWidget {
  @override
  _AvailableCarsState createState() => _AvailableCarsState();
}

class _AvailableCarsState extends State<AvailableCars> {


  List<Filter> filters = getFilterList();
  late Filter selectedFilter;

  @override
  void initState() {

    super.initState();
    setState(() {
      selectedFilter = filters[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (_) => MenuModelProvider(),
      child: Scaffold(
            backgroundColor: Colors.grey[100],
            body: SafeArea(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.black,
                          size: 28,
                        )
                      ),
                    ),


                    _TituloLista(),

                    SizedBox(
                      height: 16,
                    ),

                    _Paginas( ),

                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  buildFilterIcon(),
                  Row(
                    children: buildFilters(),
                  ),
                ],
              ),
            ),
          ),
      );
  }

  Widget buildFilterIcon(){
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Center(
        child: Icon(
          Icons.filter_list,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  List<Widget> buildFilters(){
    List<Widget> list = [];
    for (var i = 0; i < filters.length; i++) {
      list.add(
        
        _BuildFitler(filters[i], i)
        
        );
    }
    return list;
  }

}

class _TituloLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   final navigationModel = Provider.of<NavigationModel>(context);
  final menuProvider = Provider.of<MenuModelProvider>(context);


   if(menuProvider.itemSeleccionado == 0) {

     return Text(
        "Los Mejores",
        style: TextStyle(
          color: Colors.black,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      );
   }

   return Text(
      menuProvider.itemSeleccionado == 1 ? 'Mayor precio' : 'Mas economicos',
      style: TextStyle(
        color: Colors.black,
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
    );

    
  }
}

class _BuildFitler extends StatefulWidget {

  final Filter filter;
  final int index;

  _BuildFitler(this.filter, this.index);

  @override
  State<_BuildFitler> createState() => _BuildFitlerState();
}

class _BuildFitlerState extends State<_BuildFitler> {
  @override
  Widget build(BuildContext context) {

    final menuProvider = Provider.of<MenuModelProvider>(context);
      final navigationModel = Provider.of<NavigationModel>(context);



     return GestureDetector(
       onTap: () {

        navigationModel.paginaActual = widget.index;
      },
      child: Padding(
        padding: EdgeInsets.only(right: 16),
        child: Text(
          widget.filter.name,
          style: TextStyle(
            color: menuProvider.itemSeleccionado == widget.index
                ? kPrimaryColor
                : Colors.grey[300],
            fontSize: 16,
            fontWeight:
               menuProvider.itemSeleccionado == widget.index ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class _Paginas extends StatefulWidget {
 
  @override
  State<_Paginas> createState() => _PaginasState();
}

class _PaginasState extends State<_Paginas> {

 PageController controller = PageController();

  @override
  void initState() {
    controller.addListener(() {
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

  final menuProvider = Provider.of<MenuModelProvider>(context);
  
  final navigationModel = Provider.of<NavigationModel>(context);

    return Expanded(
      child: PageView(
        controller: navigationModel.pageController,
        allowImplicitScrolling: false,
        scrollDirection: Axis.horizontal,
        onPageChanged: (value) {
          menuProvider.setItemSeleccionado = value;
        },
        children: [

      _PageMejores(),
      _PageCaros(),
      _PageBaratos(),

        ],
      ),
    );
  }
}

class _PageMejores extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
       physics: BouncingScrollPhysics(),
       childAspectRatio: 1 / 1.55,
       crossAxisCount: 2,
       mainAxisSpacing: 15,
       children: getCarListMejores().map((item) {
         return GestureDetector(
           onTap: () {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => BookCar(car: item)),
             );
           },
           child: buildCarLista(item, 0)
         );
       }).toList(),
     );
  }
}

class _PageCaros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: BouncingScrollPhysics(),
      childAspectRatio: 1 / 1.55,
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      children: getCarListCaros().map((item) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookCar(car: item)),
              );
            },
            child: buildCarLista(item, 0));
      }).toList(),
    );
  }
}

class _PageBaratos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: BouncingScrollPhysics(),
      childAspectRatio: 1 / 1.55,
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      children: getCarListBaratos().map((item) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookCar(car: item)),
              );
            },
            child: buildCarLista(item, 0));
      }).toList(),
    );
  }
}
