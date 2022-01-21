class Note {
  int? id;
  int? time;
  String? noteTitle;
  String? noteDescription;

  Note({this.time, this.noteTitle, this.noteDescription});
  Note.withoutInfo();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "time": time,
      "noteTitle": noteTitle,
      "noteDescription": noteDescription
    };
    return map;
  }

  Note.fromObject(Map<String, dynamic> o) {
    id = o["id"]; 
    time = o["time"];
    noteTitle = o["noteTitle"];
    noteDescription = o["noteDescription"];
  }
}
