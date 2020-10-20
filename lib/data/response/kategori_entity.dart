import 'package:beli_yuk/generated/json/base/json_convert_content.dart';
import 'package:beli_yuk/generated/json/base/json_field.dart';

class KategoriEntity with JsonConvert<KategoriEntity> {
  String id;
  @JSONField(name: "Kategori")
  String kategori;
}
