import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projeksk/providers/app_provider.dart';
import 'package:projeksk/themes/color.dart';
import 'package:projeksk/widget/data_container.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> Scaffoldkey = GlobalKey<ScaffoldState>();
    return Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          return Scaffold(
            key: Scaffoldkey,
            backgroundColor: TemaWarna.bone,
            endDrawer: Drawer(
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
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter
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
                                child: Text(
                                    "Menu Aplikasi",
                                    style: appProvider.modeldrawer,
                                ),
                              ),
                          ],
                        )
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.autorenew),
                    title: Text("Mode Otomatis"),
                    trailing: Switch(
                        value: appProvider.autoMode,
                        onChanged: (value) {
                          appProvider.setAutoMode(value);
                        }),
                  ),
                  ListTile(
                    leading: Icon(Icons.lightbulb),
                    title: Text("LED Manual", style: appProvider.model1,),
                    trailing: Switch(
                        value: appProvider.NilaiLed,
                        onChanged: appProvider.autoMode
                            ? null
                            : (value) {
                          appProvider.setLed(value);
                        }),
                  )
                ],
              ),
            ),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      bottom: 15
                  ),
                  padding: EdgeInsets.only(
                      top: 50, bottom: 10, left: 15, right: 15
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
                      ),
                    ],
                  ),
                  // kolom bagian 1 (atas)
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Proyek Sistem Komputer",
                              style: appProvider.model1,
                            ),
                          IconButton(
                             icon: Icon(Icons.menu,
                             color: TemaWarna.bone,
                             ),
                            onPressed: () {
                               Scaffoldkey.currentState!.openEndDrawer();
                            },
                          ),
                        ],
                      ),
                      Text(
                          "Monitoring Lidah Mertua",
                            textAlign: TextAlign.start,
                            style: appProvider.model2,
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //kolom kontainer data dan gambar
                          Column(
                            spacing: 10,
                            children: [
                              //container temperature
                              DataContainer(
                                  title: "Temperature",
                                  value: ("${appProvider.NilaiSuhu ?? '-'}°C")
                              ),
                              //container humidity
                              DataContainer(
                                  title: "Humidity",
                                  value: ("${appProvider.NilaiKelembaban ?? '-'}%")
                              ),
                              //container soil moisture
                              DataContainer(
                                  title: "Soil Moisture",
                                  value: ("${appProvider.NilaiSoil ?? '-'}%")
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: Image.asset(
                              'assets/lidahmertua.png',
                              height: 320,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  // padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: TemaWarna.sage,
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Agrotech System",
                          style: appProvider.agrotech,
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: TemaWarna.sage,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          appProvider.AgrotechSystem,
                          textAlign: TextAlign.justify,
                          style: appProvider.agro2,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}
