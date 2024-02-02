import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart'; // Import the image_picker package

class MyLandPage extends StatelessWidget {
  const MyLandPage({super.key});

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // Handle the picked image here
      print('Image picked: ${pickedImage.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed:
                    _pickImage, // Call _pickImage function when button is pressed
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  minimumSize: Size(100, 0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Upload img",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Text field with rounder edges, smaller horizontal border, and name icon for "Add name"
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "Add name",
                    prefixIcon: Icon(Icons.person), // Name icon
                  ),
                ),
              ),
              // Text field with rounder edges, smaller horizontal border, and location icon for "Add location"
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "Add location",
                    prefixIcon: Icon(Icons.location_on), // Location icon
                  ),
                ),
              ),
              // Text field for "Add amount" with left alignment, rounder edges, and smaller horizontal border
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Text(
                      "₱",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                        decoration: InputDecoration(
                          hintText: "Enter amount (monthly)",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Container(
          height: 40.0,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  // Handle post logic here
                  print("Post tapped");
                },
                child: Text(
                  "POST",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
