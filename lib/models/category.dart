

class Category{
  String? name;
  String? imageUrl;
  String? catId;

  Category(this.name, this.imageUrl,this.catId);
  Category.fromMap(Map<String,dynamic>map){
    name = map['name'];
    imageUrl = map['imageUrl'];


  }

  toMap(){
    return {
      'name' : name,
      'imageUrl' : imageUrl,

    };
  }
}