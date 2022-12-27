import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:quran/app/data/models/juz.dart';
import 'package:quran/app/data/models/surah.dart';

class HomeController extends GetxController {
  static RxBool isdark = false.obs;
  Future<List<Surah>> getAllsurah() async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah');
    var res = await http.get(url);

    // ignore: unused_local_variable
    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }

    // ignore: unused_local_variable
    // Surah surahAnnas = Surah.fromJson(data[113]);
  }

  Future<List<Juz>> getAllJuz() async {
    List<Juz> allJuz = [];
    for (int i = 1; i <= 30; i++) {
      Uri url = Uri.parse('https://api.quran.gading.dev/juz/$i');
      var res = await http.get(url);

      // ignore: unused_local_variable
      Map<String, dynamic> data =
          (json.decode(res.body) as Map<String, dynamic>)["data"];

      Juz juz = Juz.fromJson(data);
      allJuz.add(juz);
      // print('$i ${juz.juzStartInfo} | ${juz.juzEndInfo}');
      print(juz.juzStartInfo);
    }

    return allJuz;
    // ignore: unused_local_variable
    // Surah surahAnnas = Surah.fromJson(data[113]);
  }
}
