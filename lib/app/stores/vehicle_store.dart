import 'package:flutter/cupertino.dart';
import 'package:mobicar/app/models/vehicle_model.dart';
import 'package:mobicar/app/services/vehicle_service.dart';
import 'package:mobx/mobx.dart';
part 'vehicle_store.g.dart';

class VehicleStore = _VehicleStoreBase with _$VehicleStore;

abstract class _VehicleStoreBase with Store {
  @observable
  var brands = [];
  @action
  getBrands() async {
    brands = await VehicleService.getBrands();
  }

  @observable
  var selectedBrand;
  @action
  setSelectedBrand(value) => selectedBrand = value;

  @observable
  var models = [];
  @action
  getModels({required String brandId}) async {
    models = await VehicleService.getModels(brandId: brandId);
  }

  @observable
  var selectedModel;
  @action
  setSelectedModel(value) => selectedModel = value;

  @observable
  var years = [];
  @action
  getYears({required String brandId, required String modelId}) async {
    years = await VehicleService.getYears(idBrand: brandId, modelId: modelId);
  }

  @observable
  var selectedYear;
  @action
  setSelectedYear(value) => selectedYear = value;

  @observable
  TextEditingController priceController = TextEditingController();

  @action
  getPrice(
      {required String brandId,
      required String modelId,
      required String yearId}) async {
    var response = await VehicleService.getPrice(
        idBrand: brandId, modelId: modelId, yearId: yearId);
    if (response != false) {
      setVehicle(response);
      setPrice(vehicleModel.preco);
    }
  }

  @action
  setPrice(value) => priceController.text = value;

  @observable
  VehicleModel vehicleModel = VehicleModel();

  @action
  setVehicle(value) => vehicleModel = value;

  ObservableList<VehicleModel> vehicleList = ObservableList<VehicleModel>();

  @action
  vehicleListAdd({isEdit = false, vehicleIndex}) {
    if (isEdit) {
      vehicleList[vehicleIndex] = vehicleModel;
      return;
    }
    vehicleList.add(vehicleModel);
  }

  @action
  vehicleListRemove({required int index}) async {
    vehicleList.removeAt(index);
  }
}
