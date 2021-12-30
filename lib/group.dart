class Group {
  String? thname;
  int? price;
  bool? checked;

  Group(this.thname, this.price, this.checked);

  static getGroup() {
    return [
      Group('ยำปูม้า', 150, false),
      Group('ยำหอยแครง', 80, false),
      Group('ยำกุ้งสด', 80, false),
      Group('ยำกุ้งสุก', 80, false),
    ];
  }
}
