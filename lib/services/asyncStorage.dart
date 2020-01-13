import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

addToAsyncStorage(dataType, key, value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  switch (dataType) {
    case 'string':
      {
        prefs.setString(key, value);
        break;
      }
    case 'double':
      {
        prefs.setDouble(key, value);
        break;
      }
    case 'int':
      {
        prefs.setInt(key, value);
        break;
      }
    case 'boolean':
      {
        prefs.setBool(key, value);
        break;
      }
  }
}

getFromAsyncStorage(dataType, key, [json]) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var data;
  switch (dataType) {
    case 'string':
      {
        data = prefs.getString(key);
        break;
      }
    case 'double':
      {
        data = prefs.getDouble(key);
        break;
      }
    case 'int':
      {
        data = prefs.getInt(key);
        break;
      }
    case 'boolean':
      {
        data = prefs.getBool(key);
        break;
      }
  }
  return json != null ? jsonDecode(data) : data;
}

getAllKeys() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getKeys();
}

removeFromAsyncStorage(key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(key);
}