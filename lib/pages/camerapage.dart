import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(Mycamera());
}

class Mycamera extends StatelessWidget {
  Mycamera();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Camera & Gallery",
      theme: ThemeData(primarySwatch: Colors.purple),
      home: CameraPage(),
    );
  }
}

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.getImage(source: source);
      setState(() {
        if (pickedFile != null) {
          _imageFile = File(pickedFile.path);
        } else {
          print('No image selected');
        }
      });
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Text('Look at objects as if they are realistic',
                style: TextStyle(
                  color: Colors.purple,
                  fontFamily: "myfont",
                  fontSize: 30,
                  fontWeight: FontWeight.w200,),
                  ),
      ),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            SizedBox(height: 10),
            _imageFile != null
                ? Image.file(
                    _imageFile!,
                    height: 200,
                  )
                : Container(
                    height: 300,
                    width: 350,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 135, 45, 143)
                              .withOpacity(0.6), // Shadow color
                          spreadRadius: 3, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: Offset(0, 2), // Offset in x and y axes
                        ),
                      ],
                      borderRadius: BorderRadius.circular(18), // Border radius
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          15), // Clip the child with same border radius
                      child: _imageFile != null
                          ? Image.file(
                              _imageFile!,
                              height: 300,
                              width: 350,
                              fit: BoxFit
                                  .cover, // Adjust the image content to cover the container
                            )
                          : Container(
                              color: Colors.grey[
                                  300], // Placeholder color if no image is selected
                            ),
                    ),
                  ),
            SizedBox(height: 22),
            SizedBox(
              height: 55,
              width: 250,
              child: ElevatedButton(
                onPressed: () => _getImage(ImageSource.camera),
                child: Text(
                  'Take picture',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[100],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  elevation: 3,
                  shadowColor: Color.fromARGB(255, 52, 10, 59),
                ),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 55,
              width: 250,
              child: ElevatedButton(
                onPressed: () => _getImage(ImageSource.gallery),
                child: Text('Upload from gallery',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    )),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[100],
                  elevation: 3,
                  shadowColor: Color.fromARGB(255, 52, 10, 59),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
