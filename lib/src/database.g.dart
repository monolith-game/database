// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UserAccountsTable extends UserAccounts
    with TableInfo<$UserAccountsTable, UserAccount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserAccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordHashMeta =
      const VerificationMeta('passwordHash');
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
      'password_hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, username, passwordHash];
  @override
  String get aliasedName => _alias ?? 'user_accounts';
  @override
  String get actualTableName => 'user_accounts';
  @override
  VerificationContext validateIntegrity(Insertable<UserAccount> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password_hash')) {
      context.handle(
          _passwordHashMeta,
          passwordHash.isAcceptableOrUnknown(
              data['password_hash']!, _passwordHashMeta));
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserAccount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserAccount(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      passwordHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password_hash'])!,
    );
  }

  @override
  $UserAccountsTable createAlias(String alias) {
    return $UserAccountsTable(attachedDatabase, alias);
  }
}

class UserAccount extends DataClass implements Insertable<UserAccount> {
  /// The primary key.
  final int id;

  /// The username of this account.
  final String username;

  /// THe password hash.
  final String passwordHash;
  const UserAccount(
      {required this.id, required this.username, required this.passwordHash});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['password_hash'] = Variable<String>(passwordHash);
    return map;
  }

  UserAccountsCompanion toCompanion(bool nullToAbsent) {
    return UserAccountsCompanion(
      id: Value(id),
      username: Value(username),
      passwordHash: Value(passwordHash),
    );
  }

  factory UserAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserAccount(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'passwordHash': serializer.toJson<String>(passwordHash),
    };
  }

  UserAccount copyWith({int? id, String? username, String? passwordHash}) =>
      UserAccount(
        id: id ?? this.id,
        username: username ?? this.username,
        passwordHash: passwordHash ?? this.passwordHash,
      );
  @override
  String toString() {
    return (StringBuffer('UserAccount(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('passwordHash: $passwordHash')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, passwordHash);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserAccount &&
          other.id == this.id &&
          other.username == this.username &&
          other.passwordHash == this.passwordHash);
}

class UserAccountsCompanion extends UpdateCompanion<UserAccount> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> passwordHash;
  const UserAccountsCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.passwordHash = const Value.absent(),
  });
  UserAccountsCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String passwordHash,
  })  : username = Value(username),
        passwordHash = Value(passwordHash);
  static Insertable<UserAccount> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? passwordHash,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (passwordHash != null) 'password_hash': passwordHash,
    });
  }

  UserAccountsCompanion copyWith(
      {Value<int>? id, Value<String>? username, Value<String>? passwordHash}) {
    return UserAccountsCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      passwordHash: passwordHash ?? this.passwordHash,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserAccountsCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('passwordHash: $passwordHash')
          ..write(')'))
        .toString();
  }
}

class $CharactersTable extends Characters
    with TableInfo<$CharactersTable, Character> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userAccountIdMeta =
      const VerificationMeta('userAccountId');
  @override
  late final GeneratedColumn<int> userAccountId = GeneratedColumn<int>(
      'user_account_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES user_accounts (id) ON DELETE CASCADE'));
  static const VerificationMeta _isAdminMeta =
      const VerificationMeta('isAdmin');
  @override
  late final GeneratedColumn<bool> isAdmin = GeneratedColumn<bool>(
      'is_admin', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_admin" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, name, userAccountId, isAdmin];
  @override
  String get aliasedName => _alias ?? 'characters';
  @override
  String get actualTableName => 'characters';
  @override
  VerificationContext validateIntegrity(Insertable<Character> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('user_account_id')) {
      context.handle(
          _userAccountIdMeta,
          userAccountId.isAcceptableOrUnknown(
              data['user_account_id']!, _userAccountIdMeta));
    } else if (isInserting) {
      context.missing(_userAccountIdMeta);
    }
    if (data.containsKey('is_admin')) {
      context.handle(_isAdminMeta,
          isAdmin.isAcceptableOrUnknown(data['is_admin']!, _isAdminMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Character map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Character(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      userAccountId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_account_id'])!,
      isAdmin: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_admin'])!,
    );
  }

  @override
  $CharactersTable createAlias(String alias) {
    return $CharactersTable(attachedDatabase, alias);
  }
}

class Character extends DataClass implements Insertable<Character> {
  /// The primary key.
  final int id;

  /// The name of something.
  final String name;

  /// The ID of the user account which this character belongs to.
  final int userAccountId;

  /// Whether or not this character is an admin.
  final bool isAdmin;
  const Character(
      {required this.id,
      required this.name,
      required this.userAccountId,
      required this.isAdmin});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['user_account_id'] = Variable<int>(userAccountId);
    map['is_admin'] = Variable<bool>(isAdmin);
    return map;
  }

  CharactersCompanion toCompanion(bool nullToAbsent) {
    return CharactersCompanion(
      id: Value(id),
      name: Value(name),
      userAccountId: Value(userAccountId),
      isAdmin: Value(isAdmin),
    );
  }

  factory Character.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Character(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      userAccountId: serializer.fromJson<int>(json['userAccountId']),
      isAdmin: serializer.fromJson<bool>(json['isAdmin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'userAccountId': serializer.toJson<int>(userAccountId),
      'isAdmin': serializer.toJson<bool>(isAdmin),
    };
  }

  Character copyWith(
          {int? id, String? name, int? userAccountId, bool? isAdmin}) =>
      Character(
        id: id ?? this.id,
        name: name ?? this.name,
        userAccountId: userAccountId ?? this.userAccountId,
        isAdmin: isAdmin ?? this.isAdmin,
      );
  @override
  String toString() {
    return (StringBuffer('Character(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userAccountId: $userAccountId, ')
          ..write('isAdmin: $isAdmin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, userAccountId, isAdmin);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Character &&
          other.id == this.id &&
          other.name == this.name &&
          other.userAccountId == this.userAccountId &&
          other.isAdmin == this.isAdmin);
}

class CharactersCompanion extends UpdateCompanion<Character> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> userAccountId;
  final Value<bool> isAdmin;
  const CharactersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.userAccountId = const Value.absent(),
    this.isAdmin = const Value.absent(),
  });
  CharactersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int userAccountId,
    this.isAdmin = const Value.absent(),
  })  : name = Value(name),
        userAccountId = Value(userAccountId);
  static Insertable<Character> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? userAccountId,
    Expression<bool>? isAdmin,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (userAccountId != null) 'user_account_id': userAccountId,
      if (isAdmin != null) 'is_admin': isAdmin,
    });
  }

  CharactersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? userAccountId,
      Value<bool>? isAdmin}) {
    return CharactersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      userAccountId: userAccountId ?? this.userAccountId,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (userAccountId.present) {
      map['user_account_id'] = Variable<int>(userAccountId.value);
    }
    if (isAdmin.present) {
      map['is_admin'] = Variable<bool>(isAdmin.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharactersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userAccountId: $userAccountId, ')
          ..write('isAdmin: $isAdmin')
          ..write(')'))
        .toString();
  }
}

