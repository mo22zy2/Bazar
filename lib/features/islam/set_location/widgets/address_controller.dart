import 'package:bazar/features/islam/set_location/widgets/address_model.dart';
import 'package:flutter/material.dart';

class AddressController extends ChangeNotifier {
  AddressModel? address;

  void setAddress(AddressModel newAddress) {
    address = newAddress;
    notifyListeners();
  }
}
