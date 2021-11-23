import 'package:flutter/material.dart';

class NavigationItem {

  IconData iconData;

  NavigationItem(this.iconData);

}


class Car {

  String brand;
  String model;
  double price;
  String color;
  String asientos;
  String cambios;
  String motor;
  String velocidad;
  String maxima;
  String disponible;
  List<String> images;

  Car(
    this.brand, 
    this.model, 
    this.price, 
    this.color,
    this.asientos,
    this.cambios,
    this.motor,
    this.velocidad,
    this.maxima,
    this.disponible, 
    this.images);

}

List<Car> getCarListMejores(){
  return <Car>[
  
     Car(
      "Ferrari",
      "Spider 488",
      900,
      "Azul",
      "2",
      "Caja 7",
      "v10 1.5",
      "3.8 sec",
      "185 mph",
      "Disponible",
      [
        "assets/images/ferrari_spider_488_0.png",
        "assets/images/ferrari_spider_488_1.png",
        "assets/images/ferrari_spider_488_2.png",
        "assets/images/ferrari_spider_488_3.png",
        "assets/images/ferrari_spider_488_4.png",
      ],
    ),
    Car(
      "Alfa Romeo",
      "C4",
      450,
      "Plateado claro",
      "2",
      "Automatico",
      "v11 1.5",
      "2.98 sec",
      "180 mph",
      "Disponible",
      [
        "assets/images/alfa_romeo_c4_0.png",
      ],
    ),
      Car(
      "Lamborghini",
      "Aventador",
      700,
      "Naranja",
      "2",
      "Caja 7",
      "v12 3.0",
      "3.0 sec",
      "150 mph",
      "Disponible",
      [
        "assets/images/lambo.png",
      ],
    ),
        Car(
      "McLaren",
      "765LT",
      750,
      "Azul",
      "2",
      "Caja 7",
      "v8 2.0",
      "3.15 sec",
      "132 mph",
      "Disponible",
      [
        "assets/images/maclaren.png",
      ],
    ), 
        Car(
      "Bugatti",
      "Veyron",
      890,
      "Negro / Naranja",
      "2",
      "Automatico",
      "v12 3.5",
      "2.9 sec",
      "130 mph",
      "Disponible",
      [
        "assets/images/bugatti.png",
      ],
    ),
    Car(
      "Porche",
      "718 Cayman GT4",
      450,
      "Amarillo",
      "2",
      "Automatico",
      "v70 2.0",
      "3.1 sec",
      "128 mph",
      "Disponible",
      [
        "assets/images/porshe_1.png",
      ],
    ),
    
    Car(
      "Nissan",
      "GTR",
      800,
      "Blanco",
      "2",
      "Caja 6",
      "v5 3.2",
      "4.2 sec",
      "128 mph",
      "Disponible",
      [
        "assets/images/nissan_gtr_0.png",
        "assets/images/nissan_gtr_1.png",
        "assets/images/nissan_gtr_2.png",
        "assets/images/nissan_gtr_3.png",
      ],
    ),
    Car(
      "Chevrolet",
      "Camaro",
      360,
      "Amarillo",
      "2",
      "Automatico",
      "v5 5.2",
      "5.1 sec",
      "125 mph",
      "Disponible",
      [
        "assets/images/camaro_0.png",
        "assets/images/camaro_1.png",
        "assets/images/camaro_2.png",
      ],
    ),
   
    Car(
      "Land Rover",
      "Discovery 2020",
      320,
      "Plateado",
      "4",
      "Automatico",
      "v7 1.5",
      "5.8 sec",
      "120 mph",
      "Disponible",
      [
        "assets/images/ranger.png",
      ],
    ),
     Car(
      "Land Rover",
      "Discovery",
      250,
     "Plateado",
     "4",
     "Caja 5",
     "v5 1.8",
     "7.5 sec",
     "115 mph",
      "Disponible",
      [
        "assets/images/land_rover_0.png",
        "assets/images/land_rover_1.png",
        "assets/images/land_rover_2.png",
      ],
    ),
    
    Car(
      "Acura",
      "MDX 2020",
      180,
    "Azul Oscuro",
    "4",
    "Automatico",
    "v3 2.1",
    "7.2 sec",
    "110 mph",
      "Disponible",
      [
        "assets/images/acura_0.png",
        "assets/images/acura_1.png",
        "assets/images/acura_2.png",
      ],
    ),
    Car(
      "Fiat",
      "500x",
      68,
      "Blanco",
      "2",
      "Caja 5",
      "v10 1.0",
      "10.2 sec",
      "85 mph",
      "Disponible",
      [
        "assets/images/fiat_0.png",
        "assets/images/fiat_1.png",
      ],
    ),
    
    Car(
      "Ford",
      "Focus",
      60,
    "Blanco",
    "4",
    "Caja 6",
    "v7 1.5",
    "9.3 sec",
    "80 mph",
      "Disponible",
      [
        "assets/images/ford_0.png",
        "assets/images/ford_1.png",
      ],
    ),
    
    Car(
      "Honda",
      "Civic",
      80,
    "Blanco",
    "4",
    "Caja 5",
    "v7 2.5",
    "12.2 sec",
    "75 mph",
      "Disponible",
      [
        "assets/images/honda_0.png",
      ],
    ),
    Car(
      "Citroen",
      "Picasso",
      90,
    "Rojo",
    "4",
    "Caja 5",
    "v15 2.5",
    "15.2 sec",
    "75 mph",
      "Disponible",
      [
        "assets/images/citroen_0.png",
        "assets/images/citroen_1.png",
        "assets/images/citroen_2.png",
      ],
    ),
  ];
}

