/*import 'package:flutter/material.dart';


class VestimateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VestimateApp',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: EverybodyHomePage(),
    );
  }
}

class EverybodyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('VestimateApp'),
      ),
      body: Center(
        child: Image(
          image: AssetImage('assets/images/flower.jpg'),
          //image: NetworkImage(
              //'https://cdn.pixabay.com/photo/2023/08/08/23/21/forest-8178298_1280.png'),
        ),
      ),
    );
  }
}
*/



import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class VestimateApp extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Fluffy Pillow",
      description: "A soft And Comfortable Pillow For a Good Night Sleep",
      price: 19.99,
      imageUrl: "https://media.istockphoto.com/id/951466968/vector/pillows-ad-vector-realistic-design-template.jpg?s=612x612&w=0&k=20&c=RJ8ahZum0TK4gnD7bglW2ddTNn5tt3iCtcieJH8zCmk="
    ),
    Product(
      name: "Cozy Blanket",
      description: "A warm and cozy blanket to keep you snug during winter",
      price: 29.99,
      imageUrl: "https://media.istockphoto.com/id/1321286300/photo/beautiful-tree-twigs-in-vase-on-floor-near-sofa-indoorsu.webp?b=1&s=612x612&w=0&k=20&c=4LnV-7-Z-Tx8tfGI_dVwq0onQ8Akr3ErVR-HDWDxBTg=",
    ),
    Product
      (
        name: "lavender Perfume",
        description: "A scented perfume to spread a nostagalious aroma",
        price: 34.90,
        imageUrl: "https://media.istockphoto.com/id/1326570912/photo/glass-bottle-of-perfume-on-golden-silk-background.webp?b=1&s=612x612&w=0&k=20&c=YLDb5p3OtpkEV5gsnwCaHbqlnvaJm5TojbyPjWQz3H8="
    ),
    Product
      (
        name: "slingBag",
        description: "A Stylish Sling bag with long string",
        price: 78.75,
        imageUrl: "https://cdn.pixabay.com/photo/2022/09/04/08/31/fashion-7431099_1280.jpg"
    ),
    Product
      (
        name: "eyeliner",
        description: "A Stylish Eyeliner with waterproof liquid  ",
        price: 56.89,
        imageUrl: "https://media.istockphoto.com/id/468112252/photo/green-eyed-beautiful-model-applying-foundation-with-a-brush.webp?b=1&s=612x612&w=0&k=20&c=LN-Z6lNcxciS4u2rxyav43cLDepxwNtJxtB1zqVsNPg="
    ),
    Product
      (
        name: "skincare",
        description: "skincare products that make your skin glow bright like moon and prevent it from dust from 24 hours",
        price: 899.78,
        imageUrl: "https://media.istockphoto.com/id/1408439145/photo/autumn-skincare-and-autumn-makeup-concept-with-beauty-products-on-table.webp?b=1&s=612x612&w=0&k=20&c=811yULrgUkcdKQsmfworHgGR-9scZ0fziPRt3cfbRLE="
    ),
    Product
      (
        name: "BisleriBottle",
        description: "water supply everyday ,everynight ,everywhere but chandigarh water is cheepra",
        price: 677.89,
        imageUrl: "https://media.istockphoto.com/id/1405348066/photo/water-wave-water-surface-with-ripple-and-bubbles-float-up-on-white-background.webp?b=1&s=612x612&w=0&k=20&c=BFW_Z3pgOyILKPG5nMDbnKJbcm_PK6JklB1QbJVA6Hg="
    ),
    Product
      (
        name: "IceCream",
        description: "thandi meethi icecream",
        price: 56.78,
        imageUrl: "https://media.istockphoto.com/id/1161805849/photo/strawberry-vanilla-chocolate-ice-cream-with-waffle-cone-on-marble-stone-backgrounds.webp?b=1&s=612x612&w=0&k=20&c=VxpYRnxg1AhyKWeR_zYq2TpoOolNgnxBKu4i8NBaPjI="
    ),
    Product
      (
        name: "faluda",
        description: "thandi meethi icecream",
        price: 56.78,
        imageUrl: "https://media.istockphoto.com/id/1161805849/photo/strawberry-vanilla-chocolate-ice-cream-with-waffle-cone-on-marble-stone-backgrounds.webp?b=1&s=612x612&w=0&k=20&c=VxpYRnxg1AhyKWeR_zYq2TpoOolNgnxBKu4i8NBaPjI="
    )

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Product List"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Welcome to  store",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(


                      backgroundImage: NetworkImage(products[index].imageUrl),

                    ),

                    title: Text(products[index].name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(products[index].description),
                        SizedBox(height: 4),
                        Text(
                          "\$${products[index].price.toStringAsFixed(2)}",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}