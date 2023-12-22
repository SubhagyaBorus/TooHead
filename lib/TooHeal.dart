class TooHeal {
  String? name;
  String? number;
  String? picture;
  List<Detail>? detail;

  TooHeal({this.name, this.number, this.picture, this.detail});

  TooHeal.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
    picture = json['Picture'];
    if (json['detail'] != null) {
      detail = <Detail>[];
      json['detail'].forEach((v) {
        detail!.add(new Detail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['number'] = this.number;
    data['Picture'] = this.picture;
    if (this.detail != null) {
      data['detail'] = this.detail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Detail {
  String? name;
  String? number;
  String? picture;

  Detail({this.name, this.number, this.picture});

  Detail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
    picture = json['Picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['number'] = this.number;
    data['Picture'] = this.picture;
    return data;
  }
}
