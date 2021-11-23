import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:productos_app/models/pinterest_menu_model.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final VoidCallback onPressed;
  final IconData icon;

  PinterestButton(
     this.onPressed, 
     this.icon
    );
}

class Menu_Principal extends StatefulWidget {
  
  final bool mostrar;
  Menu_Principal( this.mostrar);

  @override
  State<Menu_Principal> createState() => _Menu_PrincipalState();
}

class _Menu_PrincipalState extends State<Menu_Principal> with SingleTickerProviderStateMixin {


   late AnimationController controller;
   late Animation<double> rotar;
   late Animation<double> mover;
   late Animation<double> escalar;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    super.initState();

    rotar = Tween(begin: 0.0, end: 4 * pi).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutBack));
    mover = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOutBack)));
    escalar = Tween(begin: 1.0, end: 0.6).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutBack));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

  final List<PinterestButton> items = [
    PinterestButton(
       () {
         
        },
          FontAwesomeIcons.signOutAlt
        ),
    PinterestButton(
         () {
          print('security_sharp');
        },
      Icons.security_sharp),
    PinterestButton(
        () {
          print('notification_important_rounded');
        },
        Icons.notification_important_rounded),
    PinterestButton(
       () {
          print('person');
        },
        Icons.person),
  ];





    
    if (widget.mostrar == false) {
      controller.forward();
    } else {
      controller.reverse();
    }

    return AnimatedBuilder(
      animation: controller,
      builder: (context, Widget? child) {
        return Transform.translate(
          offset: Offset(0.0, mover.value),
          child: Transform.scale(
            alignment: Alignment.center,
            scale: escalar.value,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateX(rotar.value),
              child: ChangeNotifierProvider(
                  create: (_) => MenuModelProvider(),
                  child: _PinterestBackgroundMenu(_MenuItems(items))),
            ),
          ),
        );
      },
    );
  }
}

class _PinterestBackgroundMenu extends StatelessWidget {

  final Widget child;
  const _PinterestBackgroundMenu( this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      padding: const EdgeInsets.all(10),
      height: 50,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: [
            BoxShadow(color: Colors.black54, blurRadius: 12, spreadRadius: -5)
          ]),
      // child: List.,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> items;
  const _MenuItems(this.items);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          List.generate(items.length, (i) => _PinterestMenuButton(i, items[i])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuModelProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
          onTap: () {
            menuProvider.setItemSeleccionado = index;
            item.onPressed;
          },
          child: Icon(
            item.icon,
            size: menuProvider.itemSeleccionado == index ? 28 : 23,
            color: menuProvider.itemSeleccionado == index
                ? Colors.redAccent
                : Colors.black,
          )),
    );
  }
}

