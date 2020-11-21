class Todo{
  String title;
  String note;

  Todo({this.title,this.note});

  Todo.fromJson(map, dynamic json) {
    title = json["title"];
    note = json["note"];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> json = {};
    json[title] = title;
    json[note] = note;
    return json;
  }
}
