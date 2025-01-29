```dart
Future<dynamic> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw HttpException('Failed to load data. Status code: ${response.statusCode}', uri: Uri.parse('https://api.example.com/data'));
    }
  } on SocketException catch (e) {
    throw Exception('No Internet connection. Error: $e');
  } on FormatException catch (e) {
    throw Exception('Invalid JSON format. Error: $e');
  } on HttpException catch (e) {
    rethrow; // Re-throw to be handled at a higher level, adding context if needed.
  } catch (e) {
    throw Exception('An unexpected error occurred: $e');
  }
}
```