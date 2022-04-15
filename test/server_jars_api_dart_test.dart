import 'dart:convert';
import 'dart:io';

import 'package:server_jars_api_dart/server_jars_api_dart.dart';
import 'package:test/test.dart';

void main() {
  group("Group of Tests", () {
    test(
      "Test fetchLatest function",
          () async {
        var expected = <String, dynamic>{
          "version": "1.18.2",
          "file": "vanilla-1.18.2.jar",
          "md5": "f51272ba187bbe5b52941029af0983dd",
          "built": 1646057786000,
          "stability": "stable"
        };
        var actual = await ServerJars.fetchLatest(type: "vanilla");

        expect(actual, expected);
      },
    );

    test("Test fetchSubTypes function", () async {
      var expected = <String, dynamic>{
        "bedrock": ["nukkitx", "pocketmine"]
      };
      var actual = await ServerJars.fetchSubTypes(mainType: 'bedrock');
      expect(actual, expected);
    });

    test("Test downloadJar function", () async {
      File actualFile = await ServerJars.downloadJar(
          type: 'purpur', version: '1.18.1', output: './Test.jar');

      HttpClient client = HttpClient();

      File expectedFile = File("test1.jar");

      HttpClientRequest request = await client.getUrl(
          Uri.parse("https://serverjars.com/api/fetchJar/purpur/1.18.1"));
      HttpClientResponse response = await request.close();
      await response.pipe(expectedFile.openWrite());

      var actual = base64Encode(actualFile.readAsBytesSync());
      var expected = base64Encode(expectedFile.readAsBytesSync());
      expect(actual, expected);

      actualFile.deleteSync();
      expectedFile.deleteSync();
    });

    test("Test fetchTypes function", () async {
      var actual = await ServerJars.fetchTypes();
      var expected = {
        "bedrock": ["nukkitx", "pocketmine"],
        "modded": ["mohist"],
        "proxies": ["bungeecord", "velocity", "waterfall"],
        "servers": ["bukkit", "paper", "spigot", "purpur", "tuinity"],
        "vanilla": ["snapshot", "vanilla"]
      };

      expect(actual, expected);
    });

    test("Test fetchSubTypes function", () async {
      var actual = await ServerJars.fetchSubTypes(mainType: 'bedrock');
      var expected = {"bedrock": ["nukkitx", "pocketmine"]};

      expect(actual, expected);
    });
  });
}
