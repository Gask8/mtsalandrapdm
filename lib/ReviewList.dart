import 'package:flutter/material.dart';

class ReviewList extends StatelessWidget {
  final List<ListItem> items;
  const ReviewList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Reseñas de clientes'),
          backgroundColor: Colors.green,
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: item.buildTitle(context),
              subtitle: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      item.buildSubtitle(context),
                      item.buildStars(context),
                      const SizedBox(height: 10)
                    ],
                  ),
              )
            );
          },
        ),
      ),
    );
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);
  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
  Widget buildStars(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
  @override
  Widget buildStars(BuildContext context) => const SizedBox.shrink();
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;
  final int stars;
  int i = 0;

  MessageItem(this.sender, this.body, this.stars);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);
  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
  @override
  Widget buildStars(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for( i = 0 ; i < stars ; i++)
             Icon(Icons.star),
          for( int j = i ; j < 5 ; j++)
            Icon(Icons.star_border),
        ],
  );
}