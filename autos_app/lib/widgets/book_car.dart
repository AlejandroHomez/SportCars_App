import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:productos_app/widgets/constants.dart';
import 'package:productos_app/widgets/data.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class BookCar extends StatefulWidget {

  final Car car;

  BookCar({required this.car});

  @override
  _BookCarState createState() => _BookCarState();
}

class _BookCarState extends State<BookCar> {

  int _currentImage = 0;

  List<Widget> buildPageIndicator(){
    List<Widget> list = [];
    for (var i = 0; i < widget.car.images.length; i++) {
      list.add(buildIndicator(i == _currentImage));
    }
    return list;
  }

  Widget buildIndicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[400],
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                Container(
                  height: 520,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
          
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
          
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
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
          
                            Row(
                              children: [
   
                                SizedBox(
                                  width: 16,
                                ),
          
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                  ),
                                  child: IconButton(
                                    onPressed:  () {
            
                                      Share.share(
                                          'Hola! , mira este producto: ');
                                     },
          
                                     icon: Icon(
                                        Icons.share,
                                        color: Colors.black,
                                        size: 22,
                                      ),
                                    
                                  )
                                ),
          
                              ],
                            ),
          
                          ],
                        ),
                      ),
          
                      SizedBox(
                        height: 16,
                      ),
          
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.car.model,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
          
                      SizedBox(
                        height: 8,
                      ),
          
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.car.brand,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
          
                      SizedBox(
                        height: 8,
                      ),
          
                      Container(
                        width: 800,
                        height: 150,
                        child: PageView(
                          physics: BouncingScrollPhysics(),
                          onPageChanged: (int page){
                            setState(() {
                              _currentImage = page;
                            });
                          },
                          children: widget.car.images.map((path) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 16,),
                              child: Hero(
                                tag: widget.car.model,
                                child: Image.asset(
                                  path,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
          
                      widget.car.images.length > 1
                      ? Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: buildPageIndicator(),
                        ),
                      )
                      : Container(),
          
                      _Cuotas(widget.car)
          
                      
          
                    ],
                  ),
                ),
                
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
          
                      Padding(
                        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: Text(
                          "CARACTERISTICAS",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
          
                      Container(
                        height: 90,
                        padding: EdgeInsets.only(top: 8, left: 16,),
                        margin: EdgeInsets.only(bottom: 16),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            buildSpecificationCar("Color", widget.car.color),
                            buildSpecificationCar("Cambios", widget.car.cambios),
                            buildSpecificationCar("Asientos", widget.car.asientos),
                            buildSpecificationCar("Motor", widget.car.motor),
                            buildSpecificationCar("Velocidad (0-100)", widget.car.velocidad),
                            buildSpecificationCar("Vel Maxima", widget.car.maxima),
                          ],
                        ),
                      ),
          
                    ],
                  ),
                ),
          
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [

                Text(
                  "COP: \$${widget.car.price} mill",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),

                SizedBox(
                  width: 8,
                ),


              ],
            ),
            _Comprar(widget.car),
          ],
        ),
      ),
    );
  }

  Widget buildSpecificationCar(String title, String data){
    return Container(
      width: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16,),
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),

          SizedBox(
            height: 8,
          ),

          Text(
            data,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }

}

class _Cuotas extends StatelessWidget {

  final Car car;
  _Cuotas(this.car);

  @override
  Widget build(BuildContext context) {

    final cuotaProvider = Provider.of<CuotasProvider>(context);

    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                GestureDetector(
                  onTap: () {
                        cuotaProvider.setItemSeleccionado = 0;
                    },
                  child: buildPricePerPeriod(
                    0,
                    "90",
                    "${(car.price/90).round()} Mill",
                    
                    context
                  ),
                ),
            

                GestureDetector(
                  onTap:() {
                        cuotaProvider.setItemSeleccionado = 1;
                
                    } ,

                  child: buildPricePerPeriod(
                    1,
                    "57",
                    "${(car.price / 57).round()} Mill",
                    
                    context
                  ),
                ),
        
                GestureDetector(
                  onTap:() {
                        cuotaProvider.setItemSeleccionado = 2;      
                    },
                  child: buildPricePerPeriod(
                    2,
                    "45",
                    "${(car.price / 45).round()} Mill",
                    
                    context
                  ),
                ),

              ],
            ),
          );
  }

  
  Widget buildPricePerPeriod(int index, String meses, String price, BuildContext context) {

    final cuotaProvider = Provider.of<CuotasProvider>(context);

    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 350),
        height: 110,
        width: 100,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cuotaProvider.itemSeleccionado == index ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(
            color: Colors.grey.shade300,
            width: cuotaProvider.itemSeleccionado == index ? 0 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meses + " Cutotas",
              style: TextStyle(
                color: cuotaProvider.itemSeleccionado == index ? Colors.white : Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Text(
              price,
              style: TextStyle(
                color: cuotaProvider.itemSeleccionado == index ? Colors.white : Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "COP",
              style: TextStyle(
                color: cuotaProvider.itemSeleccionado == index ? Colors.white : Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

}


class CuotasProvider extends ChangeNotifier {

  
  int _itemSeleccionado = 0;

  int get itemSeleccionado => _itemSeleccionado;
 
  set setItemSeleccionado(int item) {
    _itemSeleccionado = item;
    notifyListeners();
  }



}

class _Comprar extends StatelessWidget {

  final Car car;
  _Comprar(this.car);

  @override
  Widget build(BuildContext context) {


     void lauchWhatsapp(String numero, String mensaje) async {
      String url = "https://wa.me/$numero?text=$mensaje";
      await canLaunch(url) ? launch(url) : print('No se puedo abrir Whatsapp');
    }

    return GestureDetector(

       onTap: () {

          lauchWhatsapp('+573167812752',
              'Hola, quiero comprar este Vehiculo: \n\nMarca: ${car.brand} \nModelo: ${car.model} \nPrecio: \$${car.price}\nColor: ${car.color}');
      },

      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Comprar",
              style: TextStyle(
                color: Colors.white,
                // fontWeight: FontWeight.w100,
                fontFamily: 'Praise',
                fontSize: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}