import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:bazar/core/widgets/MainBtn.dart';
import 'package:bazar/features/islam/set_location/widgets/Fields.dart';
import 'package:bazar/features/islam/set_location/widgets/address_controller.dart';
import 'package:bazar/features/islam/set_location/widgets/address_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({super.key});

  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final govController = TextEditingController();
  final cityController = TextEditingController();
  final streetController = TextEditingController();
  final buildingController = TextEditingController();
  final floorController = TextEditingController();
  final flatController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    govController.dispose();
    cityController.dispose();
    streetController.dispose();
    buildingController.dispose();
    floorController.dispose();
    flatController.dispose();
    super.dispose();
  }

  void saveAddress() {
    if (_formKey.currentState!.validate()) {
      AddressModel address = AddressModel(
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        governorate: govController.text.trim(),
        city: cityController.text.trim(),
        street: streetController.text.trim(),
        building: buildingController.text.trim(),
        floor: floorController.text.trim(),
        flat: flatController.text.trim(),
      );
      Provider.of<AddressController>(
        context,
        listen: false,
      ).setAddress(address);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.mainWhite,
      body: SafeArea(
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.my_location, color: MainColors.mainPurple),
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
                          children: [
                            CustomField(
                              label: "Phone",
                              required: true,
                              keyboardType: TextInputType.phone,
                              controller: phoneController,
                            ),
                            const SizedBox(height: 20),

                            CustomField(
                              label: "Name",
                              required: true,
                              controller: nameController,
                            ),
                            const SizedBox(height: 20),

                            CustomField(
                              label: "Governorate",
                              required: true,
                              controller: govController,
                            ),
                            const SizedBox(height: 20),

                            CustomField(
                              label: "City",
                              required: true,
                              controller: cityController,
                            ),
                            const SizedBox(height: 20),

                            CustomField(
                              label: "Street name / number",
                              controller: streetController,
                            ),
                            const SizedBox(height: 20),

                            CustomField(
                              label: "Building name / number",
                              keyboardType: TextInputType.number,
                              controller: buildingController,
                            ),
                            const SizedBox(height: 20),

                            CustomField(
                              label: "Floor (optional)",
                              keyboardType: TextInputType.number,
                              controller: floorController,
                            ),
                            const SizedBox(height: 20),

                            CustomField(
                              label: "Flat (optional)",
                              keyboardType: TextInputType.number,
                              controller: flatController,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      MainBtm(
                        txt: "Confirmation",
                        radius: 30,
                        onPressed: saveAddress,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
