import 'package:flutter/material.dart';

import '../../../modal/home_card_modal/home_card_modal.dart';

class PlanetCard extends StatelessWidget {
  final Planetcardmodal planetCardModal;

  PlanetCard({required this.planetCardModal});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(),
       Container(
        height: 300,
        width: 300,
        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
      ),
        Positioned(
          top: -80,
          right: 180,
          child: Container(
            child: Hero(
              tag: planetCardModal.planet,
              child: Image.asset(planetCardModal.planetImage,height: 250,),
            ),
          ),
        ),
        Column(
          children: [

            Stack(
              children: [
                Image.asset(
                  planetCardModal.numberImage,
                  width: 50,
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    children: [
                      Text(
                        'Explore',
                        style: TextStyle(
                          color: Color(int.parse("0xFF${planetCardModal.color.substring(1)}")),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        planetCardModal.planet,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(int.parse("0xFF${planetCardModal.color.substring(1)}")),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        planetCardModal.description,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 0.0),

                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color:
                            Colors.yellow,
                            borderRadius: BorderRadius.circular(30)
                        ),

                        child: Icon(Icons.arrow_forward,size: 40,color: Colors.white,),
                      ),

                    ],
                  ),
                ),
              ],
            )


          ],
        ),
      ],
    );
  }
}