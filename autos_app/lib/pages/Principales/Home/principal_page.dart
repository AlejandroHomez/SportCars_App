
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:productos_app/pages/pages.dart';
import 'package:productos_app/widgets/available_cars.dart';
import 'package:productos_app/widgets/book_car.dart';
import 'package:productos_app/widgets/buscar.dart';
import 'package:productos_app/widgets/car_widget.dart';
import 'package:productos_app/widgets/constants.dart';
import 'package:productos_app/widgets/data.dart';
import 'package:productos_app/widgets/dealer_widget.dart';
import 'package:productos_app/widgets/menu_principal.dart';
import 'package:provider/provider.dart';

class PrincipalPage extends StatefulWidget {
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MostrarMenuProvider(),
      child: Scaffold(
      backgroundColor: Colors.white,
      appBar: _AppbarPrincipal(context),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: _Body()),
        ),
      );
    
  }

 
}

class _Body extends StatefulWidget {

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {

  ScrollController controller = ScrollController();
  double scrollAnterior = 0.0;

  List<Car> cars = getCarListMejores();
  List<Car> carsEconomicos = getCarListBaratos();
  List<Dealer> dealers = getDealerList();

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterior ) {
        print(controller.offset);

        Provider.of<MostrarMenuProvider>(context, listen: false).setMostrar =
            false;
      } else {
        Provider.of<MostrarMenuProvider>(context, listen: false).setMostrar =
            true;
      }
      scrollAnterior = controller.offset;
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

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      controller: controller,
      child:  FadeInUp(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          
          child: Column(
            children: [
          
              _Titulos('PRINCIPALES'),
          
              Container(
                height: 250,
                child: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: buildDeals(),
                ),
              ),
              SizedBox(height: 20),
          
              _Disponible(),

               _Titulos('ECONOMICOS'),

              Container(
                height: 250,
                child: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: buildEconomicos(),
                ),
              ),
              SizedBox(height: 20),
          
              _Titulos('MARCAS'),
          
              Container(
                height: 150,
                margin: EdgeInsets.only(bottom: 16),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: buildDealers(),
                ),
              ),

              SizedBox(height: 50)
                      
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildDeals(){
    List<Widget> list = [];

    for (var i = 0; i < cars.length -10; i++) {
      list.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookCar(car: cars[i])),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: buildCar(cars[i], i),
          )
        )
      );
    }
    return list;
  }

  List<Widget> buildDealers() {
    List<Widget> list = [];
    for (var i = 0; i < dealers.length; i++) {
      list.add(buildDealer(dealers[i], i));
    }
    return list;
  }

  List<Widget> buildEconomicos(){
    List<Widget> list = [];

    for (var i = 0; i < carsEconomicos.length -10; i++) {
      list.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookCar(car: carsEconomicos[i])),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: buildCar(carsEconomicos[i], i),
          )
        )
      );
    }
    return list;
  }

  
}

class _Titulos extends StatelessWidget {

    final String texto;
    _Titulos(this.texto) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      alignment: Alignment.centerLeft,
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w100,
          color: Colors.grey.shade400,
        ),
      ),
    );
  }
}

class _MostrarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mostrar = Provider.of<MostrarMenuProvider>(context).mostrar;
    return Positioned(bottom: 35, child: Menu_Principal(mostrar));
  }
}


class _Disponible extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AvailableCars()),
        );
      },
      child: Container(
        height: 120,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
        gradient:  LinearGradient(
                // stops: ,
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.red,
                  Colors.redAccent,
                ]),
        borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Stack(
          children: [

            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: ShaderMask(
                blendMode: BlendMode.screen,
                shaderCallback: (rect) {
                return LinearGradient(
                  // stops: ,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.red, 
                    Colors.redAccent,
                    
                    ]).createShader(rect);
              },
              child:  SlideInLeft(child: Image.asset('assets/banner.jpg',height: 200, width: double.infinity, fit: BoxFit.cover,)),
              
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Disponibles",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(width: 20),

                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

AppBar _AppbarPrincipal (context) {

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(onPressed: () => Navigator.pushReplacement(context , 
      MaterialPageRoute(builder: (_) => HomePage())), icon: Icon(FontAwesomeIcons.arrowAltCircleLeft, color: Colors.black)),
      title: Text(
        "SportCars",
        style:TextStyle(fontSize: 50, color: Colors.black, fontFamily: 'Praise'),
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
      
    );
  
}


class MostrarMenuProvider extends ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;

  set setMostrar(bool value) {
    _mostrar = value;
    notifyListeners();
  }
}
