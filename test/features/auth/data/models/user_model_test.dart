// import 'package:flutter_test/flutter_test.dart';
// import 'package:medical_client_side/features/auth/data/models/user_model.dart';
// import 'package:medical_client_side/features/auth/domaine/entites/login_user.dart';

// void main() {
//   group("User Model Test", () {
//     test("Should be a subclass of [LoginUserEntity]", () {
//       // arrange
//       const tUserModel = LoginUserModel(
//         success: true,
//         message: '',
//         id: '',
//         missingFields: [],
//         accessToken: '',
//         refreshToken: '',
//       );
//       // act
//       // assert
//       expect(tUserModel, isA<LoginUserEntity>());
//     });

//     test("Should return a valid model when fromJson is called", () {
//       // arrange
//       const tJson = '''
//         {
//           "success": true,
//           "msg": "sdfsdfsd",
//           "data": {
//             "_id": "sdfsdf",
//             "missingFields": [],
//             "accessToken": "asdasd",
//             "refreshToken": "asdasdasd"
//           }
//         }
//       ''';
//       // act
//       final result = LoginUserModel.fromMap(tJson);
//       // assert
//       expect(result, isA<LoginUserModel>());
//     });

//     test("Should return a valid model when copyWith is called", () {
//       // arrange
//       const tUserModel = LoginUserModel(
//         success: true,
//         message: '',
//         id: '',
//         missingFields: [],
//         accessToken: '',
//         refreshToken: '',
//       );
//       // act
//       final result = tUserModel.copyWith(
//         success: false,
//         message: '',
//         id: '',
//         missingFields: [],
//         accessToken: '',
//         refreshToken: '',
//       );
//       // assert
//       expect(result, isA<LoginUserModel>());
//     });
//   });
// }
