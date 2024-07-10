class ShoeSizeModel {
  final String size;
  bool isSelected;
  ShoeSizeModel({
    this.isSelected = false,
    required this.size});
}

List<ShoeSizeModel> shoeSizeList = [
  ShoeSizeModel(size: "38"),
  ShoeSizeModel(size: "39"),
  ShoeSizeModel(size: "40"),
  ShoeSizeModel(size: "41"),
  ShoeSizeModel(size: "42"),
  ShoeSizeModel(size: "43"),
];
