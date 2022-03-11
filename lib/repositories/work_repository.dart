import 'dart:convert';
import 'package:renov_proprietaire_app/models/owner.dart';
import 'package:renov_proprietaire_app/models/work.dart';
import 'package:http/http.dart' as http;

import '../values/strings.dart';

class WorkRepository  {
  // Etudier les 3 lignes suivantes
  static final WorkRepository _instance = WorkRepository._internal();
  WorkRepository._internal();
  factory WorkRepository() => _instance;
  List<String> _workClick = [];
  List<Work> _valideWork = [];
  
  static const username = Api.username;
  static const password = Api.password;


Future<http.Response> getInstanceApi() async {
 String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var url = Uri.parse('https://equipe2.lp-cloud.tech/v1/projet/template');
    var data = await http.get(url,
        headers: <String, String>{'authorization': basicAuth});
      return data;
}

Future<http.Response> getInstanceApigetOwners() async {
 String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var url = Uri.parse('https://equipe2.lp-cloud.tech/v1/proprietaires');
    var data = await http.get(url,
        headers: <String, String>{'authorization': basicAuth});
      return data;
}

  Future<List<Work>> doQueryFuture(String? type) async {
    var data = await getInstanceApi();
    var _json = jsonDecode(utf8.decode(data.bodyBytes));
    List<Work> _works = [];
    _json.forEach((work){
      if(work['type']== type){
        _works.add(Work.fromJson(work));
      }
    });
    return _works;
  }



  Future<Owner> queryOwners() async {
    var data = await getInstanceApigetOwners();
    var _json = jsonDecode(utf8.decode(data.bodyBytes));
    var currentOwerEstate = Estate.fromJson(_json[0]['proprietes'][0]);
    var currentOwner = Owner.fromJson(_json, currentOwerEstate);
    return currentOwner;
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


List<dynamic> getTravaux()
{
      List<dynamic> works = [
      {
        'urlIcon': 'icons/window.svg',
        'workTitle': 'Isolation des fenêtres',
        'budget': 'Non renseigné',
        'financialAssistance': 'Non renseigné',
        'stepInProgress': 'Trouver un artisan dans la liste',
        'percentageCompleted': 0
      },
      {
        'urlIcon': 'icons/attic.svg',
        'workTitle': 'Isolation des combles',
        'budget': 'Non renseigné',
        'financialAssistance': 'Non renseigné',
        'stepInProgress': 'Trouver un artisan dans la liste',
        'percentageCompleted': 20
      }
    ];

return works;

}


}