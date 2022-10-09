class CategoryModel {
  String? image;
  String? title;

  CategoryModel({this.image, this.title});
}
List<CategoryModel>  categoryList =[
  CategoryModel(image: "assets/icons/ic_tree.png",title: "Gardens"),
  CategoryModel(image: "assets/icons/ic_electricity_bill.png",title: "Electricity"),
  CategoryModel(image: "assets/icons/ic_cleaning.png",title: "Cleaning"),
  CategoryModel(image: "assets/icons/ic_plunger.png",title: "Plumbing"),
];

class CategoriesModel {
  Null? message;
  List<Data>? data;

  CategoriesModel({this.message, this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  Null? headerImage;
  List<SubCategories>? subCategories;

  Data({this.id, this.name, this.headerImage, this.subCategories});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    headerImage = json['header_image'];
    if (json['sub_categories'] != null) {
      subCategories = <SubCategories>[];
      json['sub_categories'].forEach((v) {
        subCategories!.add(new SubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['header_image'] = this.headerImage;
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  int? id;
  String? name;
  Null? headerImage;

  SubCategories({this.id, this.name, this.headerImage});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    headerImage = json['header_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['header_image'] = this.headerImage;
    return data;
  }
}