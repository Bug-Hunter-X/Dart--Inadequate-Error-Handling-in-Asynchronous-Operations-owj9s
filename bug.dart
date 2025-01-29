```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Correctly handle the JSON response
      final jsonData = jsonDecode(response.body);
      // Access and use the data from jsonData
    } else {
      // Handle error responses appropriately, not just print the status code
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions comprehensively
    print('Error: $e'); // Consider logging the error with more context
    rethrow; // Re-throw the exception to be handled by a higher level
  }
}
```