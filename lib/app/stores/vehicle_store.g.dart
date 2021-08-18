part of 'vehicle_store.dart';

mixin _$VehicleStore on _VehicleStoreBase, Store {
  final _$brandsAtom = Atom(name: '_VehicleStoreBase.brands');

  @override
  List<dynamic> get brands {
    _$brandsAtom.reportRead();
    return super.brands;
  }

  @override
  set brands(List<dynamic> value) {
    _$brandsAtom.reportWrite(value, super.brands, () {
      super.brands = value;
    });
  }

  final _$selectedBrandAtom = Atom(name: '_VehicleStoreBase.selectedBrand');

  @override
  dynamic get selectedBrand {
    _$selectedBrandAtom.reportRead();
    return super.selectedBrand;
  }

  @override
  set selectedBrand(dynamic value) {
    _$selectedBrandAtom.reportWrite(value, super.selectedBrand, () {
      super.selectedBrand = value;
    });
  }

  final _$modelsAtom = Atom(name: '_VehicleStoreBase.models');

  @override
  List<dynamic> get models {
    _$modelsAtom.reportRead();
    return super.models;
  }

  @override
  set models(List<dynamic> value) {
    _$modelsAtom.reportWrite(value, super.models, () {
      super.models = value;
    });
  }

  final _$selectedModelAtom = Atom(name: '_VehicleStoreBase.selectedModel');

  @override
  dynamic get selectedModel {
    _$selectedModelAtom.reportRead();
    return super.selectedModel;
  }

  @override
  set selectedModel(dynamic value) {
    _$selectedModelAtom.reportWrite(value, super.selectedModel, () {
      super.selectedModel = value;
    });
  }

  final _$yearsAtom = Atom(name: '_VehicleStoreBase.years');

  @override
  List<dynamic> get years {
    _$yearsAtom.reportRead();
    return super.years;
  }

  @override
  set years(List<dynamic> value) {
    _$yearsAtom.reportWrite(value, super.years, () {
      super.years = value;
    });
  }

  final _$selectedYearAtom = Atom(name: '_VehicleStoreBase.selectedYear');

  @override
  dynamic get selectedYear {
    _$selectedYearAtom.reportRead();
    return super.selectedYear;
  }

  @override
  set selectedYear(dynamic value) {
    _$selectedYearAtom.reportWrite(value, super.selectedYear, () {
      super.selectedYear = value;
    });
  }

  final _$priceControllerAtom = Atom(name: '_VehicleStoreBase.priceController');

  @override
  TextEditingController get priceController {
    _$priceControllerAtom.reportRead();
    return super.priceController;
  }

  @override
  set priceController(TextEditingController value) {
    _$priceControllerAtom.reportWrite(value, super.priceController, () {
      super.priceController = value;
    });
  }

  final _$vehicleModelAtom = Atom(name: '_VehicleStoreBase.vehicleModel');

  @override
  VehicleModel get vehicleModel {
    _$vehicleModelAtom.reportRead();
    return super.vehicleModel;
  }

  @override
  set vehicleModel(VehicleModel value) {
    _$vehicleModelAtom.reportWrite(value, super.vehicleModel, () {
      super.vehicleModel = value;
    });
  }

  final _$getBrandsAsyncAction = AsyncAction('_VehicleStoreBase.getBrands');

  @override
  Future getBrands() {
    return _$getBrandsAsyncAction.run(() => super.getBrands());
  }

  final _$getModelsAsyncAction = AsyncAction('_VehicleStoreBase.getModels');

  @override
  Future getModels({required String brandId}) {
    return _$getModelsAsyncAction.run(() => super.getModels(brandId: brandId));
  }

  final _$getYearsAsyncAction = AsyncAction('_VehicleStoreBase.getYears');

  @override
  Future getYears({required String brandId, required String modelId}) {
    return _$getYearsAsyncAction
        .run(() => super.getYears(brandId: brandId, modelId: modelId));
  }

  final _$getPriceAsyncAction = AsyncAction('_VehicleStoreBase.getPrice');

  @override
  Future getPrice(
      {required String brandId,
      required String modelId,
      required String yearId}) {
    return _$getPriceAsyncAction.run(() =>
        super.getPrice(brandId: brandId, modelId: modelId, yearId: yearId));
  }

  final _$vehicleListRemoveAsyncAction =
      AsyncAction('_VehicleStoreBase.vehicleListRemove');

  @override
  Future vehicleListRemove({required int index}) {
    return _$vehicleListRemoveAsyncAction
        .run(() => super.vehicleListRemove(index: index));
  }

  final _$_VehicleStoreBaseActionController =
      ActionController(name: '_VehicleStoreBase');

  @override
  dynamic setSelectedBrand(dynamic value) {
    final _$actionInfo = _$_VehicleStoreBaseActionController.startAction(
        name: '_VehicleStoreBase.setSelectedBrand');
    try {
      return super.setSelectedBrand(value);
    } finally {
      _$_VehicleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedModel(dynamic value) {
    final _$actionInfo = _$_VehicleStoreBaseActionController.startAction(
        name: '_VehicleStoreBase.setSelectedModel');
    try {
      return super.setSelectedModel(value);
    } finally {
      _$_VehicleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedYear(dynamic value) {
    final _$actionInfo = _$_VehicleStoreBaseActionController.startAction(
        name: '_VehicleStoreBase.setSelectedYear');
    try {
      return super.setSelectedYear(value);
    } finally {
      _$_VehicleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPrice(dynamic value) {
    final _$actionInfo = _$_VehicleStoreBaseActionController.startAction(
        name: '_VehicleStoreBase.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_VehicleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setVehicle(dynamic value) {
    final _$actionInfo = _$_VehicleStoreBaseActionController.startAction(
        name: '_VehicleStoreBase.setVehicle');
    try {
      return super.setVehicle(value);
    } finally {
      _$_VehicleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic vehicleListAdd({dynamic isEdit = false, dynamic vehicleIndex}) {
    final _$actionInfo = _$_VehicleStoreBaseActionController.startAction(
        name: '_VehicleStoreBase.vehicleListAdd');
    try {
      return super.vehicleListAdd(isEdit: isEdit, vehicleIndex: vehicleIndex);
    } finally {
      _$_VehicleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
brands: $brands,
selectedBrand: $selectedBrand,
models: $models,
selectedModel: $selectedModel,
years: $years,
selectedYear: $selectedYear,
priceController: $priceController,
vehicleModel: $vehicleModel
    ''';
  }
}
