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
    JsoncardProvider provideri = Provider.of<JsoncardProvider>(context, listen: true);

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
          final planeti = provideri.userList[int.parse(planet.position)-1];
          return  Card(
              color: Colors.white,
              child: InkWell(
                onTap: () {

              Navigator.of(context).push(createRoute(Detailscreen(index: int.parse(planet.position)-1)));
             // MaterialPageRoute(builder: (context)=>
                 // Detailscreen(index: int.parse(planet.position)-1));
                },
                child: ListTile(
                  leading: Image.asset(planeti.planetImage),
                  title: Text(
                    planet.name,
                    style: TextStyle(color: Color(int.parse("0xFF${planeti.color.substring(1)}")),),
                  ),
                  subtitle: Text(
                    planeti.description,
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Color(int.parse("0xFF${planeti.color.substring(1)}")),),
                    onPressed: () {
                      provider.toggleBookmark(planet);
                    },
                  ),
                  onTap: () {

                  },
                ),
              ),
          );
        },
      ),
      backgroundColor: Colors.deepPurple.shade200,
    );
  }
}