import 'package:beli_yuk/generated/json/base/json_convert_content.dart';

class LoginEntity with JsonConvert<LoginEntity> {
  int value;
  String message;
  String email;
  String nama;
}
