class BookingModule{

  final int id;
  final int patientId;
  final int doctorId;
  final String sessionDate;
  final String status;
  final String createAt;

  const BookingModule({
    required this.id,
    required this.doctorId,
    required this.sessionDate,
    required this.patientId,
    required this.createAt,
    required this.status
  });

  factory BookingModule.fromJson(Map<String, dynamic> json)
    => BookingModule(
      id: json['id'], 
      doctorId: json["doctor_id"], 
      sessionDate: json["session_date"], 
      patientId: json["patient_id"], 
      createAt: json["creted_at"], 
      status: json["status"]);

  Map<String, dynamic> toJson()
    => {
      "id": id,
      "doctor_id":doctorId,
      "session_date": sessionDate,
      "patient_id": patientId,
      "created_at": createAt,
      "static": status
    };

}