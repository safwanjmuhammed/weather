class Root {
  late String product;
  late String init;
  List<Dataseries?>? dataseries;

  Root({
    required this.product,
    required this.init,
    this.dataseries,
  });

  Root.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    init = json['init'];
    if (json['dataseries'] != null) {
      dataseries = <Dataseries>[];
      json['dataseries'].forEach((v) {
        dataseries!.add(Dataseries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['product'] = product;
    data['init'] = init;
    data['dataseries'] = dataseries != null
        ? dataseries!.map((v) => v?.toJson()).toList()
        : null;
    return data;
  }
}

class Dataseries {
  late int timepoint;
  int? cloudcover;
  int? seeing;
  int? transparency;
  int? liftedindex;
  int? rh2m;
  Wind10m? wind10m;
  int? temp2m;
  String? prectype;

  Dataseries(
      {required this.timepoint,
      this.cloudcover,
      this.seeing,
      this.transparency,
      this.liftedindex,
      this.rh2m,
      this.wind10m,
      this.temp2m,
      this.prectype});

  Dataseries.fromJson(Map<String, dynamic> json) {
    timepoint = json['timepoint'];
    cloudcover = json['cloudcover'];
    seeing = json['seeing'];
    transparency = json['transparency'];
    liftedindex = json['lifted_index'];
    rh2m = json['rh2m'];
    wind10m =
        json['wind10m'] != null ? Wind10m?.fromJson(json['wind10m']) : null;
    temp2m = json['temp2m'];
    prectype = json['prec_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['timepoint'] = timepoint;
    data['cloudcover'] = cloudcover;
    data['seeing'] = seeing;
    data['transparency'] = transparency;
    data['lifted_index'] = liftedindex;
    data['rh2m'] = rh2m;
    data['wind10m'] = wind10m!.toJson();
    data['temp2m'] = temp2m;
    data['prec_type'] = prectype;
    return data;
  }
}

class Wind10m {
  String? direction;
  int? speed;

  Wind10m({this.direction, this.speed});

  Wind10m.fromJson(Map<String, dynamic> json) {
    direction = json['direction'];
    speed = json['speed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['direction'] = direction;
    data['speed'] = speed;
    return data;
  }
}
