import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Home.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/User.dart';
import '../utils/HttpService.dart';
import '../utils/Uty.dart';
import '../utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  static const Color primaryColor = Color(0xFF13B5A2);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Create storage
  final _storage = const FlutterSecureStorage();

  final TextEditingController _usernameController =
  TextEditingController(text: "");
  final TextEditingController _passwordController =
  TextEditingController(text: "");

  bool passwordHidden = true;
  bool _savePassword = true;

  _onForgotPassword() {}

  _onSignUp() {}

  @override
  void initState() {
    super.initState();
    _readFromStorage();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          padding: EdgeInsets.all(size.width - size.width * .85),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .10,
              ),
              const Text(
                "Welcome back.",
                style: TextStyle(
                    color: Color(0xFF161925),
                    fontWeight: FontWeight.w600,
                    fontSize: 32),
              ),
              SizedBox(
                height: size.height * .15,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: const TextStyle(color: primaryColor),
                        focusedBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(0), borderSide: const BorderSide(color: primaryColor, width: 2),),
                      ),
                      controller: _usernameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required field';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        return value!.isEmpty ? "Required field" : null;
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: const TextStyle(color: Color(0xFF95989A)),
                        focusedBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(0), borderSide: const BorderSide(color: primaryColor, width: 2),),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passwordHidden = !passwordHidden;
                            });
                          },
                          child: Icon(
                            passwordHidden
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: const Color(0xff747881),
                            size: 23,
                          ),
                        ),
                      ),
                      controller: _passwordController,
                      obscureText: passwordHidden,
                      enableSuggestions: false,

                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .045,
              ),
              CheckboxListTile(
                value: _savePassword,
                onChanged: (bool? newValue) {
                  setState(() {
                    _savePassword = newValue!;
                  });
                },
                title: const Text("Remember me"),
                activeColor: primaryColor,
              ),
              SizedBox(
                height: size.height * .05,
              ),
              SizedBox(
                width: size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    if (await _onFormSubmit(context)) {
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
                  ),
                  child: const Text("Sign In"),
                ),
              ),
              SizedBox(
                height: size.height * .015,
              ),
              Center(
                child: InkWell(
                  onTap: _onForgotPassword,
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .035,
              ),
              const Center(
                child: Text(
                  "You don't have an account?",
                  style: TextStyle(fontSize: 14, ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Center(
                child: InkWell(
                  onTap: _onSignUp,
                  child: const Text(
                    "Sign Up now to get access.",
                    style: TextStyle( color: primaryColor,fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Read values
  Future<void> _readFromStorage() async {
    _usernameController.text = await _storage.read(key: eLogin.KEY_USERNAME.toString()) ?? '';
    _passwordController.text = await _storage.read(key: eLogin.KEY_PASSWORD.toString()) ?? '';
  }

  Future<bool> _onFormSubmit(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_savePassword) {
        HttpService api = HttpService();
        //dynamic res = await api.login(_usernameController.text, _passwordController.text);
        UserModel res = await api.login(_usernameController.text, _passwordController.text);
        if(res.op){
          await _storage.write(key: eLogin.KEY_USERNAME.toString(), value: _usernameController.text);
          await _storage.write(key: eLogin.KEY_PASSWORD.toString(), value: _passwordController.text);
          return true;
        }
        else{
          showMyDialog('Error Login');
          /*final result = await FlutterPlatformAlert.showAlert(
            windowTitle: 'This ia title',
            text: 'This is body',
            alertStyle: AlertButtonStyle.yesNoCancel,
            iconStyle: IconStyle.information,
          );
          log(result.toString());*/
        }
      }
    }
    return false;
  }



}