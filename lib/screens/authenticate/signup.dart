import 'package:aimelive_app/services/auth.dart';
import 'package:aimelive_app/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function goToLogin;
  const SignUp({required this.goToLogin});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  int currentStep = 0;

  final email = TextEditingController();
  final fullName = TextEditingController();
  final username = TextEditingController();
  final phone = TextEditingController();
  final String _avatar =
      "https://firebasestorage.googleapis.com/v0/b/aimelive-app.appspot.com/o/avatar.png?alt=media&token=c09839fc-1347-480a-b733-bdc5c1bd8488";
  final pwd = TextEditingController();
  final confirmPwd = TextEditingController();
  final bio = TextEditingController();

  bool isCompleted = false;
  bool isHidden = true;
  bool isLoading = false;

  String error = "";

  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Discard Changes?"),
            content: const Text("Changes on this page will not be saved."),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text("Discard")),
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Loading()
        : WillPopScope(
            onWillPop: () async {
              final shouldPop = await showWarning(context);
              return shouldPop ?? false;
            },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.grey,
                title: const Text('Sign Up'),
                elevation: 0.0,
                actions: [
                  IconButton(
                      onPressed: () {
                        widget.goToLogin();
                      },
                      icon: const Icon(Icons.login)),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              body: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Stepper(
                      //type: StepperType.horizontal,
                      steps: getSteps(),
                      currentStep: currentStep,
                      onStepContinue: () async {
                        final isLastStep = currentStep == getSteps().length - 1;
                        if (isLastStep) {
                          setState(() {
                            isCompleted = true;
                            isLoading = true;
                          });

                          dynamic result =
                              await _auth.registerWithEmailAndPassword(
                                  email.text,
                                  pwd.text,
                                  fullName.text,
                                  phone.text,
                                  _avatar,
                                  username.text,
                                  bio.text);
                          if (result == null) {
                            setState(() {
                              isLoading = false;
                              error = "Invalid Email or Password!";
                            });
                          } else {
                            setState(() {
                              error = "User Created!";
                              isLoading = false;
                            });
                          }
                        } else {
                          setState(() {
                            if (_formKey.currentState!.validate()) {
                              currentStep += 1;
                            }
                          });
                        }
                      },
                      onStepCancel: currentStep == 0
                          ? null
                          : () {
                              setState(() {
                                currentStep -= 1;
                              });
                            },
                      onStepTapped: (step) => setState(() {
                        if (currentStep < step) {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              currentStep++;
                            });
                          }
                        } else {
                          currentStep = step;
                        }
                      }),
                      controlsBuilder: (context, ControlsDetails controls) {
                        final isLastStep = currentStep == getSteps().length - 1;
                        return Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      onPressed: controls.onStepContinue,
                                      child: Text(
                                          isLastStep ? "SIGN UP" : "NEXT"))),
                              const SizedBox(
                                width: 12,
                              ),
                              if (currentStep != 0)
                                Expanded(
                                    child: ElevatedButton(
                                        onPressed: controls.onStepCancel,
                                        child: const Text("BACK"))),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    error,
                    style: const TextStyle(color: Colors.red, fontSize: 18),
                  )
                ],
              ),
            ),
          );
  }

  List<Step> getSteps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            title: const Text("Account"),
            content: Column(
              children: [
                TextFormField(
                  controller: email,
                  validator: (value) =>
                      value!.isEmpty ? "Email required! " : null,
                  decoration: const InputDecoration(labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  controller: fullName,
                  validator: (value) =>
                      value!.isEmpty ? "Name required! " : null,
                  decoration: const InputDecoration(labelText: "Full Name"),
                  keyboardType: TextInputType.name,
                ),
                TextFormField(
                  controller: phone,
                  validator: (value) =>
                      value!.isEmpty ? "Phone required! " : null,
                  decoration: const InputDecoration(labelText: "Phone"),
                  keyboardType: TextInputType.phone,
                ),
              ],
            )),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text("Profile"),
            content: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage("assets/avatar.png"),
                      radius: 30,
                    ),
                    CupertinoButton(
                        child: const Text("Upload Photo"), onPressed: () {})
                  ],
                ),
                TextFormField(
                  controller: username,
                  decoration: const InputDecoration(labelText: "Username"),
                ),
                TextFormField(
                  controller: bio,
                  decoration: const InputDecoration(labelText: "Bio"),
                  keyboardType: TextInputType.multiline,
                  maxLength: 50,
                ),
              ],
            )),
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: const Text("Security"),
            content: Column(
              children: [
                TextFormField(
                  controller: pwd,
                  obscureText: isHidden,
                  // validator: (value) => value!.length < 8
                  //     ? "Password must be 8 chars long! "
                  //     : null,
                  decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                          onPressed: () => setState(() => isHidden = !isHidden),
                          icon: Icon(isHidden
                              ? Icons.remove_red_eye
                              : Icons.hide_source))),
                ),
                TextFormField(
                  controller: confirmPwd,
                  obscureText: true,
                  // validator: (value) =>
                  //     value!.length < 8 ? "Confirm Password required! " : null,
                  decoration:
                      const InputDecoration(labelText: "Confirm Password"),
                ),
              ],
            )),
        Step(
            isActive: currentStep >= 3,
            title: const Text("Complete"),
            content: Column(
              children: [
                Text(fullName.text),
                Text(email.text),
                Text(username.text),
              ],
            )),
      ];
}
