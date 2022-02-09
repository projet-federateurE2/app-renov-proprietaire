import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:renov_proprietaire_app/models/work.dart';
import 'package:http/http.dart' as http;

class WorkRepository  {
  // Etudier les 3 lignes suivantes
  static final WorkRepository _instance = WorkRepository._internal();
  WorkRepository._internal();
  factory WorkRepository() => _instance;
  List<String> _workClick = [];


  Stream<List<Work>> doQuery() async* {
   // var data = await rootBundle.loadString("data.json");
    var url = Uri.parse('http://app-264b90dd-7d1e-417a-ab1c-733d0b96c1d0.cleverapps.io/v1/projet/template');
    var data = await http.get(url);
    // log(response.toString());
    var _json = jsonDecode(data.body);
    print(_json);
    List<Work> _works = [];
      _json['listTypeWork'].forEach((c) {
          //_works.add(Work(id: c['id'],isSelected: c['isSelected'], title: c['title'], titleDesc: c['titleDesc'], urlImage: c['urlImage'], txt1: c['txt1'],txt2: c['txt2']));
          _works.add(Work(c['id'],c['isSelected'], c['title'], c['titleDesc'], c['urlImage'], c['txt1'], c['txt2']));
      });
    yield _works;
  }

  Future<List<Work>> doQueryFuture() async {
    // var data = await rootBundle.loadString("data.json");
    var url = Uri.parse('http://app-264b90dd-7d1e-417a-ab1c-733d0b96c1d0.cleverapps.io/v1/projet/template');
    var data = await http.get(url);
    // log(response.toString());
    var _json = jsonDecode(data.body);
    print(_json);
    List<Work> _works = [];
      _json['listTypeWork'].forEach((c) {
          //_works.add(Work(id: c['id'],isSelected: c['isSelected'], title: c['title'], titleDesc: c['titleDesc'], urlImage: c['urlImage'], txt1: c['txt1'],txt2: c['txt2']));
          _works.add(Work(c['id'],c['isSelected'], c['title'], c['titleDesc'], c['urlImage'], c['txt1'], c['txt2']));
      });
    return _works;
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


 List<String> getAddWorkClick(work) 
 {
   _workClick.add(work);
   return _workClick;
 } 

 List<String> getRemoveWorkClick(work) 
 {
   _workClick.remove(work);
   return _workClick;
 } 

 List<String> allWorkClick() 
 {
   
   return _workClick;
 } 

}