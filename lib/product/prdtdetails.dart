import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:trip/Api/api.dart';
import 'package:trip/product/prdt.dart';

class PrdtDtls extends StatefulWidget {
  @override
  _PrdtDtlsState createState() => _PrdtDtlsState();
}

class _PrdtDtlsState extends State<PrdtDtls> {

  late final _filename;
  File? imageFile;
  late String storedImage;
  File? _image;
  final picker = ImagePicker();

  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>(); // GlobalKey for the form

  // Controllers for text fields
  final TextEditingController _productnameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _filenController = TextEditingController();


  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);

       // _filename = _image!.path.toString();
        _filename = basename(_image!.path).toString();


      } else {
        print('No image selected.');
      }
    });
  }
  void addproduct(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      "product_name": _productnameController.text,
      "description": _descriptionController.text,
      "category": _categoryController.text,
      "quantity": _quantityController.text,
      "price": _priceController.text,
      "product_image":_filename
    };
    var res = await Api().authData(data, '/product/product');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      print(body);
      addImage();
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(context, MaterialPageRoute(builder: (context) => Prdt()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }
  void addImage()async{

    final uri = Uri.parse(Api().url+'/product/upload');
    final request = http.MultipartRequest('POST', uri);
    final imageStream = http.ByteStream(_image!.openRead());
    final imageLength = await _image!.length();

    final multipartFile = http.MultipartFile(
      'file',
      imageStream,
      imageLength,
      filename: _filename,
    );
    request.files.add(multipartFile);

    print("multipart${multipartFile}");
    final response = await request.send();
    if(response.statusCode == 200)
    {

      Fluttertoast.showToast(
        msg:"success",
        backgroundColor: Colors.grey,
      );


    }
    else
    {
      Fluttertoast.showToast(
        msg:"Failed",
        backgroundColor: Colors.grey,
      );

    }

  }
  @override
  void dispose() {
    // Dispose the text field controllers when the widget is disposed
    _productnameController.dispose();
    _descriptionController.dispose();
    _quantityController.dispose();
    _categoryController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             /* Image.asset(
                'images/two.jpg',
                height: 200,
                fit: BoxFit.cover,
              ),*/
              SizedBox(height: 20),
              _image != null
                  ? Image.file(
                _image!,
                width: 200,
                height: 200,
              )
                  : Text('No image selected'),
              ElevatedButton(
                onPressed: getImage,
                child: Text('Pick Image'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // Add padding around the search bar
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  // Use a Material design search bar
                  child: TextField(
                    controller: _productnameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Product Name',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // Add padding around the search bar
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  // Use a Material design search bar
                  child: TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Product Description',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // Add padding around the search bar
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  // Use a Material design search bar
                  child: TextField(
                    controller: _quantityController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Quantity',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // Add padding around the search bar
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  // Use a Material design search bar
                  child: TextField(
                    controller: _categoryController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Category',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // Add padding around the search bar
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  // Use a Material design search bar
                  child: TextField(
                    controller: _priceController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Price',
                    ),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    addproduct(context); // Call registerUser method and pass the context
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}