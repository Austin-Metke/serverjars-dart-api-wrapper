import 'package:server_jars_api_dart/server_jars_api_dart.dart';

void main() {

  var bedrockSubtypes = ServerJars.fetchSubTypes(mainType: 'bedrock');

  print(bedrockSubtypes);

}
