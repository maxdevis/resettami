import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:resettami_app/Screens/Home.dart';
import 'package:resettami_app/Services/Auth.dart';
import 'package:resettami_app/utils/Constants.dart';
import 'package:localization/localization.dart';
import 'package:resettami_app/Library/SecureStorage.dart';
import 'package:resettami_app/Models/User.dart';
import 'package:resettami_app/utils/Uty.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const Color primaryColor = Color(0xFF13B5A2);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final SecureStorage _sessionStorage = SecureStorage();

  final TextEditingController _usernameController =
      TextEditingController(text: "CCCCCC11C11C111C");
  final TextEditingController _passwordController =
      TextEditingController(text: "Max12021970!");

  bool passwordHidden = true;
  bool _remember = true;

  _onForgotPassword() {}

  _onSignUp() {}

  @override
  void initState() {
    super.initState();
    //_readFromStorage();
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
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide:
                              const BorderSide(color: primaryColor, width: 2),
                        ),
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
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide:
                              const BorderSide(color: primaryColor, width: 2),
                        ),
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
                value: _remember,
                onChanged: (bool? newValue) {
                  setState(() {
                    _remember = newValue!;
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
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    if (await _login(context)) {
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
                      textStyle: const TextStyle(fontSize: 18)),
                  child: Text("signIn".i18n()),
                ),
              ),
              /*SizedBox(
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
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  // Read values
  Future<void> _readFromStorage() async {
    _usernameController.text =
        (await _sessionStorage.readData(eLogin.KEY_USERNAME.toString()))!;
    _passwordController.text =
        (await _sessionStorage.readData(eLogin.KEY_PASSWORD.toString()))!;
    setState(() {});
  }

  Future<bool> _login(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      waitDialog();
      bool ret = await checkConn();
      if(!ret){
        SmartDialog.dismiss();
        showMyDialog('Errore di connessione');
        return false;
      }
      AuthService api = AuthService();
      var res =
          await api.login(_usernameController.text, _passwordController.text);
      if (res != null) {
        await _sessionStorage.saveData(
            eLogin.KEY_TOKEN.toString(), res.token ?? '');
        await _sessionStorage.saveData(
            eLogin.KEY_TYPE_AUTH.toString(), res.type ?? '');
        await _sessionStorage.saveData(
            eLogin.KEY_USER.toString(), User.serialize(res.user as User));
        if (_remember) {
          await _sessionStorage.saveData(
              eLogin.KEY_USERNAME.toString(), _usernameController.text);
          await _sessionStorage.saveData(
              eLogin.KEY_PASSWORD.toString(), _passwordController.text);
        }
        SmartDialog.dismiss();
        return true;
      } else {
        SmartDialog.dismiss();
        showMyDialog('Error Login');
      }
      setState(() {});
    }
    return false;
  }
}
