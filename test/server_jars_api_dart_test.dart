
import 'dart:io';

import 'package:server_jars_api_dart/server_jars_api_dart.dart';
import 'package:test/test.dart';

void main() {

  group("Group of Tests", () {

    test("Test fetchLatest function", () async {

      var expected = <String, dynamic>{"version": "1.18.2", "file": "vanilla-1.18.2.jar", "md5": "f51272ba187bbe5b52941029af0983dd", "built": 1646057786000, "stability": "stable"};
      var actual = await ServerJars.fetchLatest(type: "vanilla");

      expect(actual, expected);
    },
    );

    test("Test fetchSubTypes function", () async {

      var expected = <String, dynamic>{"bedrock": ["nukkitx", "pocketmine"]};
      var actual = await ServerJars.fetchSubTypes(mainType: 'bedrock');
      expect(actual, expected);
    });

    test("Test downloadJar function", () async {



    });


  });



}
