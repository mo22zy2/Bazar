import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:bazar/core/widgets/MainBtn.dart';
import 'package:bazar/features/islam/set_location/widgets/Fields.dart';
import 'package:flutter/material.dart';

class SetLocation extends StatelessWidget {
  SetLocation({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.mainWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_rounded),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      "Location",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    IconButton(
                      icon: Icon(
                        Icons.my_location,
                        color: MainColors.mainPurple,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: const [
                              CustomField(
                                label: "Phone",
                                required: true,
                                keyboardType: TextInputType.phone,
                              ),
                              SizedBox(height: 20),
                              CustomField(label: "Name", required: true),
                              SizedBox(height: 20),
                              CustomField(label: "Governorate", required: true),
                              SizedBox(height: 20),
                              CustomField(label: "City", required: true),
                              SizedBox(height: 20),
                              CustomField(label: "Block"),
                              SizedBox(height: 20),
                              CustomField(label: "Street name /number"),
                              SizedBox(height: 20),
                              CustomField(label: "Building name/number"),
                              SizedBox(height: 20),
                              CustomField(label: "Floor (option)"),
                              SizedBox(height: 20),
                              CustomField(label: "Flat(option)"),
                              SizedBox(height: 20),
                              CustomField(label: "Avenue (option)"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        MainBtm(
                          txt: "Confirmation",
                          radius: 30,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Form submitted successfully"),
                                ),
                              );
                              Navigator.pop(context); // يرجع للصفحة السابقة
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
