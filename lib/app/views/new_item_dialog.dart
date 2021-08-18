import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:mobicar/app/models/vehicle_model.dart';
import 'package:mobicar/app/stores/vehicle_store.dart';

class MyAlertDialog extends StatefulWidget {
  final String typeOfOperation;
  final int? indexToEditController;
  final VehicleModel? vehicle;

  const MyAlertDialog({
    Key? key,
    required this.typeOfOperation,
    this.indexToEditController,
    this.vehicle,
  }) : super(key: key);

  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  final vehicleStore = VehicleStore();
  @override
  void initState() {
    vehicleStore.getBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    vehicleStore.getBrands();
    return Container(
      child: AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/car_icon.png"),
                    SizedBox(width: 10),
                    Text(
                      "Novo Veiculo",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ],
            ),
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context))
          ],
        ),
        content: Observer(builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Image.asset("assets/images/car.png"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        _fillStar(),
                        _fillStar(),
                        _fillStar(),
                        _fillStar(),
                        _emptyStar(),
                      ],
                    ),
                  )
                ],
              ),
              _marginLine(),
              DropdownButtonFormField(
                isExpanded: true,
                decoration: _formDecoration(),
                value: vehicleStore.selectedBrand,
                hint: Text("Marcas"),
                items: buildDropItemsBrands(vehicleStore.brands),
                onTap: () {
                  vehicleStore.setSelectedModel(null);
                  vehicleStore.setSelectedYear(null);
                  vehicleStore.setPrice("");
                },
                onChanged: (value) async {
                  vehicleStore.setSelectedBrand(value);
                  vehicleStore.getModels(brandId: value.toString());
                },
              ),
              _marginLine(),
              DropdownButtonFormField(
                decoration: _formDecoration(),
                value: vehicleStore.selectedModel,
                hint: Text("Veiculos"),
                isExpanded: true,
                items: buildModelsFormList(vehicleStore.models),
                onTap: () {
                  vehicleStore.setSelectedYear(null);
                  vehicleStore.setPrice("");
                },
                onChanged: (value) {
                  vehicleStore.setSelectedModel(value);
                  vehicleStore.getYears(
                      brandId: vehicleStore.selectedBrand,
                      modelId: vehicleStore.selectedModel);
                },
              ),
              _marginLine(),
              DropdownButtonFormField(
                isExpanded: true,
                decoration: _formDecoration(),
                value: vehicleStore.selectedYear,
                hint: Text("Ano"),
                items: buildDropItemsVehiclesYear(vehicleStore.years),
                onTap: () => vehicleStore.setPrice(""),
                onChanged: (value) {
                  vehicleStore.setSelectedYear(value);
                  vehicleStore.getPrice(
                      brandId: vehicleStore.selectedBrand,
                      modelId: vehicleStore.selectedModel,
                      yearId: vehicleStore.selectedYear);
                },
              ),
              _marginLine(),
              TextFormField(
                readOnly: true,
                decoration: _formDecoration(hint: "Valor (R\$)"),
                controller: vehicleStore.priceController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      margin: EdgeInsets.only(top: 5, right: 5),
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: Colors.black)),
                      child: Text(
                        "Cancelar",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Map map = {
                        "operation": widget.typeOfOperation,
                        "vehicle": vehicleStore.vehicleModel,
                      };
                      vehicleStore.vehicleListAdd();
                      Navigator.pop(context, map);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 5, right: 5),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        }),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26),
        ),
      ),
    );
  }

  SizedBox _marginLine() => SizedBox(height: 15);

  InputDecoration _formDecoration({hint}) {
    return InputDecoration(
      isDense: true,
      hintText: hint,
      contentPadding: EdgeInsets.all(8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  List<DropdownMenuItem<String>> buildDropItemsBrands(brandList) {
    List<DropdownMenuItem<String>> dropDownItemsList = [];
    brandList.forEach((element) {
      dropDownItemsList.add(
        DropdownMenuItem<String>(
          child: Text(
            element['name'],
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black),
          ),
          value: element['id'].toString(),
        ),
      );
    });
    return dropDownItemsList;
  }

  List<DropdownMenuItem<String>> buildModelsFormList(vehiclesList) {
    List<DropdownMenuItem<String>> dropDownItemsList = [];
    vehiclesList.forEach((element) {
      dropDownItemsList.add(
        DropdownMenuItem<String>(
          child: Text(
            element['name'],
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black),
          ),
          value: element['id'].toString(),
        ),
      );
    });
    return dropDownItemsList;
  }

  List<DropdownMenuItem<String>> buildDropItemsVehiclesYear(vehiclesYearList) {
    List<DropdownMenuItem<String>> dropDownItemsList = [];
    vehiclesYearList.forEach((element) {
      dropDownItemsList.add(
        DropdownMenuItem<String>(
          child: Text(
            element['name'],
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black),
          ),
          value: element['id'],
        ),
      );
    });
    return dropDownItemsList;
  }
}

Icon _fillStar() => Icon(
      Icons.star,
      color: Color(0xfffaad14),
    );

Icon _emptyStar() => Icon(
      Icons.star_border,
      color: Color(0xfffaad14),
    );
