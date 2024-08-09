import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_solar_system_app/controller/provider.dart';

import '../../modal/home_card_modal/home_card_modal.dart';

class Detailscreen extends StatefulWidget {
  final int index;
  Detailscreen({super.key, required this.index});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 20.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    JsonDetailProvider jsonDetailProvider = Provider.of<JsonDetailProvider>(context, listen: false);


    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45,left: 5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                      child: ImageIcon(AssetImage("assets/icons/back.png"),color: Colors.yellow,size: 30,)),
                ),
                SizedBox(height: 200),
                Image.asset(
                  jsonDetailProvider.userList[widget.index].numberImage,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text(
                      jsonDetailProvider.userList[widget.index].name,
                      style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 200,),
                    IconButton(onPressed: () {
                      jsonDetailProvider.toggleBookmark(jsonDetailProvider.userList[widget.index]);
                    }, icon: Icon(Icons.book),)
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  jsonDetailProvider.userList[widget.index].description,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Velocity: ${jsonDetailProvider.userList[widget.index].velocity} km/s',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Distance from Sun: ${jsonDetailProvider.userList[widget.index].distance} million km',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Gallery',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: jsonDetailProvider.userList[widget.index].images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            jsonDetailProvider.userList[widget.index].images[index],
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,  // Positioning the image
            left: 100,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _animation.value),
                  child: child,
                );
              },
              child: Hero(
                tag:
                jsonDetailProvider.userList[widget.index].name,
                child: Image.asset(
                  jsonDetailProvider.userList[widget.index].planetImage,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
