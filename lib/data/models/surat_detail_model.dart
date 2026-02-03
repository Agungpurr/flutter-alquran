import 'dart:convert';

class SuratDetailModel {
  SuratDetailModel({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audio,
    this.status,
    this.ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });

  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;
  bool? status;
  List<Ayat>? ayat;
  SuratSelanjutnya? suratSelanjutnya;
  dynamic suratSebelumnya;

  // Helper function untuk convert ke int
  static int? _toInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }

  factory SuratDetailModel.fromRawJson(String str) =>
      SuratDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SuratDetailModel.fromJson(Map<String, dynamic> json) =>
      SuratDetailModel(
        nomor: _toInt(json["nomor"]),
        nama: json["nama"]?.toString(),
        namaLatin: json["nama_latin"]?.toString(),
        jumlahAyat: _toInt(json["jumlah_ayat"]),
        tempatTurun: json["tempat_turun"]?.toString(),
        arti: json["arti"]?.toString(),
        deskripsi: json["deskripsi"]?.toString(),
        audio: json["audio"]?.toString(),
        status: json["status"] is bool
            ? json["status"]
            : json["status"]?.toString().toLowerCase() == 'true',
        ayat: json["ayat"] == null
            ? []
            : List<Ayat>.from(json["ayat"]!.map((x) => Ayat.fromJson(x))),
        suratSelanjutnya: json["surat_selanjutnya"] == null
            ? null
            : SuratSelanjutnya.fromJson(json["surat_selanjutnya"]),
        suratSebelumnya: json["surat_sebelumnya"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
        "status": status,
        "ayat": ayat == null
            ? []
            : List<dynamic>.from(ayat!.map((x) => x.toJson())),
        "surat_selanjutnya": suratSelanjutnya?.toJson(),
        "surat_sebelumnya": suratSebelumnya,
      };
}

class Ayat {
  Ayat({
    this.id,
    this.surah,
    this.nomor,
    this.ar,
    this.tr,
    this.idn,
  });

  int? id;
  int? surah;
  int? nomor;
  String? ar;
  String? tr;
  String? idn;

  // Helper function untuk convert ke int
  static int? _toInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }

  factory Ayat.fromRawJson(String str) => Ayat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        id: _toInt(json["id"]),
        surah: _toInt(json["surah"]),
        nomor: _toInt(json["nomor"]),
        ar: json["ar"]?.toString(),
        tr: json["tr"]?.toString(),
        idn: json["idn"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "surah": surah,
        "nomor": nomor,
        "ar": ar,
        "tr": tr,
        "idn": idn,
      };
}

class SuratSelanjutnya {
  SuratSelanjutnya({
    this.id,
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audio,
  });

  int? id;
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;

  // Helper function untuk convert ke int
  static int? _toInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }

  factory SuratSelanjutnya.fromRawJson(String str) =>
      SuratSelanjutnya.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SuratSelanjutnya.fromJson(Map<String, dynamic> json) =>
      SuratSelanjutnya(
        id: _toInt(json["id"]),
        nomor: _toInt(json["nomor"]),
        nama: json["nama"]?.toString(),
        namaLatin: json["nama_latin"]?.toString(),
        jumlahAyat: _toInt(json["jumlah_ayat"]),
        tempatTurun: json["tempat_turun"]?.toString(),
        arti: json["arti"]?.toString(),
        deskripsi: json["deskripsi"]?.toString(),
        audio: json["audio"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
      };
}
