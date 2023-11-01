// ignore_for_file: prefer_const_constructors

import 'package:coffee_shop/util/coffee_tile.dart';
import 'package:coffee_shop/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class HomePage extends StatefulWidget
{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage>
{
  //list of coffee types
  final List coffeeType =
  [
    //[ coffee type, isSelected]
    ['Cappucino', true,],
    ['Latte', false,],
    ['black', false,],
    ['tea', false,],
  ];

  //user tapper on coffee types
  void coffeeTypeSelected(int index)
  {
    setState(()
    {
      //this for loop makes every selection false
      for(int i = 0; i < coffeeType.length; i++)
      {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      backgroundColor: Colors.grey[900],
      appBar: AppBar
      (
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions:
        const [
          Padding
          (
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar
      (
        items:
        const [
          BottomNavigationBarItem
          (
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem
          (
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem
          (
            icon: Icon(Icons.notifications),
            label: '',
          )
        ],
      ),
      body: Column
      (
        children:
        [
          //Find the best coffee for you
          Padding
          (
            padding: const EdgeInsets.symmetric(horizontal:25.0),
            child: Text
            (
              "Find the best coffee for you",
              style: GoogleFonts.bebasNeue
              (
                fontSize: 60,
              ),
            ),
          ),

          SizedBox(height: 25),

          //Search bar
          Padding
          (
            padding: const EdgeInsets.symmetric(horizontal:25.0),
            child: TextField
            (
              decoration: InputDecoration
              (
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee..',
                focusedBorder: OutlineInputBorder
                (
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder
                (
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),

          SizedBox(height: 5),

          //Horizontal listview of coffee types
          SizedBox
          (
            height:50,
            child: ListView.builder
            (
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context,index)
              {
                return CoffeeType
                (
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: ()
                  {
                    coffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),

          //Horizontal listview of coffee tiles
          Expanded
          (
            child:ListView
            (
              scrollDirection: Axis.horizontal,
              children:
              [
                CoffeeTile
                (
                  coffeeImagePath: 'lib/images/americano.jpg',
                  coffeeName: 'Americano',
                  coffeePrice: '3.00',
                ),
                CoffeeTile
                (
                  coffeeImagePath: 'lib/images/cappuccino.jpg',
                  coffeeName: 'Cappuccino',
                  coffeePrice: '4.20',
                ),
                CoffeeTile
                (
                  coffeeImagePath: 'lib/images/cortado.jpg',
                  coffeeName: 'Cortado',
                  coffeePrice: '4.20',
                ),
                CoffeeTile
                (
                  coffeeImagePath: 'lib/images/frappe.jpg',
                  coffeeName: 'Frappe',
                  coffeePrice: '5.20',
                ),
                CoffeeTile
                (
                  coffeeImagePath: 'lib/images/irish.jpg',
                  coffeeName: 'Irish',
                  coffeePrice: '5.20',
                ),
                CoffeeTile
                (
                  coffeeImagePath: 'lib/images/latte.png',
                  coffeeName: 'Latte',
                  coffeePrice: '4.20',
                ),
                CoffeeTile
                (
                  coffeeImagePath: 'lib/images/marocchino.jpg',
                  coffeeName: 'Marocchino',
                  coffeePrice: '5.20',
                ),
                CoffeeTile
                (
                  coffeeImagePath: 'lib/images/mocha.jpg',
                  coffeeName: 'Mocha',
                  coffeePrice: '4.20',
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}
