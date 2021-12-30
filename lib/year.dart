class Year {
  String? year;
  String? yearvalue;

  Year(this.year, this.yearvalue);

  static getyear() {
    return [
      Year('ปี 1', '1'),
      Year('ปี 2', '2'),
      Year('ปี 3', '3'),
      Year('ปี 4', '4'),
    ];
  }
}
