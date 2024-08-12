import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tvv_test/component/alertDialog.dart';

class MyRegistrationPage extends StatefulWidget {
  static const routeName = '/registration/mydata';
  final customerName;
  final customerAddress;
  final customerphone;
  final insuranceType;
  const MyRegistrationPage({
    super.key,
    this.customerName,
    this.customerAddress,
    this.customerphone,
    this.insuranceType,
  });

  @override
  State<MyRegistrationPage> createState() => _MyRegistrationPageState();
}

class _MyRegistrationPageState extends State<MyRegistrationPage> {
  final List<String> myItem = [
    'แก้ไขใบสมัคร',
    'ยกเลิกใบสมัคร',
  ];
  getActionIcon(text) {
    if (text == 'แก้ไขใบสมัคร') return [Icons.edit, Colors.black38];
    if (text == 'ยกเลิกใบสมัคร') return [Icons.close, Colors.red];
  }

  actionTable({required action}) async {
    if (action == 'แก้ไขใบสมัคร') {
      Navigator.pushNamed(context, '/registration');
    }
    if (action == 'ยกเลิกใบสมัคร') {
      await RAlertDialog().successToast(context, 'ยกเลิกใบสมัครสำเร็จ');
      Navigator.pushNamed(context, '/registration');
    }
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
                  'ข้อมูลใบสมัครประกันภัยของคุณ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 400,
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
                              child: const Icon(
                                Icons.person,
                                size: 200,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 80),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('ชื่อ-สกุล'),
                          Text(
                            '${widget.customerName}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text('เบอร์โทรศัพท์'),
                          Text(
                            '${widget.customerphone}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text('ที่อยู่'),
                          Text(
                            '${widget.customerAddress}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text('ประเภทประกันภัยที่สมัคร'),
                          Text(
                            '${widget.insuranceType ?? 'ไม่พบข้อมูล'}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                            width: 36,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                customButton: Icon(Icons.more_horiz),
                                items: myItem
                                    .map((String item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Row(
                                            children: [
                                              Icon(
                                                getActionIcon(item)[0],
                                                color: getActionIcon(item)[1],
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                item,
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) async {
                                  await actionTable(action: value);
                                },
                                iconStyleData: const IconStyleData(
                                  icon: Icon(Icons.keyboard_arrow_down),
                                ),
                                buttonStyleData: ButtonStyleData(
                                  height: 45,
                                  // width: 180,
                                  padding: const EdgeInsets.only(left: 14, right: 14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  maxHeight: 300,
                                  width: 200,
                                  elevation: 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
