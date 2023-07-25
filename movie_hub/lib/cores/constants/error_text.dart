const String noInternetConnectionText = 'Internet not connection found! \n '
    'Please check your internet connection and try again.';

void checkForError(Map data) {
  if (data['status'] == false || data['status'] == 'false') {
    final String? message = data['message'] ?? data['msg'];

    if (message == null) {
      final Map<String, dynamic> errorMap = Map.from(data['error']);

      throw errorMap.values.join('\n');
    } else {
      throw message;
    }
  }

  if (data['data'] == null) {
    throw 'No data Found!';
  }
}
