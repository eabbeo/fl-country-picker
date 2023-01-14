import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

var countryPicker = const FlCountryCodePicker();
CountryCode? countryCode;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              maxLines: 1,
              decoration: InputDecoration(
                  label: const Text("Enter phone number"),
                  border: InputBorder.none,
                  labelStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
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
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(6)),
                            // child: Text(
                            //   "$countryCode",
                            //   style: const TextStyle(color: Colors.white),
                            // ),
                            child: Text(countryCode?.dialCode ?? "+233",
                                style: const TextStyle(color: Colors.white)),
                          ),
                        )
                      ],
                    ),
                  )),
              controller: phoneNumber,
            ),
            ElevatedButton(
                onPressed: () {
                  if (countryCode != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(countryCode!.dialCode + phoneNumber.text)));
                  } else {}
                },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
