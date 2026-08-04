import 'package:flutter_test/flutter_test.dart';

import 'package:local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp((){
    SharedPreferences.setMockInitialValues({});
  });
  test('save and loads data', () async {
    await LocalStorage.save(key: 'test', value: 'value_test');
    expect(await LocalStorage.load(key: 'test'), 'value_test');
    expect(await LocalStorage.load(key: 'null'), null);
  });

  test('removes data', () async {
    await LocalStorage.save(key: 'test', value: 'value_test');
    expect(await LocalStorage.load(key: 'test'), 'value_test');
    await LocalStorage.remove(key: 'test');
    expect(await LocalStorage.load(key: 'test'), null);
  });

  test('checks data', () async{
    await LocalStorage.save(key: 'test', value: 'value_test');
    expect(await LocalStorage.has(key: 'test'), true);
    expect(await LocalStorage.has(key: 'otherKey'), false);
  });
}
