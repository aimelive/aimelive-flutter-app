import 'package:aimelive_app/screens/user-app/screen_wrapper.dart';
import 'package:aimelive_app/services/auth.dart';
import 'package:aimelive_app/shared/loading.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function goToSignUp;
  const LoginPage({required this.goToSignUp});

  @override
  State<LoginPage> createState() => _LoginPaageState();
}

class _LoginPaageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isLoading = false;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String? _emailError;
  String? _passwordError;
  String message = "";

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: const Color.fromARGB(255, 161, 161, 161),
              title: const Text("Login"),
              foregroundColor: Colors.white,
              actions: [
                IconButton(
                    onPressed: () {
                      widget.goToSignUp();
                    },
                    icon: const Icon(Icons.person_add)),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            body: Container(
              decoration: const BoxDecoration(
                color: Color(0xfff2f2f2),
                image: DecorationImage(
                    image: AssetImage('assets/bg-app.jpg'),
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter),
              ),
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                          child: Text(
                        message,
                        style: const TextStyle(
                            color: Colors.red, backgroundColor: Colors.white),
                      )),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 30),
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/Rectangle 21.png"),
                            radius: 30,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Text(
                              "Login Form",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextField(
                            controller: _email,
                            decoration: InputDecoration(
                              errorText: _emailError,
                              labelText: "Email",
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffecb22e), width: 2.0),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 2.0),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 0.0),
                                  borderRadius: BorderRadius.circular(10)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 1.0),
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.mail)),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (_email) {
                              //print(_email.contains("@"));
                              //print(_email.length);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            obscureText: hidePassword,
                            controller: _password,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                fillColor: Colors.white,
                                filled: true,
                                errorText: _passwordError,
                                labelText: "Password",
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xffecb22e), width: 2.0),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.red, width: 2.0),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 0.0),
                                    borderRadius: BorderRadius.circular(10)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.red, width: 1.0),
                                    borderRadius: BorderRadius.circular(10)),
                                suffixIcon: IconButton(
                                  onPressed: (() {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  }),
                                  icon: Icon(hidePassword
                                      ? Icons.remove_red_eye
                                      : Icons.remove_red_eye_outlined),
                                  hoverColor: const Color(0xffeeeeee),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  if (_email.text == "" ||
                                      _password.text == "") {
                                    if (_email.text == "") {
                                      setState(() {
                                        _emailError = "Email required!";
                                      });
                                    } else {
                                      setState(() {
                                        _emailError = null;
                                      });
                                    }
                                    if (_password.text == "") {
                                      setState(() {
                                        _passwordError = "Password required!";
                                      });
                                    } else {
                                      setState(() {
                                        _passwordError = null;
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    dynamic result = await _auth.signIn(
                                        _email.text, _password.text);
                                    if (result == null) {
                                      setState(() {
                                        message = "Failed to Login";
                                        isLoading = false;
                                      });
                                    } else {
                                      setState(() {
                                        message = "Login Successfully";
                                        isLoading = false;
                                      });
                                      // Navigator.pushReplacement(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (_) => const ScreenWrapper(),
                                      //   ),
                                      // );
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  const ScreenWrapper())),
                                          (route) => false);
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15),
                                    shape: const StadiumBorder(),
                                    primary: const Color(0xffecb22e),
                                    onPrimary: Colors.white),
                                child: const Text(
                                  "Sign in",
                                  style: TextStyle(fontSize: 16.5),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 1.5,
                                        width: 80,
                                        color: const Color(0xffecb22e)),
                                    const Text(
                                      " OR ",
                                      style:
                                          TextStyle(color: Color(0xffecb22e)),
                                    ),
                                    Container(
                                        height: 1.5,
                                        width: 80,
                                        color: const Color(0xffecb22e))
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content: const Text(
                                        "Can't sign in with Google at this time!"),
                                    action: SnackBarAction(
                                        label: "OK", onPressed: () {}),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15),
                                    shape: const StadiumBorder(),
                                    primary: Colors.blue,
                                    onPrimary: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.g_mobiledata),
                                    Text(
                                      " Sign with Google",
                                      style: TextStyle(fontSize: 16.5),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
