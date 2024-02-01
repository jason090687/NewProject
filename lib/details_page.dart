import 'package:flutter/material.dart';

class BoardDetailsScreen extends StatelessWidget {
  const BoardDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text(
          'Boarding House Details',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Image slider section
              SizedBox(
                height: 200, // Adjust the height as needed
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: PageView(
                    children: [
                      Image.asset(
                        'assets/images/Rectangle 77.png',
                        fit: BoxFit.cover,
                      ),
                      // Add more images for the slider
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Aling Pauline B.H.',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/navigation.png',
                      width: 30,
                      height: 30,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              // 8% Off and star ratings
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('8% Off', style: TextStyle(color: Colors.blue)),
                        SizedBox(width: 20),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            Text('4.5 (120 Reviews)'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Location
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.location_on, size: 10),
                    SizedBox(width: 8),
                    Text(
                      'Zone 5 Bulua, Cagayan de Oro, Misamis Oriental ',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              // Description
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 8),
                    Text(
                      'Welcome to our charming boarding house nestled in the heart of Zone 5, Bulua, Cagayan de Oro, Misamis Oriental. Experience comfort and convenience in our thoughtfully designed accommodations, providing a warm and inviting haven in this vibrant locale...Read more',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              // Contact Info
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    Text('Contact Info',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Pauline Salada',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(Icons.call_sharp),
                    SizedBox(width: 5),
                    Icon(Icons.mail),
                  ],
                ),
              ),

              // Gallery and price
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Gallery',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '3.500/ Months',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'BOOK NOW',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              // Book Now button
            ],
          ),
        ),
      ),
    );
  }
}
