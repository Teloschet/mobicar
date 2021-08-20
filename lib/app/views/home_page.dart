import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobicar/app/stores/vehicle_store.dart';

import 'package:mobicar/app/views/new_item_dialog.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VehicleStore vehicleStore = VehicleStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/menu.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [],
        ),
      ),
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo_mobcar.png",
          fit: BoxFit.fitHeight,
        ),
      ),
      body: _body(),
    );
  }

  Column _body() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => showDialog(
                      context: context,
                      builder: (context) =>
                          MyAlertDialog(typeOfOperation: 'new_vehicle'))
                  .then((map) {
                if (map != null) {
                  switch (map['operation']) {
                    case 'new_vehicle':
                      vehicleStore.setVehicle(map['vehicle']);
                      vehicleStore.vehicleListAdd();
                      break;
                    default:
                  }
                }
              }),
              child: Container(
                margin: EdgeInsets.only(top: 5, right: 5),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Text(
                  "Adicionar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Observer(builder: (_) {
            return ListView.builder(
              itemCount: vehicleStore.vehicleList.length,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    Divider(
                      color: Colors.black,
                    ),
                    ListTile(
                      leading: Image.asset("assets/images/car_image.png"),
                      title: Text(
                        vehicleStore.vehicleList[index].name ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(vehicleStore.vehicleList[index].anoModelo ?? ""),
                          GestureDetector(
                            child: Text(
                              "View More",
                              style: TextStyle(color: Color(0xff00adee)),
                            ),
                          )
                        ],
                      ),
                      isThreeLine: true,
                      trailing: PopupMenuButton(
                        itemBuilder: (context) {
                          return popUpMenuList(vehicleListIndice: index);
                        },
                        onSelected: (value) {
                          switch (value) {
                            case 'view':
                              break;
                            case 'edit':
                              break;
                            default:
                              vehicleStore.vehicleListRemove(index: index);
                              break;
                          }
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          }),
        )
      ],
    );
  }

  List<PopupMenuItem<String>> popUpMenuList({required int vehicleListIndice}) {
    List<PopupMenuItem<String>> choises = [
      PopupMenuItem(
        child: Text("View"),
        value: 'view',
      ),
      PopupMenuItem(
        child: Text("Edit"),
        value: "edit",
      ),
      PopupMenuItem(
        child: Text("Delete"),
        value: "delete",
      ),
    ];
    return choises;
  }
}
