import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobicar/app/models/vehicle_model.dart';

class VehicleService {
  static const domain = "https://parallelum.com.br/fipe/api/v1/carros";

  static Future getBrands() async {
    try {
      var response = await http.get(Uri.parse("$domain/marcas"));
      if (response.statusCode != 200 || response.body.isEmpty) {
        return false;
      }
      List brands = jsonDecode(response.body);
      return brands;
    } catch (e) {
      return false;
    }
  }

  static Future getModels({required String brandId}) async {
    try {
      var response =
          await http.get(Uri.parse("$domain/marcas/$brandId/modelos"));
      if (response.statusCode != 200 || response.body.isEmpty) {
        return false;
      }
      List models = jsonDecode(response.body);
      return models;
    } catch (e) {
      return false;
    }
  }

  static Future getYears(
      {required String idBrand, required String modelId}) async {
    List vehiclesList = [];
    try {
      var response = await http
          .get(Uri.parse("$domain/marcas/$idBrand/modelos/$modelId/anos"));
      if (response.statusCode != 200 || response.body.isEmpty) {
        return vehiclesList;
      } else {
        vehiclesList = jsonDecode(response.body);
      }
      return vehiclesList;
    } catch (e) {
      return vehiclesList;
    }
  }

  static Future getPrice(
      {required String idBrand,
      required String modelId,
      required String yearId}) async {
    try {
      var response = await http.get(
          Uri.parse("$domain/marcas/$idBrand/modelos/$modelId/anos/$yearId"));
      if (response.statusCode != 200 || response.body.isEmpty) {
        return false;
      }
      var json = jsonDecode(response.body);
      var model = VehicleModel.fromJson(json: json);
      return model;
    } catch (e) {
      return false;
    }
  }
}
