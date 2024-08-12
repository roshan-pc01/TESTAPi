import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/view/HomeScreen.dart';
import 'package:testapp/view/logInscreen.dart';

class RigisterScreen extends StatelessWidget {
  RigisterScreen({super.key});
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _referal = TextEditingController();
  void checkVerification(BuildContext context) async {
    try {
      if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
        var object = {
          "email": _email.text,
          "password": _password.text,
          "referralCode": 12345678,
          "userId": "62a833766ec5dafd6780fc85"
        };
        final responce = await http.post(
            Uri.parse(
                'http://devapiv4.dealsdray.com/api/v2/user/email/referral'),
            body: jsonEncode(object));
        var responce2 = jsonDecode(responce.body);
        print('value is ${responce2['status']}');

        if (responce2['status'] == 200) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Loginscreen()),
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _email,
              decoration: InputDecoration(
                hintText: 'email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded edges
                  borderSide: BorderSide(
                    color: Colors.green, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded edges
                  borderSide: BorderSide(
                    color: Colors.green, // Border color when focused
                    width: 1.0, // Border width
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded edges
                  borderSide: BorderSide(
                    color: const Color.fromARGB(
                        255, 86, 165, 89), // Border color when enabled
                    width: 1.0, // Border width
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _password,
              decoration: InputDecoration(
                hintText: 'password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded edges
                  borderSide: BorderSide(
                    color: Colors.green, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded edges
                  borderSide: BorderSide(
                    color: Colors.green, // Border color when focused
                    width: 1.0, // Border width
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded edges
                  borderSide: BorderSide(
                    color: const Color.fromARGB(
                        255, 86, 165, 89), // Border color when enabled
                    width: 1.0, // Border width
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => Loginscreen()),
                        ),
                    child: Text('Already have account?')),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: MaterialButton(
                  onPressed: () {
                    checkVerification(context);
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  color: const Color.fromARGB(255, 230, 99, 90),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
