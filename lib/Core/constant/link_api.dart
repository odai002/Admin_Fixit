class AppLink {
  static const String servrer = "http://127.0.0.1:8000/api";

  // ====================================
//Auth

  static const String signin = "$servrer/login";



  static const String getAllUser = "$servrer/getAllUsers";

  static const String getAllReceipt = "$servrer/getAllReceipt";

  static  String Banned(int userId) => "$servrer/ban_UnbanUser/$userId";

  static  String unBanned(int userId) => "$servrer/ban_UnbanUser/$userId";

  static  String rejectReceiptReview(int receiptId) => "$servrer/rejectReceiptReview/$receiptId";

  static  String getReceiptbyId(int receiptId) => "$servrer/getReceiptbyId/$receiptId";

  static  String sendWarning(int receiptId) => "$servrer/addWarningDays/$receiptId";




}