import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:renov_proprietaire_app/models/work.dart';

class WorkRepository{
  // Etudier les 3 lignes suivantes
  static final WorkRepository _instance = WorkRepository._internal();
  WorkRepository._internal();
  factory WorkRepository() => _instance;
  Future<List<Work>> doQuery() async {
    var data = await rootBundle.loadString("data.json");
    var _json = jsonDecode(data);
    print(_json);
    List<Work> _works = [];
      _json['listTypeWork'].forEach((c) {
          //_works.add(Work(id: c['id'],isSelected: c['isSelected'], title: c['title'], titleDesc: c['titleDesc'], urlImage: c['urlImage'], txt1: c['txt1'],txt2: c['txt2']));
          _works.add(Work(c['id'],c['isSelected'], c['title'], c['titleDesc'], c['urlImage'], c['txt1'], c['txt2']));
      });
    return _works;
  }
}