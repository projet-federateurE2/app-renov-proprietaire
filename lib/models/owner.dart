class Estate{
  late String address;
  late String surface;
  late String type;
  late List<String> listIdProjects;
  Estate(this.address, this.surface, this.type, this.listIdProjects);
}
class Owner {
  late String id;
  late String email;
  late String role;
  late String nom;
  late String prenom;
  late String situation;
  late int revenu_fiscal;
  late List<Estate?> proprietes;

  Owner(this.email, this.role, this.nom, this.prenom, this.situation, this.revenu_fiscal, this.proprietes);
}