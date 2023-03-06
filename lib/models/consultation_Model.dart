class consultation_Model {
  final int id;
  final dynamic title;
  final dynamic content;
  final dynamic reply;
  final dynamic client_bmi;
  final dynamic client_fname;
  final dynamic client_id;

  consultation_Model({
    required this.id,
    required this.title,
    required this.content,
    required this.reply,
    required this.client_bmi,
    required this.client_fname,
    required this.client_id,
  });

  factory consultation_Model.fromJson(Map<String, dynamic> json) {
    return consultation_Model(
      id: json['id'] as int,
      title: json['title'] as dynamic,
      content: json['content'] as dynamic,
      reply: json['reply'] as dynamic,
      client_bmi: json['client_bmi'] as dynamic,
      client_fname: json['client_fname'] as dynamic,
      client_id: json['client_id'] as dynamic,
    );
  }
}
