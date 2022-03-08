class Estate{
  late String addresse;
  late int surface;
  late String type;
  late List<String>? listIdProjects;
  Estate(this.addresse, this.surface, this.type, this.listIdProjects);

    factory Estate.fromJson(dynamic _json) {
    return Estate(_json[0]['proprietes'][0]['adresse'] , _json[0]['proprietes'][0]['surface'] , _json[0]['proprietes'][0]['type'] , _json[0]['proprietes'][0]['idProject']);
  }

}
class Owner {
  late String id;
  late String email;
  late String role;
  late String nom;
  late String prenom;
  late String situation;
  late int revenu_fiscal;
  late Estate proprietes;

  Owner(this.email, this.role, this.nom, this.prenom, this.situation, this.revenu_fiscal, this.proprietes);


  factory Owner.fromJson(dynamic _json, Estate propri) {
    return Owner(_json[0]['email'], _json[0]['role'],_json[0]['nom'],_json[0]['prenom'],_json[0]['situation'], _json[0]['revenu_fiscal'], propri);
  }

}