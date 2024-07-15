import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/provider.dart';
import 'componets/card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

     JsoncardProvider jsonCardProvider = Provider.of<JsoncardProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.circular(30)
          ),
          height: 100,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {

                  },
                    child: ImageIcon(AssetImage("assets/icons/home.png"), color: Colors.yellow,size: 40,)),
                GestureDetector(
                  onTap: () {

                  },
                    child: ImageIcon(AssetImage("assets/icons/discovery.png"), color: Colors.yellow,size: 40,)),
                ImageIcon(AssetImage("assets/icons/like.png"), color: Colors.yellow,size: 40,),
                ImageIcon(AssetImage("assets/icons/acount.png"), color: Colors.yellow,size: 40,),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Column(
                  children: [
                    Text("Explore",style: TextStyle(fontSize: 40, color: Colors.white),),
                    Text("Solar System,",style: TextStyle(fontSize: 22,color: Colors.white),)
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
              itemCount: 8,
                itemBuilder: (context, index) {
                  return PlanetCard(planetCardModal: jsonCardProvider.userList[index]);
                },
              ),
            )
              ],

            ),
          )
        ],
      ),

    );
  }
}
