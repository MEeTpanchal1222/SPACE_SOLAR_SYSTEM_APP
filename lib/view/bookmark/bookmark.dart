import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/provider.dart';
import '../../view/detail_screen/detail_screen.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    JsonDetailProvider provider = Provider.of<JsonDetailProvider>(context, listen: true);
    JsoncardProvider provideri = Provider.of<JsoncardProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Planets'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: provider.bookmarkedList.length,
        itemBuilder: (context, index) {
          final planet = provider.bookmarkedList[index];
          final planeti = provideri.userList[int.parse(planet.position)];
          return ListTile(
            leading: Image.network(planeti.planetImage),
            title: Text(
              planet.name,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              planeti.description,
              style: TextStyle(color: Colors.grey),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.white),
              onPressed: () {
                provider.toggleBookmark(planet);
              },
            ),
            onTap: () {

            },
          );
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}