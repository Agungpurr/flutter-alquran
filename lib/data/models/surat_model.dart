import 'dart:convert';

class SuratModel {
  SuratModel({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
  });

  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final TempatTurun tempatTurun;
  final String arti;
  final String deskripsi;
  final String audio;

  // Helper function untuk convert ke int
  static int _toInt(dynamic value) {
    if (value is int) return value;
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  factory SuratModel.fromRawJson(String str) =>
      SuratModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SuratModel.fromJson(Map<String, dynamic> json) => SuratModel(
        nomor: _toInt(json["nomor"]),
        nama: json["nama"]?.toString() ?? '',
        namaLatin: json["nama_latin"]?.toString() ?? '',
        jumlahAyat: _toInt(json["jumlah_ayat"]),
        tempatTurun:
            tempatTurunValues.map[json["tempat_turun"]] ?? TempatTurun.mekah,
        arti: json["arti"]?.toString() ?? '',
        deskripsi: json["deskripsi"]?.toString() ?? '',
        audio: json["audio"]?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurunValues.reverse[tempatTurun],
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
      };
}

enum TempatTurun { mekah, madinah }

final tempatTurunValues = EnumValues({
  "madinah": TempatTurun.madinah,
  "mekah": TempatTurun.mekah,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
