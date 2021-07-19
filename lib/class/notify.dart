class Notify {
  final int notifyid;
  final String name;
  final String desc;
  final String image;

  Notify(this.notifyid, this.name, this.desc, this.image);

  factory Notify.fromMap(Map<String, dynamic> json) {
    return Notify(
        json['notifyid'],
        json['name'],
        json['desc'],
        json['image']
    );
  }

  factory Notify.fromJson(Map<String, dynamic> json) {
    return Notify(
        json['notifyid'],
        json['name'],
        json['desc'],
        json['image']
    );
  }
}