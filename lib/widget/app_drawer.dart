import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projeksk/providers/app_provider.dart';
import 'package:projeksk/themes/color.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, child) {
        return Drawer(
          backgroundColor: TemaWarna.bone,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 15,
                ),
                padding: EdgeInsets.only(
                  top: 20,
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [TemaWarna.ebony, TemaWarna.sage],
                      // begin: Alignment.topCenter,
                      // end: Alignment.bottomCenter
                    ),
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(25)
                    ),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(0, 5)
                      )
                    ]
                ),
                child: Container(
                    padding: EdgeInsets.only(
                        top: 30, bottom: 30
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: Center(
                            child: Text(
                              "Menu Aplikasi",
                              style: appProvider.modeldrawer,
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ),
              ListTile(
                leading: Icon(Icons.autorenew,
                  color: TemaWarna.resedaGreen,),
                title: Text(
                  "Mode Otomatis",
                  style: appProvider.modeltitle,),
                trailing: Switch(
                  value: appProvider.autoMode,
                  onChanged: (value) {
                    appProvider.setAutoMode(value);
                  },
                  activeThumbColor: TemaWarna.sage,
                  activeTrackColor: TemaWarna.ebony,
                  inactiveThumbColor: TemaWarna.ebony,
                  inactiveTrackColor: TemaWarna.bone,
                ),
              ),
              ListTile(
                leading: Icon(Icons.lightbulb,
                  color: TemaWarna.resedaGreen,
                ),
                title: Text(
                  "LED Manual",
                  style: appProvider.modeltitle,),
                trailing: Switch(
                  value: appProvider.NilaiLed,
                  onChanged: appProvider.autoMode
                      ? null
                      : (value) {
                    appProvider.setLed(value);
                  },
                  activeThumbColor: TemaWarna.sage,
                  activeTrackColor: TemaWarna.ebony,
                  inactiveThumbColor: TemaWarna.ebony,
                  inactiveTrackColor: TemaWarna.bone,
                ),
              )
            ],
          ),
        );
       }
       );
  }
}