import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  static const routeName = '/list';

  @override
  Widget build(BuildContext context) {
    final List<String> items = List<String>.generate(10000, (i) => "Item $i");
    return Scaffold(
      appBar: AppBar(title: const Text('Listas')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.list),
            title: Text(items[index]),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print('Tapped on Row $index');
            },
          );
        },
        // separatorBuilder: (context, index) {
        //   return const Divider();
        // },
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //       children: items
      //           .map((item) => ListTile(
      //                 leading: const Icon(Icons.list),
      //                 title: Text(item),
      //                 trailing: const Icon(Icons.keyboard_arrow_right),
      //                 onTap: () {
      //                   print('Tapped on Row $item');
      //                 },
      //               ))
      //           .toList()),
      // ),
    );
  }
}
