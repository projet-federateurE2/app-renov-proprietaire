import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:renov_proprietaire_app/models/work.dart';

class WorkRepository  {
  // Etudier les 3 lignes suivantes
  static final WorkRepository _instance = WorkRepository._internal();
  WorkRepository._internal();
  factory WorkRepository() => _instance;

  Stream<List<Work>> doQuery() async* {
    var data = await rootBundle.loadString("data.json");
    var _json = jsonDecode(data);
    List<Work> _works = [];
      _json['listTypeWork'].forEach((c) {
          //_works.add(Work(id: c['id'],isSelected: c['isSelected'], title: c['title'], titleDesc: c['titleDesc'], urlImage: c['urlImage'], txt1: c['txt1'],txt2: c['txt2']));
          _works.add(Work(c['id'],c['isSelected'], c['title'], c['titleDesc'], c['urlImage'], c['txt1'], c['txt2']));
      });
    yield _works;
  }
  Stream<Work?> getWork(idWork) async* {
    var data = await rootBundle.loadString("data.json");
    var _json = jsonDecode(data);
    Work? clickedWork;
    _json['listTypeWork'].forEach((c) {
      if(c['id'] == idWork){
        clickedWork = Work(c['id'],c['isSelected'], c['title'], c['titleDesc'], c['urlImage'], c['txt1'], c['txt2']);
      }
    });
/*    print('ici le repository: ');
    print(clickedWork.id);*/
    yield clickedWork;
  }

}