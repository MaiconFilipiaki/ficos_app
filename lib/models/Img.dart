
class Img {

  int id;
  String nameImg;

  Img({
    this.id,
    this.nameImg,
  });

  factory Img.fromJson(Map doc) {
    return Img(
        id: doc['id'],
        nameImg: doc['nameImg'],
    );
  }

}