class $SoundsTable extends Sounds with TableInfo<$SoundsTable, Sound> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SoundsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
      'path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _gainMeta = const VerificationMeta('gain');
  @override
  late final GeneratedColumn<double> gain = GeneratedColumn<double>(
      'gain', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.7));
  @override
  List<GeneratedColumn> get $columns => [id, path, gain];
  @override
  String get aliasedName => _alias ?? 'sounds';
  @override
  String get actualTableName => 'sounds';
  @override
  VerificationContext validateIntegrity(Insertable<Sound> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('gain')) {
      context.handle(
          _gainMeta, gain.isAcceptableOrUnknown(data['gain']!, _gainMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Sound map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Sound(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path'])!,
      gain: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}gain'])!,
    );
  }

  @override
  $SoundsTable createAlias(String alias) {
    return $SoundsTable(attachedDatabase, alias);
  }
}

class Sound extends DataClass implements Insertable<Sound> {
  /// The primary key.
  final int id;

  /// The path to the sound.
  final String path;

  /// The gain of the sound.
  final double gain;
  const Sound({required this.id, required this.path, required this.gain});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['path'] = Variable<String>(path);
    map['gain'] = Variable<double>(gain);
    return map;
  }

  SoundsCompanion toCompanion(bool nullToAbsent) {
    return SoundsCompanion(
      id: Value(id),
      path: Value(path),
      gain: Value(gain),
    );
  }

  factory Sound.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Sound(
      id: serializer.fromJson<int>(json['id']),
      path: serializer.fromJson<String>(json['path']),
      gain: serializer.fromJson<double>(json['gain']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'path': serializer.toJson<String>(path),
      'gain': serializer.toJson<double>(gain),
    };
  }

  Sound copyWith({int? id, String? path, double? gain}) => Sound(
        id: id ?? this.id,
        path: path ?? this.path,
        gain: gain ?? this.gain,
      );
  @override
  String toString() {
    return (StringBuffer('Sound(')
          ..write('id: $id, ')
          ..write('path: $path, ')
          ..write('gain: $gain')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, path, gain);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Sound &&
          other.id == this.id &&
          other.path == this.path &&
          other.gain == this.gain);
}

class SoundsCompanion extends UpdateCompanion<Sound> {
  final Value<int> id;
  final Value<String> path;
  final Value<double> gain;
  const SoundsCompanion({
    this.id = const Value.absent(),
    this.path = const Value.absent(),
    this.gain = const Value.absent(),
  });
  SoundsCompanion.insert({
    this.id = const Value.absent(),
    required String path,
    this.gain = const Value.absent(),
  }) : path = Value(path);
  static Insertable<Sound> custom({
    Expression<int>? id,
    Expression<String>? path,
    Expression<double>? gain,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (path != null) 'path': path,
      if (gain != null) 'gain': gain,
    });
  }

  SoundsCompanion copyWith(
      {Value<int>? id, Value<String>? path, Value<double>? gain}) {
    return SoundsCompanion(
      id: id ?? this.id,
      path: path ?? this.path,
      gain: gain ?? this.gain,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (gain.present) {
      map['gain'] = Variable<double>(gain.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SoundsCompanion(')
          ..write('id: $id, ')
          ..write('path: $path, ')
          ..write('gain: $gain')
          ..write(')'))
        .toString();
  }
}

abstract class _$MonolithDatabase extends GeneratedDatabase {
  _$MonolithDatabase(QueryExecutor e) : super(e);
  late final $UserAccountsTable userAccounts = $UserAccountsTable(this);
  late final $CharactersTable characters = $CharactersTable(this);
  late final $SoundsTable sounds = $SoundsTable(this);
  late final UserAccountsDao userAccountsDao =
      UserAccountsDao(this as MonolithDatabase);
  late final CharactersDao charactersDao =
      CharactersDao(this as MonolithDatabase);
  late final SoundsDao soundsDao = SoundsDao(this as MonolithDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userAccounts, characters, sounds];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('user_accounts',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('characters', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}
