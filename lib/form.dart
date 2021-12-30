import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoinputwidgets112natnicha/year.dart';
import 'branch.dart';
import 'group.dart';

class FormMe extends StatefulWidget {
  const FormMe({Key? key}) : super(key: key);

  @override
  _FormMeState createState() => _FormMeState();
}

class _FormMeState extends State<FormMe> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _number = TextEditingController();

  String? groupbranch;
  String? groupyears;
  List<Year>? years;
  List<Branch>? branchs;

  List<ListItem> types = ListItem.getItem();
  late List<DropdownMenuItem<ListItem>> _dropdownMenuItem;
  late ListItem _selectedTypeItem;

  List checkedGroup = [];
  List<Group>? groups;

  @override
  void initState() {
    super.initState();
    years = Year.getyear();
    branchs = Branch.getbranch();
    groups = Group.getGroup();

    _dropdownMenuItem = createDropdownMenuItem(types);
    _selectedTypeItem = _dropdownMenuItem[0].value!;
  }

  List<DropdownMenuItem<ListItem>> createDropdownMenuItem(
      List<ListItem> types) {
    List<DropdownMenuItem<ListItem>> items = [];

    for (var item in types) {
      items.add(DropdownMenuItem(
        child: Text(item.name!),
        value: item,
      ));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Form(
                    child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child: Text(
                        '-----กรุณากรอกข้อมูล-----',
                        style: GoogleFonts.mitr(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    usernameTextFormField(),
                    passwordTextFormField(),
                    numberTextFormField(),
                    Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child: Text(
                        '-----กรุณาเลือกชั้นปีที่ศึกษา-----',
                        style: GoogleFonts.mitr(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Column(
                      children: createRadioyear(),
                    ),
                    Text('Radio Selected:  $groupyears'),
                    const SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child: Text(
                        '-----กรุณาเลือกหลักสูตรที่ศึกษา-----',
                        style: GoogleFonts.mitr(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Column(
                      children: createRadiobranch(),
                    ),
                    Text('Radio Selected:  $groupbranch'),
                    const SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child: Text(
                        '-----กรุณาเลือกคณะที่ศึกษา-----',
                        style: GoogleFonts.mitr(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    DropdownButton(
                      value: _selectedTypeItem,
                      items: _dropdownMenuItem,
                      onChanged: (ListItem? value) {
                        setState(() {
                          _selectedTypeItem = value!;
                        });
                      },
                    ),
                    Text('Dropdown selected: ${_selectedTypeItem.name}'),
                    Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child: Text(
                        '-----กรุณาเลือกอาหารที่ชอบ-----',
                        style: GoogleFonts.mitr(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Column(
                      children: createCheckboxDrink(),
                    ),
                    Text('Radio Selected:  $checkedGroup'),
                    const SizedBox(height: 16),
                    SubmitButton(),
                  ],
                )),
              ),
            ],
          )),
    );
  }

  Widget usernameTextFormField() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        controller: _username,
        validator: (Value) {
          if (Value!.isEmpty) {
            return "กรุณากรอกชื่อ";
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'ชื่อ',
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
        ),
      ),
    );
  }

  Widget passwordTextFormField() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        controller: _password,
        obscureText: true,
        validator: (Value) {
          if (Value!.isEmpty) {
            return "กรุณากรอกนามสกุล";
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'นามสกุล',
          prefixIcon: Icon(Icons.perm_contact_cal),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
        ),
      ),
    );
  }

  Widget numberTextFormField() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        controller: _number,
        obscureText: true,
        validator: (Value) {
          if (Value!.isEmpty) {
            return "กรุณากรอกรหัสนิสิต";
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'รหัสนิสิต',
          prefixIcon: Icon(Icons.vpn_key_rounded),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
        ),
      ),
    );
  }

  List<Widget> createRadioyear() {
    List<Widget> listYear = [];

    for (var year in years!) {
      listYear.add(
        RadioListTile<dynamic>(
            title: Text(year.year!),
            value: year.yearvalue,
            groupValue: groupyears,
            onChanged: (value) {
              setState(() {
                groupyears = value;
              });
            }),
      );
    }
    return listYear;
  }

  List<Widget> createRadiobranch() {
    List<Widget> listBranch = [];

    for (var branch in branchs!) {
      listBranch.add(
        RadioListTile<dynamic>(
            title: Text(branch.thname!),
            value: branch.branchvalue,
            groupValue: groupbranch,
            onChanged: (value) {
              setState(() {
                groupbranch = value;
              });
            }),
      );
    }
    return listBranch;
  }

  List<Widget> createCheckboxDrink() {
    List<Widget> listDrink = [];
    for (var drink in groups!) {
      listDrink.add(CheckboxListTile(
        value: true,
        title: Text(drink.thname!),
        secondary: Text('${drink.price!.toString()} บาท'),
        onChanged: (value) {
          setState(() {
            drink.checked = value;
          });

          if (value!) {
            checkedGroup.add(drink.thname);
          } else {
            checkedGroup.remove(drink.thname);
          }
        },
      ));
    }
    return listDrink;
  }

  Widget SubmitButton() {
    return Container(
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {}
        },
        child: Text('SUBMIT'),
      ),
    );
  }
}

class ListItem {
  int? value;
  String? name;

  //Contructor
  ListItem(this.value, this.name);

  static getItem() {
    return [
      ListItem(1, 'วิทยาศาสตร์'),
      ListItem(2, 'พยาบาล'),
      ListItem(3, 'วิทยาการสุขภาพและการกีฬา'),
      ListItem(4, 'เทคโนโลยีและการพัฒนาชุมชน'),
      ListItem(5, 'นิติศาสตร์'),
      ListItem(6, 'วิศวกรรมศาสตร์ '),
    ];
  }
}
