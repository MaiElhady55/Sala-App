class Data {
  String? about;
  String? terms;

  Data({this.about, this.terms});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        about: json['about'] as String?,
        terms: json['terms'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'about': about,
        'terms': terms,
      };
}
