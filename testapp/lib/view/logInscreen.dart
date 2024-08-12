import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/view/otpScreen.dart';
import 'package:testapp/view/registerscreen.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Please Provide phone number ',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded edges
                        borderSide: BorderSide(
                          color: Colors.green, // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded edges
                        borderSide: BorderSide(
                          color: Colors.green, // Border color when focused
                          width: 1.0, // Border width
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded edges
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
                  padding: const EdgeInsets.all(14.0),
                  child: MaterialButton(
                    onPressed: () {
                      checkVerification(context);
                    },
                    child: Text(
                      'SEND CODE',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    color: const Color.fromARGB(255, 230, 99, 90),
                  ),
                )
              ],
            ),
          ],
        ));
  }

  void checkVerification(BuildContext context) async {
    try {
      if (_phoneController.text.isNotEmpty) {
        var object = {
          "mobileNumber": _phoneController.text.trim(),
          "deviceId": "62b341aeb0ab5ebe28a758a3"
        };
        final responce = await http.post(
            Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/otp'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(object));
        var responce2 = jsonDecode(responce.body);
        print('value is ${responce2['status']}');

        if (responce2['status'] == 1) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => OtpScreen()),
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => RigisterScreen()),
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
