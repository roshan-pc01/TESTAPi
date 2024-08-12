import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/view/HomeScreen.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
  TextEditingController _otpController = TextEditingController();
  void checkVerification(BuildContext context) async {
    try {
      if (_otpController.text.isNotEmpty) {
        var object = {
          "otp": _otpController.text,
          "deviceId": "62b43472c84bb6dac82e0504",
          "userId": "62b43547c84bb6dac82e0525"
        };
        final responce = await http.post(
            Uri.parse(
                'http://devapiv4.dealsdray.com/api/v2/user/otp/verification'),
            body: jsonEncode(object));
        var responce2 = jsonDecode(responce.body);
        print('value is ${responce2['status']}');

        if (responce2['status'] == 200) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HomeScreen()),
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
        title: Text('OTP Screen'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _otpController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'OTP',
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
        ],
      ),
    );
  }
}
