
class LoginRespone{
  int code;
  bool success;
  bool verify;
  dynamic data;

  LoginRespone.fromJson(Map<String, dynamic> json){
    code = json['code'];
    success = json['success'];
    verify = json['verify'];
    data = json['data'];
  }
}

class Message{
  String message;
Message.fromJson(Map<String, dynamic> json){
  message = json['message'];
}
}

 class DataRespone{
   String token;
   DataRespone.fromJson(Map<String, dynamic> json){
     token = json['token'].toString();
   }
 }