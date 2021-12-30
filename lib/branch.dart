class Branch {
  String? thname;
  String? branchvalue;

  Branch(this.thname, this.branchvalue);

  static getbranch() {
    return [
      Branch('วิทยาการคอมพิวเตอร์', 'วิทยาการคอมพิวเตอร์'),
      Branch('เทคโนโลยีสารสนเทศ', 'เทคโนโลยีสารสนเทศ'),
    ];
  }
}
