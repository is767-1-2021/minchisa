import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      'Cupcakes on the Go',
      'Pete s Pizza',
      'Bacon Buggy',
      'The Food Dude',
      'Pasta Parade',
      'Sir Burger',
      'Taste of Thai',
      'Dream Doughnuts',
      'French Toast',
      'Morning Burger',
      'Salsa Shack',
      'Grill Subs',
      'Bread',
      'Sandwich Mama'
    ];
    final List<int> colorCodes = <int>[100, 50, 200];

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(8.0),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return ProductTile(
            item: ProductItem(
              name: ' ${entries[index]}',
              price: '฿ 25',
              colorShade: colorCodes[index % 3],
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}

class ProductItem {
  final String name;
  final String price;
  final int colorShade;

  const ProductItem(
    {Key? key, required this.name, 
    required this.price, required this.colorShade});
}

class ProductTile extends StatelessWidget {
  final ProductItem item;

  const ProductTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, 
          MaterialPageRoute(
            builder: (context) => ProductDetail(item: item),
          ),
        );
      },
      child: Container(
        height: 100,
        color: Colors.pink[item.colorShade],
        child: Center(
          child: Text(' ${item.name}'),
        ),
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final ProductItem item;

  const ProductDetail({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Price'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(':  ${item.name}'),
          Text('Price: 10 ${item.price}'),
        ],
      ),
    );
  }
}