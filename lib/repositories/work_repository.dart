import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:renov_proprietaire_app/models/owner.dart';
import 'package:renov_proprietaire_app/models/work.dart';
import 'package:http/http.dart' as http;

class WorkRepository  {
  // Etudier les 3 lignes suivantes
  static final WorkRepository _instance = WorkRepository._internal();
  WorkRepository._internal();
  factory WorkRepository() => _instance;
  List<String> _workClick = [];
  List<Work> _valideWork = [];


  Stream<List<Work>> doQuery() async* {
   // var data = await rootBundle.loadString("data.json");
    var url = Uri.parse('https://app-264b90dd-7d1e-417a-ab1c-733d0b96c1d0.cleverapps.io/');
    var data = await http.get(url);

    var _json = jsonDecode(data.body);
    print(_json);
    List<Work> _works = [];
      _json['listTypeWork'].forEach((c) {
          _works.add(Work(c['id'], c['title'], c['titleDesc'], c['urlImage'], c['txt1'], c['txt2']));
      });
    yield _works;
  }

  Future<List<Work>> doQueryFuture() async {
    String username = 'apki_MpGotjs52ayfo4Id';
    String password = 'apks_qQbGHepDUIk6H3OAT81zCGO9lm8grH69OTNPr8kaw2YX9SkGvfbUCwK0bAzWZbaQ';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var url = Uri.parse('https://equipe2.lp-cloud.tech/v1/projet/template');
    var data = await http.get(url,
        headers: <String, String>{'authorization': basicAuth});
    var _json = jsonDecode(utf8.decode(data.bodyBytes));
    List<Work> _works = [];
    _json.forEach((work){
      if(work['type']=='Isolation'){
        _works.add(Work(work['_id'], work['travaux'][0]['nom'], work['pitch'], 'work[]', work['travaux'][0]['conseils'][0]['texte'], 'conseil 2'));
      }
    });
    return _works;
  }
  Future<Owner> QueryOwners() async {
    String username = 'apki_MpGotjs52ayfo4Id';
    String password = 'apks_qQbGHepDUIk6H3OAT81zCGO9lm8grH69OTNPr8kaw2YX9SkGvfbUCwK0bAzWZbaQ';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var url = Uri.parse('https://equipe2.lp-cloud.tech/v1/proprietaires');
    var data = await http.get(url,
        headers: <String, String>{'authorization': basicAuth});
    var _json = jsonDecode(utf8.decode(data.bodyBytes));
    print('coucou on est dans la query owners');
    print(_json);
    print(_json[0]);
    var currentOwner = Owner(_json[0]['email'], _json[0]['role'],_json[0]['nom'],_json[0]['prenom'],_json[0]['situation'], _json[0]['revenu_fiscal'],_json[0]['proprietes'] );
    print(currentOwner);
    return currentOwner;
  }
  
  Stream<Work?> getWork(idWork) async* {

    var data = await rootBundle.loadString("data.json");
    var _json = jsonDecode(data);
    Work? clickedWork;
    _json['listTypeWork'].forEach((c) {
      if(c['id'] == idWork){
        clickedWork = Work(c['id'], c['title'], c['titleDesc'], c['urlImage'], c['txt1'], c['txt2']);
      }
    });
    yield clickedWork;
  }


 List<Work> getAddValideWorkClick(work)
 {
   var bool = false;
   var elementToDelete = null;
  _valideWork.forEach((element) {
    if(element.id == work.id)
      {
        elementToDelete = element;
        bool = true;
      }
  });
   if(bool)
   {
     _valideWork.remove(elementToDelete);
   }
   else
   {
    _valideWork.add(work);
   }
   
   return _valideWork;
 } 

List<Work> allValideWork()
 {
   return _valideWork;
 }

 
 List<String> getAddWorkClick(work) 
 {
   if(_workClick.isNotEmpty)
   {
   _workClick.removeAt(0);
   }
    _workClick.add(work);
   return _workClick;
 } 



 List<String> allWorkClick() 
 {
   
   return _workClick;
 } 

}