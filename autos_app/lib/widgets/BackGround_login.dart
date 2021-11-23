import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Back_loginPage extends StatelessWidget {

  final Widget child;

  const Back_loginPage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
                TopBackground(),
                IconLogin(),

                this.child,
            ],
          ),
          
          ),
      ],
    );
  }
}

class TopBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          Image.asset('assets/fondo_2.jpg', width: double.infinity, fit: BoxFit.cover,),
          Positioned(child: FiguraBackTop(80) , top: 50, left: 15),
          Positioned(child: FiguraBackTop(100) , top: 100, right: 25),
          Positioned(child: FiguraBackTop(90), bottom: -25, left: 35),
          Positioned(child: FiguraBackTop(80), top: 150, left: 90),
          Positioned(child: FiguraBackTop(100), top: -50, right: 80),
          Positioned(child: FiguraBackTop(70), bottom: 2, left: 250),
        ],
      ),
    );
  }

}

class FiguraBackTop extends StatelessWidget {

  final double _size;


  const FiguraBackTop(this._size) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
      color: Colors.white12,
      borderRadius: BorderRadius.circular(30)

      ),
    );
  }
}

class IconLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.only(top: 30),
        child: Container(
            width: double.infinity,
            child: Text('SportCars', style: TextStyle(fontSize: 100, fontFamily: 'Praise', color: Colors.black54), textAlign: TextAlign.center),),
      ),
    );
  }
}
