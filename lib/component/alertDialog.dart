import 'package:flutter/material.dart';
import 'package:tvv_test/component/myButton.dart';


class RAlertDialog {
  
  Future loading(
    BuildContext context,
  ) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          buttonPadding: EdgeInsets.zero,
          actions: [],
        );
      },
    );
  }

  Future successToast(
    BuildContext context,
    String? text,
  ) async {
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          title: Icon(
            size: 60,
            Icons.check_circle,
            color: Colors.green.shade600,
          ),
          content: Center(
              child: Text(
            '$text',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          )),
          // contentPadding: EdgeInsets.all(12),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Mybutton(
              isOutline: true,
              bgcolor: Colors.black26,
              fgcolor: Colors.black87,
              title: 'ปิด',
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future errorToast(
    BuildContext context,
    String? text,
  ) async {
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          title: Icon(
            size: 60,
            Icons.error_outline,
            color: Colors.orange,
          ),
          content: Center(
              child: Text(
            '$text',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          )),
          // contentPadding: EdgeInsets.all(12),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Mybutton(
              isOutline: true,
              bgcolor: Colors.black26,
              fgcolor: Colors.black87,
              title: 'ปิด',
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
