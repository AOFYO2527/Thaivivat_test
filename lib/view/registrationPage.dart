import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:tvv_test/component/alertDialog.dart';
import 'package:tvv_test/component/myButton.dart';
// import 'package:tvv_test/component/myColors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tvv_test/component/myDropdown.dart';
import 'package:tvv_test/component/myTextField.dart';
import 'package:tvv_test/service/awsS3API.dart';
import 'package:tvv_test/view/myRegistrationPage.dart';

class RegistrationPage extends StatefulWidget {
  static const routeName = '/registration';
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  Uint8List? _imageData;
  TextEditingController name_controller = TextEditingController();
  TextEditingController phone_controller = TextEditingController();
  TextEditingController adrs_number_controller = TextEditingController();
  TextEditingController moo_controller = TextEditingController();
  TextEditingController building_controller = TextEditingController();
  TextEditingController soi_contoller = TextEditingController();
  TextEditingController street_controller = TextEditingController();
  TextEditingController province_controller = TextEditingController();
  TextEditingController county_controller = TextEditingController();
  TextEditingController district_controller = TextEditingController();
  TextEditingController postcode_controller = TextEditingController();
  var provinceSelected;
  var countySelected;
  var districtSelected;

  List provinceList = [
    {'name': 'กรุงเทพมหานคร', 'id': '1'},
  ];

  List countyList = [
    {'name': 'ทวีวัฒนา', 'id': '1'}
  ];

  List districtList = [
    {'name': 'ทวีวัฒนา', 'id': '1'},
    {'name': 'ศาลาธรรมสพน์', 'id': '2'},
  ];

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageData = bytes; // บันทึกข้อมูลภาพเป็น Uint8List
      });
    } else {
      print('No image selected.');
    }
  }

  joinAddress() {
    return '${adrs_number_controller.text} ${moo_controller.text} ${building_controller.text} ${soi_contoller.text} ${street_controller.text} ${district_controller.text} ${county_controller.text} ${province_controller.text} ${postcode_controller.text}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.5,
            child: Image.asset(
              'assets/headerBG.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/logo.png',
                    scale: 2,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.only(left: 46),
                child: const Text(
                  'ใบสมัครประกันภัย',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 7,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ข้อมูลผู้สมัคร',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              width: 225,
                              height: 225,
                              clipBehavior: Clip.hardEdge,
                              decoration: const BoxDecoration(
                                  color: Colors.black12,
                                  shape: BoxShape.circle),
                              child: _imageData == null
                                  ? const Icon(
                                      Icons.person,
                                      size: 200,
                                      color: Colors.black26,
                                    )
                                  : Image.memory(
                                      _imageData!,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.center,
                            child: Mybutton(
                              isOutline: true,
                              title: 'อัพโหลดรูปภาพ',
                              onPress: () {
                                _pickImage();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 80),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('ชื่อ-สกุล'),
                          MyTextField(
                            controller: name_controller,
                            hint: 'ระบุ',
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('ที่อยู่เลขที่'),
                                    MyTextField(
                                      controller: adrs_number_controller,
                                      inputType: TextInputType.number,
                                      inputFormat: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      hint: 'ระบุ',
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('หมู่'),
                                    MyTextField(
                                      controller: moo_controller,
                                      inputType: TextInputType.number,
                                      inputFormat: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      hint: 'ระบุ',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text('ซอย'),
                          MyTextField(
                            controller: soi_contoller,
                            hint: 'ระบุ',
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('จังหวัด'),
                                    SizedBox(
                                      width: double.infinity,
                                      child: MyDropdown(
                                        items: provinceList
                                            .map(
                                              (item) => DropdownMenuItem(
                                                value: item,
                                                child: Text('${item['name']}'),
                                              ),
                                            )
                                            .toList(),
                                        selectedItem: provinceSelected,
                                        onChanged: (value) {
                                          setState(() {
                                            provinceSelected = value;
                                            province_controller.text = provinceSelected['name'];
                                          });
                                        },
                                        hintText: 'กรุณาเลือก',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('เขต/อำเภอ'),
                                    SizedBox(
                                      width: double.infinity,
                                      child: MyDropdown(
                                        items: countyList
                                            .map(
                                              (item) => DropdownMenuItem(
                                                value: item,
                                                child: Text('${item['name']}'),
                                              ),
                                            )
                                            .toList(),
                                        selectedItem: countySelected,
                                        onChanged: (value) {
                                          setState(() {
                                            countySelected = value;
                                            county_controller.text = countySelected['name'];
                                          });
                                        },
                                        hintText: 'กรุณาเลือก',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('เบอร์โทรศัพท์'),
                          MyTextField(
                            controller: phone_controller,
                            inputType: TextInputType.number,
                            inputFormat: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            hint: 'ระบุ',
                          ),
                          const SizedBox(height: 16),
                          const Text('อาคาร/หมู่บ้าน'),
                          MyTextField(
                            controller: building_controller,
                            hint: 'ระบุ',
                          ),
                          const SizedBox(height: 16),
                          const Text('ถนน'),
                          MyTextField(
                            controller: street_controller,
                            hint: 'ระบุ',
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('แขวง/ตำบล'),
                                    SizedBox(
                                      width: double.infinity,
                                      child: MyDropdown(
                                        items: districtList
                                            .map(
                                              (item) => DropdownMenuItem(
                                                value: item,
                                                child: Text('${item['name']}'),
                                              ),
                                            )
                                            .toList(),
                                        selectedItem: districtSelected,
                                        onChanged: (value) {
                                          setState(() {
                                            districtSelected = value;
                                            district_controller.text = districtSelected['name'];
                                            postcode_controller.text = '10170';
                                          });
                                        },
                                        hintText: 'กรุณาเลือก',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('รหัสไปรษณีย์'),
                                    MyTextField(
                                      isReadOnly: true,
                                      controller: postcode_controller,
                                      hint: 'รหัสไปรษณีย์',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 300),
                child: Mybutton(
                  title: 'ส่งใบสมัครประกันภัย',
                  onPress: () async {
                    RAlertDialog().loading(context);
                    await AWSAPI()
                        .uploadImageToS3(_imageData, 'hello_tvv.png')
                        .whenComplete(() => Navigator.pop(context));
                    await RAlertDialog().successToast(
                      context,
                      'ส่งใบสมัครสำเร็จ',
                    );
                    // Navigator.pushNamed(context, '/registration/mydata');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyRegistrationPage(
                          customerName: name_controller.text,
                          customerphone: phone_controller.text,
                          customerAddress: joinAddress(),
                          insuranceType: 'ประกันภัยเปิดปิด ประเภท 1',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
