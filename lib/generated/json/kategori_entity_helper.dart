import 'package:beli_yuk/data/response/kategori_entity.dart';

kategoriEntityFromJson(KategoriEntity data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id']?.toString();
  }
  if (json['Kategori'] != null) {
    data.kategori = json['Kategori']?.toString();
  }
  return data;
}

Map<String, dynamic> kategoriEntityToJson(KategoriEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['Kategori'] = entity.kategori;
  return data;
}
