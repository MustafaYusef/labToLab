import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';

class MapsSheet {
  static show({
    required BuildContext context,
    required Function(AvailableMap map) onMapTap,
  }) async {
    final availableMaps = await MapLauncher.installedMaps;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "الخرائط المتوفرة",
                  style: TextStyle(color: Get.theme.primaryColor, fontSize: 20),
                ),
              ),
              Divider(
                height: 0.5,
                color: Colors.grey,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Wrap(
                      children: <Widget>[
                        for (var map in availableMaps)
                          ListTile(
                            onTap: () {
                              onMapTap(map);
                              Get.back();
                            },
                            title: Text(map.mapName),
                            leading: SvgPicture.asset(
                              map.icon,
                              height: 30.0,
                              width: 30.0,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
