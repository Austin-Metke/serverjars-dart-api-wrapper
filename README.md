<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# ServerJars-API
The unofficial Dart API for ServerJars

**Code Examples:**

**Fetching the latest jar:**
```dart
var latest = await ServerJars.fetchLatest(type: "vanilla");
print(latest);
```

**Fetching all the Jars:**
```dart
var allJars = await ServerJars.fetchAll(type: "paper");
print(allJars);
```

**Fetching types:**
```dart
var types = await ServerJars.fetchTypes();
print(types);
```

**Fetching subtypes:
```dart
var subtypes = await Serverjars.fetchSubtypes(mainType: 'bedrock');
print(subtypes);
```

**Downloading Jars:**
```dart
await ServerJars.downloadJuar(type: 'purpur', version: '1.13.2', output:'./purpur-1.13.2.jar');
```
