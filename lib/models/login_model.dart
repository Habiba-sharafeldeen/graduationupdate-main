class LoginModel {
    LoginModel({
        required this.message,
        required this.data,
        required this.statusCode,
    });
    
    final String? message;
    final Data? data;
    final int? statusCode;
    
    factory LoginModel.fromJson(Map<String, dynamic> json){
        return LoginModel(
            message: json["mrssage"],
            data: json["data"] == null ? null : Data.fromJson(json["data"]),
            statusCode: json["status_code"],
        );
    }
}

class Data {
    Data({
        required this.token,
    });
    
    final String? token;
    
    factory Data.fromJson(Map<String, dynamic> json){
        return Data(
            token: json["token"],
            );
            }
}