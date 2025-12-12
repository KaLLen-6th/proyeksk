import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeksk/themes/color.dart';

class AppProvider extends ChangeNotifier{
  dynamic NilaiSuhu;
  dynamic NilaiKelembaban;
  dynamic NilaiSoil;
  final database = FirebaseDatabase.instance.ref();

  Future getNilaiSuhu() async {
    final datasuhu = database.child('DataSuhu');
    datasuhu.onValue.listen((event) {
      final getDataSuhu = event.snapshot;
      NilaiSuhu = getDataSuhu.value;
      notifyListeners();
      }
    );
  }

  Future getNilaiKelembaban() async {
    final datakelembaban = database.child('DataHumidity');
    datakelembaban.onValue.listen((event) {
      final getDataKel = event.snapshot;
      NilaiKelembaban = getDataKel.value;
      notifyListeners();
      }
    );
  }

  Future getNilaiSoil() async {
    final datasoil = database.child('DataSoil');
    datasoil.onValue.listen((event) {
      final getDataSoil = event.snapshot;
      NilaiSoil = getDataSoil.value;
      notifyListeners();
    }
    );
  }

  TextStyle model1 = GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: TemaWarna.bone
  );
  TextStyle modeldrawer = GoogleFonts.poppins(
      fontSize: 25,
      fontWeight: FontWeight.w500,
      color: TemaWarna.bone
  );
  TextStyle model2 = GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: TemaWarna.bone
  );
  TextStyle modeltitle = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: TemaWarna.dun
  );
  TextStyle agrotech = GoogleFonts.poppins(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: TemaWarna.ebony
  );
  TextStyle agro2 = GoogleFonts.poppins(
      color: TemaWarna.resedaGreen
  );
  TextStyle modelvalue = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: TemaWarna.sage
  );

  String AgrotechSystem =
      "Aplikasi monitoring untuk greenhouse ini memungkinkan pemantauan suhu, kelembaban udara, dan kelembaban tanah secara real-time. Menggunakan DHT22 dan Soil Moisture Sensor, data dikirim secara nirkabel ke aplikasi, menampilkan grafik dan notifikasi jika parameter melebihi batas. Dengan sistem ini, pengguna dapat mengelola kondisi greenhouse lebih efisien untuk mendukung pertumbuhan tanaman yang optimal.";

}