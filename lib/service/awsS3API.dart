import 'dart:typed_data';

import 'package:aws_s3_api/s3-2006-03-01.dart';

class AWSAPI {
  final _accessKey = 'AKIA4AQ3UJNNRJJKDPOL';
  final _secretKey = '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';
  final _bucketName = 'thaivivat-test';
  final _region = 'ap-southeast-2';
  // final _s3Endpoint = 'https://thaivivat-test.s3.ap-southeast-2.amazonaws.com/tvv-registration/';

  Future uploadImageToS3(Uint8List? imageData, String fileName) async {
    final credentials = AwsClientCredentials(
      accessKey: _accessKey,
      secretKey: _secretKey,
    );

    final s3 = S3(
      region: _region,
      credentials: credentials,
    );

    try {
      final result = await s3.putObject(
        bucket: _bucketName,
        key: fileName,
        body: imageData,
        contentType: 'image/png',
      );
      print('Upload success: ${result.eTag}');
    } catch (e) {
      print('Upload failed: $e');
    }
  }
}
