import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/provider.dart';
import '../../modal/home_card_modal/page_ transitions.dart';
import '../../view/detail_screen/detail_screen.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    JsonDetailProvider provider = Provider.of<JsonDetailProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding:  EdgeInsets.all(15.0),
              child: ImageIcon(AssetImage("assets/icons/back.png"),color: Colors.yellow,),
            )),
        title: Text('Liked Planets', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple.shade200,
      ),
      body: ListView.builder(
        itemCount: provider.bookmarkedList.length,
        itemBuilder: (context, index) {
          final planet = provider.bookmarkedList[index];
          return  Card(
              color: Colors.white,
              child: ListTile(
                leading: Image.asset(planet.planetImage),
                title: Text(
                  planet.name,
                  style: TextStyle(color: Color(int.parse("0xFF${planet.color.substring(1)}")),),
                ),
                subtitle: Text(
                  planet.description,
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Color(int.parse("0xFF${planet.color.substring(1)}")),),
                  onPressed: () {
                    provider.toggleBookmark(planet);
                  },
                ),
                onTap: () {

                },
              ),
          );
        },
      ),
      backgroundColor: Colors.deepPurple.shade200,
    );
  }
}