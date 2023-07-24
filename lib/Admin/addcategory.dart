import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:trip/Admin/maagecategory.dart';
import 'package:trip/Api/api.dart';
import 'package:trip/Api/api_sevices.dart';
import 'package:http/http.dart' as http;
class addcategory extends StatefulWidget {

  List _loadprooducts = [];
  ApiService client = ApiService();
  @override
  _addcategoryState createState() => _addcategoryState();
}

class _addcategoryState extends State<addcategory> {

  late final _filename;
  File? imageFile;
  late String storedImage;
  File? _image;
  final picker = ImagePicker();
  TextEditingController _textEditingController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);

        _filename = _image!.path.toString();



      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, submit your data
      // Add your code to handle form submission here
    }
  }
  void addCateg()async {

    var data = {
      "category_name": _textEditingController.text,
      "category_image":_filename,
    };
    print(data);
    var res = await Api().authData(data, '/category/category');
    var body = json.decode(res.body);
    print("image ${body}");

    if(body['success']==true)
    {
      print(body);
      addComplaintImage();
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
      Navigator.push(
        this.context, //add this so it uses the context of the class
        MaterialPageRoute(
          builder: (context) => category1(),
        ), //MaterialpageRoute
      );

    }
    else
    {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

    }
  }
  void addComplaintImage()async{

    final uri = Uri.parse(Api().url+'/category/upload');
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('categories'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // Add padding around the search bar
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  // Use a Material design search bar
                  child: TextFormField(
                    controller: _textEditingController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a product name';
                      }
                      return null; // Return null if the input is valid
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'category Name',
                    ),
                  ),
                ),
              ),
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
              Center(
                child: ElevatedButton(
                  onPressed: addCateg,
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
