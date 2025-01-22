
class Receipts {
  final int id;
  final int contractId;
  final int amount;
  final int status;
  final Contract contract;

  Receipts({
    required this.id,
    required this.contractId,
    required this.amount,
    required this.status,
    required this.contract,
  });

  factory Receipts.fromJson(Map<String, dynamic> json) {
    return Receipts(
      id: json['id'],
      contractId: json['contract_id'],
      amount: json['amount'],
      status: json['status'],
      contract: Contract.fromJson(json['contract']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'contract_id': contractId,
      'amount': amount,
      'status': status,
      'contract': contract.toJson(),
    };
  }
}

class Contract {
  final int id;
  final int taskId;
  final String paymentDate;
  final int price;
  final String endDate;
  final int completationStatus;
  final int status;
  final Task task;

  Contract({
    required this.id,
    required this.taskId,
    required this.paymentDate,
    required this.price,
    required this.endDate,
    required this.completationStatus,
    required this.status,
    required this.task,
  });

  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      id: json['id'],
      taskId: json['task_id'],
      paymentDate: json['payment_date'],
      price: json['price'],
      endDate: json['end_date'],
      completationStatus: json['completation_status'],
      status: json['status'],
      task: Task.fromJson(json['task']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'task_id': taskId,
      'payment_date': paymentDate,
      'price': price,
      'end_date': endDate,
      'completation_status': completationStatus,
      'status': status,
      'task': task.toJson(),
    };
  }
}

class Task {
  final int id;
  final int userId;
  final int contractorId;
  final String title;
  final String description;
  final String location;
  final String country;
  final String city;
  final int status;

  Task({
    required this.id,
    required this.userId,
    required this.contractorId,
    required this.title,
    required this.description,
    required this.location,
    required this.country,
    required this.city,
    required this.status,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      userId: json['user_id'],
      contractorId: json['contractor_id'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      country: json['country'],
      city: json['city'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'contractor_id': contractorId,
      'title': title,
      'description': description,
      'location': location,
      'country': country,
      'city': city,
      'status': status,
    };
  }
}
