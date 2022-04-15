import 'dart:convert';
import 'dart:io';

abstract class ServerJars {
  static final String _serverjarsURL = "https://serverjars.com/api/";

  static final HttpClient _client = HttpClient();

  static _sendRequest({required urlParts}) async {
    HttpClientRequest request =
        await _client.getUrl(Uri.parse(_serverjarsURL + urlParts));

    HttpClientResponse response = await request.close();

    Map<String, dynamic> jsonData =
        jsonDecode(await response.transform(utf8.decoder).join());

    if (jsonData['status'] == 'error') {
      throw HttpException("An error occurred while fetching from $_serverjarsURL");
    }

    return jsonData['response'];
  }

  static downloadJar(
      {required String type,
      required String version,
      required String output}) async {
    try {
      File file = File(output);
      HttpClientRequest request = await _client
          .getUrl(Uri.parse(_serverjarsURL + "fetchJar/$type/$version"));
      HttpClientResponse response = await request.close();
      await response.pipe(file.openWrite());
      return file;
    } catch (e) {
      print(e);
    }
  }

  static fetchAll({required String type}) {
    return _sendRequest(urlParts: 'fetchAll/$type');
  }

  static fetchTypes() {
    return _sendRequest(urlParts: 'fetchTypes');
  }

  static fetchSubTypes({required String mainType}) {
    return _sendRequest(urlParts: 'fetchTypes/$mainType');
  }

  static fetchLatest({required String type}) {
    return _sendRequest(urlParts: "fetchLatest/$type");
  }
}
