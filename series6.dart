import 'package:flutter/material.dart';

class Laundrystore1 extends StatelessWidget {
  const Laundrystore1({Key? key});

  @override
  Widget build(BuildContext context) {
    return Laundrystore2();
  }
}

class Laundrystore2 extends StatefulWidget {
  const Laundrystore2({Key? key});

  @override
  State<Laundrystore2> createState() => _Laundrystore2State();
}

class _Laundrystore2State extends State<Laundrystore2> {
  final List<String> itemList = List.generate(50, (index) => 'Number $index');
  final double itemWidth = 170.0;

  @override
  Widget build(BuildContext context) {
    List<Color> verticalBoxColors = [
      Colors.blue,
      Colors.grey,
      Colors.green,
      Colors.teal,
    ];

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
          Positioned(
            child: Opacity(
              opacity: 0.3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://easydrawings.net/wp-content/uploads/2020/05/draw-a-washing-machine.jpg',
                    ),
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: kToolbarHeight,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Welcome",
                                    style: TextStyle(fontSize: 30, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://media.istockphoto.com/id/180815119/photo/washing-machines-clothes-washers-door-in-a-public-launderette.webp?b=1&s=170667a&w=0&k=20&c=jz4bn4d7CHhpzbkdfVMReI17h5X2IN2AVS-bPVEYc5A=',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 200.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 25.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.0,
                          ),
                          child: Text(
                            "New Locations",
                            style: TextStyle(
                              color: Color.fromRGBO(19, 22, 33, 1),
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            itemCount: 6, // Display only 6 items
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              List<Color> horizontalBoxColors = [
                                Colors.blue,
                                Colors.red,
                                Colors.green,
                                Colors.yellow,
                                Colors.orange,
                                Colors.pinkAccent,
                              ];

                              List<String> titles = [
                                "Location 1",
                                "Location 2",
                                "Location 3",
                                "Location 4",
                                "Location 5",
                                "Location 6",
                              ];

                              List<String> descriptions = [
                                "Description 1",
                                "Description 2",
                                "Description 3",
                                "Description 4",
                                "Description 5",
                                "Description 6",
                              ];

                              return Container(
                                width: itemWidth,
                                margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
                                padding: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: horizontalBoxColors[index], // Set different colors for each box
                                  borderRadius: BorderRadius.all(Radius.circular(11)), // Round the corners
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          titles[index],
                                          style: TextStyle(color: Colors.white, fontSize: 12),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          descriptions[index],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Latest Order",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                "view All",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 175,
                          child: ListView.builder(

                            itemCount: 4, // Display only 6 items
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              List<String> itemtext = [
                                "item 1",
                                "item 2",
                                "item 3",
                                "item 4",
                              ];
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: verticalBoxColors[index], // Set different colors for each box
                                  borderRadius: BorderRadius.circular(10.0), // Set the border radius here
                                ), // Set different colors for each box
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          itemtext[index], // Text for vertical boxes
                                          style: TextStyle(color: Colors.white, fontSize: 12),
                                        ),
                                      ],
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
