import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String apiKey = 'Token f006dd127a5d69c6714cf6068899ee7af328c82b';
  String baseUrl = 'https://epic1729.pythonanywhere.com/';
  String endPoint = 'api/nurse/';
  var image;
  @override
  Widget build(BuildContext context) {
////////////////////// put request/////////////////////////
    void netUpdate(int id) async {
      var url = Uri.parse(
        baseUrl + endPoint + id.toString() + '/',
      );
      try {
        http.Response response = await http.put(
          url,
          headers: <String, String>{
            'Authorization': apiKey,
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            "owner": "root",
            // "model_pic": "https://epic1729.pythonanywhere.com/media/postImage/blockchain.jpg",
            "firstName": "neda",
            "lastName": "khani",
            "gender": "F",
            "age": 22,
            "phone_number": "11111111111",
            "state": "15",
            "city": "tehran",
            "workCondition": "tehransar",
            "rate": 2,
            "created": "2022-02-09T11:14:01.863888Z"
          }),
        );
        if (response.statusCode == 200) {
          print('is changed');
        } else {
          print('is not changed');
        }
      } catch (exception) {
        print(exception);
      }
    }

////////////////////// get request//////////////////////////
    void netGet() async {
      var url = Uri.parse(
        baseUrl + endPoint,
      );
      try {
        http.Response response = await http.get(
          url,
          headers: <String, String>{
            'Authorization': apiKey,
          },
        );
        if (response.statusCode == 200) {
          print('is correct');
          var x = json.decode(response.body);
          image = x[1]['model_pic'];
          var firstName = x[1]['firstName'];
          var lastName = x[1]['lastName'];
          var gender = x[1]['gender'];
          var age = x[1]['age'];
          var phone_number = x[1]['phone_number'];
          print('firstName : $firstName');
          print('lastName : $lastName');
          print('age : $age');
          print('gender : $gender');
          print('phone_number : $phone_number');
          setState(() {});
        } else {
          print('is not correct');
        }
      } catch (exception) {
        print(exception);
      }
    }

    //////////////// delete request/////////////////////////

    void netDelete(int id) async {
      var url = Uri.parse(
        baseUrl + endPoint + id.toString() + '/',
      );
      try {
        http.Response response = await http.delete(
          url,
          headers: <String, String>{
            'Authorization': apiKey,
          },
        );
        if (response.statusCode == 200) {
          print('is deleted');
        } else {
          print('is not delete');
        }
      } catch (exception) {
        print(exception);
      }
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (image != null) Image(image: NetworkImage('$image')),
                const SizedBox(
                  height: 155.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      netGet();
                    },
                    child: const Text('press'))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
