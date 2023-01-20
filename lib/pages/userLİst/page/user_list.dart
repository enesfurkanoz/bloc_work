import 'package:flutter/material.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text('User List'),),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(index),
                onDismissed: (direction) {
                },
                child: const ListTile(
                  title: Text('Username'),
                   subtitle: Text('Username'),
                  leading: AspectRatio(aspectRatio: 1/1,child: Image(image: NetworkImage('https://picsum.photos/200/300'),)),
                ),
              );
            },),
          )
        ],
      ), 
    );
  }
}
