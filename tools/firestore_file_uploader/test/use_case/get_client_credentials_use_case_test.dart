import 'package:firestore_file_uploader/use_case/get_client_credentials_use_case.dart';
import 'package:test/test.dart';

void main() {
  group(GetClientCredentialsUseCase, () {
    late GetClientCredentialsUseCase getClientCredentialsUseCase;

    setUp(() {
      getClientCredentialsUseCase = GetClientCredentialsUseCase();
    });

    group('execute', () {
      test('description', () async {
        const filePath =
            '../firestore_file_uploader/test/test_data/test_dexquiz.json';

        final result = await getClientCredentialsUseCase.execute(filePath);

        expect(
          result.privateKey,
          '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCtETTugu781qLo\nxZbxCPD3Z4y2o/gE/8P23xY1VEMpRPAOY9qlv+tgqKB8GpW2ZnOMNpaa3c+aq/f3\n0hkGuPCKnKwVdRNpS+8ZrTqtg1DYX1GOyahKFY2SJqvzY4tebpyla47qREXOwApY\nrLu0rKUGZpIjSZRbPCBddYStnceHRdKnVrSJ8OXPo4kHHYCjC8VsgFAGvqxzh+iv\nmCmKBpQ/KqKJtrYsThm8Eo9gSZTU7qgx2MyxZCb/YUUcBGYPoF1iOeoK9idizKeb\nXeZ0709ndiar+6jzz+q3JpMyxwl1nqmnIsMI5UWwoyV2Ssxd+WVJZV+2hecFkpth\nmXZ1q1YBAgMBAAECggEABNT45xrZPM5qTHjtyqt+/M1TkKrZyxvv9vXKCzGf0Whn\nEmPH0D5gPjnfBy//05CfM8A3arn8KJuaB/2B7N3fe2M967hx0wwHcC5Vt8/1gyEA\nKC4pqG3bHsQ9I0W5d6i7b2PmINTIpSnX8Btcf0IdtmTJOjp87aIrXiigjG9eCYEF\n/mTF1p1dg7aMSu7kc5g5THkCYTSYIQv9OuhZGPcKky6/eBnbpJBcNS1h9ZNOmVEh\nQAtlLEa5XZOoQxql5uqHU1i51EOa0B0eAHMMgF8doWtyFP3TIFvieFjfyY9Knajc\nR/RzzyfZ6m+9dzxXa6h3Kfhv2uATGU0zQ/9Nc0FfFQKBgQDn2Gf2ddKAQap6anR+\nAa9pMefDiDMy9MJcBApp5ibrQPAT7H5b93sIMv+JM+IEetU92dSvnIhik5EEMCUV\nkAd7zn9gD5bwKt2KmbnZftlif82IvNbYjys41GD7IXEB7tOQ/LuQt3SWWPlbda5C\nPz+DDMgWvSGilf/7GTbMhfmapQKBgQC/GR4Ry53w/60D6VcBF9cBkyaT8w7xacTG\ntlDaJOvKrhXPPRdeluaeLK+rRd2oifyDv354I4dG4UO8mZ4vgXXwmZANQPOLV/uw\nZGAGvxWuJoCjMIeb3cTLCYOAtkdZamUcQlj1cTZVIVs+TknUuhymZjk0OU4qSj60\nrpR6o4DbLQKBgG+Le8FlQIi6jzXkf/WcA/P9sb8uiUuL3PL+crAurizjil5bmxPO\nRuBUAQPW9XgoTO48Hor7KdcbnlrAeycbq64SVNA3z+vvA7XKblNJJ3eve4i9KjT4\n9Nebvqk0lrVSXXHVVryytyIa3qX1QYjX+0um26GtD0C1IHqD0AyorMWNAoGAcmSX\nwnFQD5cNu9yvj2D0/OVYX5JNLKhy+bzjc2JMn9xMA+1/EslkLeV0FyPQh3ZqaXd1\nPneOIBjy0nBm5+sobamPOM/bulsluDat4Pv7/27e7FE9rEk554y/Yoo69cSh2CPD\nWtG1g4pfM1HsEmKCif2BWsi/CMO++6vSCAPeO9UCgYAsOy+bOziugh+ao3kSuwWr\nRv8or1xJTSKG9GKeNrGSNkHKIudvogxZN+xfGywyv3BYqHSx1ekheaViQ/pUi7BI\nHHDDYyRrOO+VpiM+pMyBq9J17Htd20jPhuwNTYtj/Fi1c7lddwSY/jGoq/RwSwwl\nJr847z5yjvQsmxVyD8tVQQ==\n-----END PRIVATE KEY-----\n',
        );
        expect(
          result.email,
          'firebase-adminsdk-x4zlk@test-dexquiz.iam.gserviceaccount.com',
        );
      });
    });
  });
}
