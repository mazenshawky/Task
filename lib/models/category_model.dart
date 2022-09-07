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