
class Work {
  late String id;
  late String title;
  late String titleDesc;
  late String urlImage;
  late String txt1;
  late String txt2;

  Work(this.id, this.title, this.titleDesc, this.urlImage, this.txt1, this.txt2);

 factory Work.fromJson(dynamic work) {
    return Work(work['_id'], work['travaux'][0]['nom'], work['pitch'], work['img_url_projet'], work['travaux'][0]['conseils'][0]['texte'], work['travaux'][0]['conseils'][1]['texte']);
  }

}
