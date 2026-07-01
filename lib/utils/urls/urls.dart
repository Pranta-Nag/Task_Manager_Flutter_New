class Urls {

  static String baseUrl = 'https://task-manager-api.ostad.live/api/v1';
  static String signUpUrl = '$baseUrl/Registration';
  static String logInUrl = '$baseUrl/Login';
  static String getTaskCountURL = '$baseUrl/taskStatusCount';
  static String createTaskURL = '$baseUrl/createTask';
  static String getTaskStatusURL(String status) => '$baseUrl/listTaskByStatus/$status';
  static String deleteTaskURL(String id) => '$baseUrl/deleteTask/$id';

}