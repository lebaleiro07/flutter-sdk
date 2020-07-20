abstract class BaseModel<T> {

  const BaseModel();

  Map<String, dynamic> toJSON();
  BaseModel.fromJson(Map<String, dynamic> data);
}