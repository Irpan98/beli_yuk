import 'package:beli_yuk/generated/json/base/json_convert_content.dart';

class ProdukEntity with JsonConvert<ProdukEntity> {
  String id;
  String nama;
  String harga;
  String deskripsi;
  String photoPath;
  String idKategori;
}
