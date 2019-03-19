class DbConstants {
  static const DATABASE_NAME = "MyDatabase.db";
  static const DATABASE_VERSION = 1;

  static const TABLE_PERSON = 'person_table';

  static const KEY_PERSON_ID = '_id';
  static const KEY_PERSON_NAME = 'name';
  static const KEY_PERSON_AGE = 'age';

  static const String CREATE_TABLE_PERSON = '''CREATE TABLE $TABLE_PERSON (
    $KEY_PERSON_ID INTEGER PRIMARY KEY,
    $KEY_PERSON_NAME TEXT NOT NULL,
    $KEY_PERSON_AGE INTEGER NOT NULL
  )''';
}