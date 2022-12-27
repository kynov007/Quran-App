import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quran/app/data/models/detail_surah.dart';

class DetailSurahController extends GetxController {
  Future<DetailSurah> getDetailSurah(String id) async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah/$id');
    var res = await http.get(url);

    // ignore: unused_local_variable
    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)["data"];
    return DetailSurah.fromJson(data);
  }
}
