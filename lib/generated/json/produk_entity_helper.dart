import 'package:beli_yuk/data/response/produk_entity.dart';

produkEntityFromJson(ProdukEntity data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id']?.toString();
  }
  if (json['nama'] != null) {
    data.nama = json['nama']?.toString();
  }
  if (json['harga'] != null) {
    data.harga = json['harga']?.toString();
  }
  if (json['deskripsi'] != null) {
    data.deskripsi = json['deskripsi']?.toString();
  }
  if (json['photoPath'] != null) {
    data.photoPath = json['photoPath']?.toString();
  }
  if (json['idKategori'] != null) {
    data.idKategori = json['idKategori']?.toString();
  }
  return data;
}

Map<String, dynamic> produkEntityToJson(ProdukEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['nama'] = entity.nama;
  data['harga'] = entity.harga;
  data['deskripsi'] = entity.deskripsi;
  data['photoPath'] = entity.photoPath;
  data['idKategori'] = entity.idKategori;
  return data;
}
