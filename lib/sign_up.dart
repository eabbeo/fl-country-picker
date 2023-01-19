import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:selected_country/theme_configuration.dart';
import 'input_decoration.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  //final TextEditingController _contact = TextEditingController();
  bool _isObscure = true;
  var countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final signUpFormKey = GlobalKey<FormState>();

    return Scaffold(
      body: Center(
        child: Form(
          key: signUpFormKey,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Center(
              child: ListView(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: constColour(),
                          ))
                    ],
                  ),
                  Center(
                    child: Text(
                      ' Get Registered ',
                      style: theme().textTheme.headline1,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your full name',
                          label: Text(
                            'Name',
                            style: TextStyle(
                              color: constColour(),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: constColour(),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: constColour(),
                              )),
                        ),
                        controller: _name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your fullname';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Center(
                      child: TextFormField(
                        decoration: inputDecoration(),
                        controller: _username,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a prefered username';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Enter your email',
                            label: Text(
                              'Email',
                              style: TextStyle(
                                color: constColour(),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: constColour(),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: constColour(),
                                ))),
                        controller: _email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid email';
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return 'Please enter a valid email ';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Password',
                            label: Text(
                              'Password',
                              style: TextStyle(
                                color: constColour(),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: constColour(),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                                if (_password.text.length < 6) {
                                  debugPrint('Password length is too short');
                                }
                              },
                              color: constColour(),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: constColour(),
                                ))),
                        controller: _password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please provide a password';
                          }
                          return null;
                        },
                        obscureText: _isObscure,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: 'Enter phone number',
                          //label: const Text("Enter phone number"),
                          // border: InputBorder.none,
                          //
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: constColour(),
                              )),
                          //
                          labelStyle: TextStyle(color: Colors.grey.shade600),
                          prefixIcon: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 6),
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: (() async {
                                    final code = await countryPicker.showPicker(
                                        context: context);

                                    setState(() {
                                      countryCode = code;
                                    });
                                  }),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 9),
                                    decoration: BoxDecoration(
                                        color: constColour(),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Text(countryCode?.dialCode ?? "+233",
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ),
                                )
                              ],
                            ),
                          )),
                      controller: phoneNumber,
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(top: 15.0),
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //         hintText: 'Contact',
                  //         label: Text(
                  //           'Contact',
                  //           style: TextStyle(
                  //             color: constColour(),
                  //           ),
                  //         ),
                  //         prefixIcon: Icon(
                  //           Icons.phone,
                  //           color: constColour(),
                  //         ),
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(15),
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(15),
                  //             borderSide: BorderSide(
                  //               color: constColour(),
                  //             ))),
                  //     controller: _contact,
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return 'Please provide your contact';
                  //       }
                  //       return null;
                  //     },
                  //     keyboardType: TextInputType.number,
                  //   ),
                  // ),
                  // //CHECK BOX CODE GOES HERE

                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (signUpFormKey.currentState!.validate()) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                      'Confirmation',
                                      style: TextStyle(
                                          color: constColour(),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    content: const Text(
                                        'A verification code will be sent to your number  , do you wish to proceed ?'),
                                    actionsAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Edit Info',
                                          style:
                                              TextStyle(color: constColour()),
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () async {},
                                          child: Text(
                                            'Proceed',
                                            style:
                                                TextStyle(color: constColour()),
                                          ))
                                    ],
                                  ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: constColour(),
                          fixedSize: const Size(400, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
        hintText: 'Enter a preferred username',
        label: Text(
          'Username',
          style: TextStyle(
            color: constColour(),
          ),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: constColour(),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: constColour(),
            )));
  }

  SnackBar erroSnackBar({String? msg}) {
    return SnackBar(content: Text(msg!));
  }
}
