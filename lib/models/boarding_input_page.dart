import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BoardingInputPage extends StatefulWidget {
  const BoardingInputPage({super.key});

  @override
  _BoardingInputPageState createState() => _BoardingInputPageState();
}

class _BoardingInputPageState extends State<BoardingInputPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Boarding'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _image == null ? Text('No image selected.') : Image.file(_image!),
            TextButton(
              onPressed: () {
                // Call a function to pick an image
                pickImage();
              },
              child: Text('Select Image'),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call a function to upload data to Firestore
                uploadData();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future<void> submitDataToFirestore(
      String name, String location, String price, String imageUrl) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference boardings = firestore.collection('boardings');

      // Add a new document with user input including the image URL
      await boardings.add({
        'name': name,
        'location': location,
        'price': price,
        'imageUrl': imageUrl,
      });

      print('Data submitted to Firestore successfully!');
    } catch (e) {
      print('Error submitting data to Firestore: $e');
    }
  }

  void uploadData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseStorage storage = FirebaseStorage.instance;

    // Upload the image to Firebase Storage
    String imageName = DateTime.now().toString();
    Reference storageReference =
        storage.ref().child('boarding_images/$imageName');
    await storageReference.putFile(_image!);

    // Get the download URL of the uploaded image
    String imageUrl = await storageReference.getDownloadURL();

    // Submit data to Firestore
    await submitDataToFirestore(nameController.text, locationController.text,
        priceController.text, imageUrl);

    // Show a confirmation message to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Boarding added to Firestore!'),
      ),
    );

    // Clear the text controllers and reset the image after submission
    nameController.clear();
    locationController.clear();
    priceController.clear();
    setState(() {
      _image = null;
    });
  }
}