List<Car> getCarListCaros() {
  return <Car>[
    Car(
      "Ferrari",
      "Spider 488",
      900,
      "Azul",
      "2",
      "Caja 7",
      "v10 1.5",
      "3.8 sec",
      "185 mph",
      "Disponible",
      [
        "assets/images/ferrari_spider_488_0.png",
        "assets/images/ferrari_spider_488_1.png",
        "assets/images/ferrari_spider_488_2.png",
        "assets/images/ferrari_spider_488_3.png",
        "assets/images/ferrari_spider_488_4.png",
      ],
    ),
     Car(
      "Bugatti",
      "Veyron",
      890,
      "Negro / Naranja",
      "2",
      "Automatico",
      "v12 3.5",
      "2.9 sec",
      "130 mph",
      "Disponible",
      [
        "assets/images/bugatti.png",
      ],
    ),
    Car(
      "McLaren",
      "765LT",
      750,
      "Azul",
      "2",
      "Caja 7",
      "v8 2.0",
      "3.15 sec",
      "132 mph",
      "Disponible",
      [
        "assets/images/maclaren.png",
      ],
    ),
   
    Car(
      "Lamborghini",
      "Aventador",
      700,
      "Naranja",
      "2",
      "Caja 7",
      "v12 3.0",
      "3.0 sec",
      "150 mph",
      "Disponible",
      [
        "assets/images/lambo.png",
      ],
    ),
     Car(
      "Nissan",
      "GTR",
      680,
      "Blanco",
      "2",
      "Caja 6",
      "v5 3.2",
      "4.2 sec",
      "128 mph",
      "Disponible",
      [
        "assets/images/nissan_gtr_0.png",
        "assets/images/nissan_gtr_1.png",
        "assets/images/nissan_gtr_2.png",
        "assets/images/nissan_gtr_3.png",
      ],
    ),
    
     Car(
      "Alfa Romeo",
      "C4",
      450,
      "Plateado claro",
      "2",
      "Automatico",
      "v11 1.5",
      "2.98 sec",
      "180 mph",
      "Disponible",
      [
        "assets/images/alfa_romeo_c4_0.png",
      ],
    ),
    Car(
      "Porche",
      "718 Cayman GT4",
      450,
      "Amarillo",
      "2",
      "Automatico",
      "v70 2.0",
      "3.1 sec",
      "128 mph",
      "Disponible",
      [
        "assets/images/porshe_1.png",
      ],
    ),
   
    Car(
      "Chevrolet",
      "Camaro",
      360,
      "Amarillo",
      "2",
      "Automatico",
      "v5 5.2",
      "5.1 sec",
      "125 mph",
      "Disponible",
      [
        "assets/images/camaro_0.png",
        "assets/images/camaro_1.png",
        "assets/images/camaro_2.png",
      ],
    ),
    Car(
      "Land Rover",
      "Discovery 2020",
      320,
      "Plateado",
      "4",
      "Automatico",
      "v7 1.5",
      "5.8 sec",
      "120 mph",
      "Disponible",
      [
        "assets/images/ranger.png",
      ],
    ),
    Car(
      "Land Rover",
      "Discovery",
      250,
      "Plateado",
      "4",
      "Caja 5",
      "v5 1.8",
      "7.5 sec",
      "115 mph",
      "Disponible",
      [
        "assets/images/land_rover_0.png",
        "assets/images/land_rover_1.png",
        "assets/images/land_rover_2.png",
      ],
    ),
    Car(
      "Acura",
      "MDX 2020",
      180,
      "Azul Oscuro",
      "4",
      "Automatico",
      "v3 2.1",
      "7.2 sec",
      "110 mph",
      "Disponible",
      [
        "assets/images/acura_0.png",
        "assets/images/acura_1.png",
        "assets/images/acura_2.png",
      ],
    ),
     Car(
      "Citroen",
      "Picasso",
      90,
      "Rojo",
      "4",
      "Caja 5",
      "v15 2.5",
      "15.2 sec",
      "75 mph",
      "Disponible",
      [
        "assets/images/citroen_0.png",
        "assets/images/citroen_1.png",
        "assets/images/citroen_2.png",
      ],
    ),
    Car(
      "Honda",
      "Civic",
      80,
      "Blanco",
      "4",
      "Caja 5",
      "v7 2.5",
      "12.2 sec",
      "75 mph",
      "Disponible",
      [
        "assets/images/honda_0.png",
      ],
    ),
   
    Car(
      "Fiat",
      "500x",
      68,
      "Blanco",
      "2",
      "Caja 5",
      "v10 1.0",
      "10.2 sec",
      "85 mph",
      "Disponible",
      [
        "assets/images/fiat_0.png",
        "assets/images/fiat_1.png",
      ],
    ),
    Car(
      "Ford",
      "Focus",
      60,
      "Blanco",
      "4",
      "Caja 6",
      "v7 1.5",
      "9.3 sec",
      "80 mph",
      "Disponible",
      [
        "assets/images/ford_0.png",
        "assets/images/ford_1.png",
      ],
    ),
    
  ];
}

