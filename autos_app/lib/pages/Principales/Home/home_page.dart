// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:productos_app/pages/Principales/Home/pages.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _Fondo_Principal(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 SizedBox(height: 80),
                 _Titulo(), 
                 SizedBox(height: 180),
                 _Boton(), 
                 SizedBox(height: 50),
                 _CerrarSesion()
                ],
              ),
            ),
          ),


        ],
      )
    );
  }
}

class _CerrarSesion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ZoomIn(

      child: GestureDetector(
        onTap: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false),
        child: Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white30,
            border: Border.all(width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          margin: EdgeInsets.only(top: 180),
          child: Center(child: Text('Cerrar Sesion', style: TextStyle(color: Colors.black, fontSize: 40, fontFamily: 'Praise'),))),
      ),
    );
  }
}

class _Boton extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

    return ElasticIn(
      delay: Duration(seconds: 1),
      child: GestureDetector(
        onTap: () =>  Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (_) => PrincipalPage()))
        ,
        child: Stack(
          alignment: Alignment.center,
          children: [
        
            SpinPerfect(
              duration: Duration(milliseconds: 700),
              infinite: true,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: const [
                    Colors.red,
                    Colors.black,
                    Colors.red,
                    Colors.black,
                  ])
                ),
              ),
            ),
        
             Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
              ),
              child: Center(child: Text('¡Go!', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 35, fontFamily: 'Praise'))),
            ),
        
          ],
        ),
      ),
    );
  }
}

class _Titulo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInUpBig(
        from: 300,
        child: Text('SportCars', style: TextStyle(fontSize: 80, fontFamily: 'Praise', color: Colors.white),)),
    );
  }
}

class _Fondo_Principal extends StatelessWidget {

  final Widget child;
  _Fondo_Principal({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('assets/fondo_2.jpg', fit: BoxFit.cover,)),
          child
        ],
      ),
    );
  }
}