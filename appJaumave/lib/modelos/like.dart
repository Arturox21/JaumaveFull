class Like {
  String id;
  String asset;
  String title;
  String desc;
  String fullDesc;
  String ubicacion;
  String coordenada;
  String contactos1;

  Like(this.id, this.asset, this.title, this.desc, this.fullDesc,
      this.ubicacion, this.coordenada, this.contactos1);

  factory Like.fromJson(Map<String, dynamic> json) {
    return Like(
        json['id'],
        json['asset'],
        json['title'],
        json['desc'],
        json['fullDesc'],
        json['ubicacion'],
        json['coordenada'],
        json['contactos1']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'asset': asset,
        'title': title,
        'desc': desc,
        'fullDesc': fullDesc,
        'ubicacion': ubicacion,
        'coordenada': coordenada,
        'contactos1': contactos1,
      };
}