List<Car> getCarListBaratos() {
  return <Car>[
     Car(
      "Ford",
      "Focus",
      60,
      "Blanco",
      "4",
      "Caja 6",
      "v7 1.5",
      "9.3 sec",
      "80 mph",
      "Disponible",
      [
        "assets/images/ford_0.png",
        "assets/images/ford_1.png",
      ],
    ),
    Car(
      "Fiat",
      "500x",
      68,
      "Blanco",
      "2",
      "Caja 5",
      "v10 1.0",
      "10.2 sec",
      "85 mph",
      "Disponible",
      [
        "assets/images/fiat_0.png",
        "assets/images/fiat_1.png",
      ],
    ),
    Car(
      "Honda",
      "Civic",
      80,
      "Blanco",
      "4",
      "Caja 5",
      "v7 2.5",
      "12.2 sec",
      "75 mph",
      "Disponible",
      [
        "assets/images/honda_0.png",
      ],
    ),
    Car(
      "Citroen",
      "Picasso",
      90,
      "Rojo",
      "4",
      "Caja 5",
      "v15 2.5",
      "15.2 sec",
      "75 mph",
      "Disponible",
      [
        "assets/images/citroen_0.png",
        "assets/images/citroen_1.png",
        "assets/images/citroen_2.png",
      ],
    ),
    Car(
      "Acura",
      "MDX 2020",
      180,
      "Azul Oscuro",
      "4",
      "Automatico",
      "v3 2.1",
      "7.2 sec",
      "110 mph",
      "Disponible",
      [
        "assets/images/acura_0.png",
        "assets/images/acura_1.png",
        "assets/images/acura_2.png",
      ],
    ),
     Car(
      "Land Rover",
      "Discovery",
      250,
      "Plateado",
      "4",
      "Caja 5",
      "v5 1.8",
      "7.5 sec",
      "115 mph",
      "Disponible",
      [
        "assets/images/land_rover_0.png",
        "assets/images/land_rover_1.png",
        "assets/images/land_rover_2.png",
      ],
    ),
    Car(
      "Land Rover",
      "Discovery 2020",
      320,
      "Plateado",
      "4",
      "Automatico",
      "v7 1.5",
      "5.8 sec",
      "120 mph",
      "Disponible",
      [
        "assets/images/ranger.png",
      ],
    ),
     Car(
      "Chevrolet",
      "Camaro",
      360,
      "Amarillo",
      "2",
      "Automatico",
      "v5 5.2",
      "5.1 sec",
      "125 mph",
      "Disponible",
      [
        "assets/images/camaro_0.png",
        "assets/images/camaro_1.png",
        "assets/images/camaro_2.png",
      ],
    ),
    Car(
      "Porche",
      "718 Cayman GT4",
      450,
      "Amarillo",
      "2",
      "Automatico",
      "v70 2.0",
      "3.1 sec",
      "128 mph",
      "Disponible",
      [
        "assets/images/porshe_1.png",
      ],
    ),
    Car(
      "Alfa Romeo",
      "C4",
      450,
      "Plateado claro",
      "2",
      "Automatico",
      "v11 1.5",
      "2.98 sec",
      "180 mph",
      "Disponible",
      [
        "assets/images/alfa_romeo_c4_0.png",
      ],
    ),
    Car(
      "Nissan",
      "GTR",
      680,
      "Blanco",
      "2",
      "Caja 6",
      "v5 3.2",
      "4.2 sec",
      "128 mph",
      "Disponible",
      [
        "assets/images/nissan_gtr_0.png",
        "assets/images/nissan_gtr_1.png",
        "assets/images/nissan_gtr_2.png",
        "assets/images/nissan_gtr_3.png",
      ],
    ),
    Car(
      "Lamborghini",
      "Aventador",
      700,
      "Naranja",
      "2",
      "Caja 7",
      "v12 3.0",
      "3.0 sec",
      "150 mph",
      "Disponible",
      [
        "assets/images/lambo.png",
      ],
    ),
     Car(
      "McLaren",
      "765LT",
      750,
      "Azul",
      "2",
      "Caja 7",
      "v8 2.0",
      "3.15 sec",
      "132 mph",
      "Disponible",
      [
        "assets/images/maclaren.png",
      ],
    ),
     Car(
      "Bugatti",
      "Veyron",
      890,
      "Negro / Naranja",
      "2",
      "Automatico",
      "v12 3.5",
      "2.9 sec",
      "130 mph",
      "Disponible",
      [
        "assets/images/bugatti.png",
      ],
    ),
    Car(
      "Ferrari",
      "Spider 488",
      900,
      "Azul",
      "2",
      "Caja 7",
      "v10 1.5",
      "3.8 sec",
      "185 mph",
      "Disponible",
      [
        "assets/images/ferrari_spider_488_0.png",
        "assets/images/ferrari_spider_488_1.png",
        "assets/images/ferrari_spider_488_2.png",
        "assets/images/ferrari_spider_488_3.png",
        "assets/images/ferrari_spider_488_4.png",
      ],
    ),  
   
  ];
}

class Dealer {

  String name;
  String image;

  Dealer(this.name, this.image);

}

List<Dealer> getDealerList(){
  return <Dealer>[
    Dealer(
      "Acura",
      "assets/images/marcas/acura.png",
    ),
    Dealer(
      "BMW",
       "assets/images/marcas/bmw.png",
    ),
    Dealer(
      "Bugatti",
       "assets/images/marcas/buggati.png",
    ),
     Dealer(
      "Chevrolet",
       "assets/images/marcas/che.png",
    ),
     Dealer(
      "Citroen",
       "assets/images/marcas/citroen.png",
    ),
    Dealer(
      "Ferrari",
      "assets/images/marcas/ferrari.png",
    ),
    Dealer(
      "Fiat",
      "assets/images/marcas/fiat.png",
    ),
    Dealer(
      "Ford",
      "assets/images/marcas/ford.png",
    ),
    Dealer(
      "Lamborghini",
      "assets/images/marcas/lambor.png",
    ),
    Dealer(
      "MacLaren",
      "assets/images/marcas/macla.png",
    ),
    Dealer(
      "Mercedes",
      "assets/images/marcas/mercedes.png",
    ),
    Dealer(
      "Nissan",
      "assets/images/marcas/nissan.png",
    ),
    Dealer(
      "Porsche",
      "assets/images/marcas/porsche.png",
    ),
    Dealer(
      "Alfa Romeo",
      "assets/images/marcas/romeo.png",
    ),
    Dealer(
      "Land Rover",
      "assets/images/marcas/rover.png",
    ),
    Dealer(
      "Tesla",
      "assets/images/marcas/tesla.jpg",
    ),
    Dealer(
      "Volkswagen ",
      "assets/images/marcas/vw.png",
    ),
  ];
}

class Filter {

  String name;

  Filter(this.name);

}

List<Filter> getFilterList(){
  return <Filter>[
    Filter("Mejores"),
    Filter("Mas caro"),
    Filter("Mas barato"),
  ];
}