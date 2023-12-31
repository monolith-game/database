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
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: uuidGenerator.v4);
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
  List<GeneratedColumn> get $columns => [id, uuid, username, passwordHash];
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
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
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
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
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

  /// A unique UUID to remove the reliance on sequential IDs in the API.
  final String uuid;

  /// The username of this account.
  final String username;

  /// THe password hash.
  final String passwordHash;
  const UserAccount(
      {required this.id,
      required this.uuid,
      required this.username,
      required this.passwordHash});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['username'] = Variable<String>(username);
    map['password_hash'] = Variable<String>(passwordHash);
    return map;
  }

  UserAccountsCompanion toCompanion(bool nullToAbsent) {
    return UserAccountsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      username: Value(username),
      passwordHash: Value(passwordHash),
    );
  }

  factory UserAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserAccount(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      username: serializer.fromJson<String>(json['username']),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'username': serializer.toJson<String>(username),
      'passwordHash': serializer.toJson<String>(passwordHash),
    };
  }

  UserAccount copyWith(
          {int? id, String? uuid, String? username, String? passwordHash}) =>
      UserAccount(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        username: username ?? this.username,
        passwordHash: passwordHash ?? this.passwordHash,
      );
  @override
  String toString() {
    return (StringBuffer('UserAccount(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('username: $username, ')
          ..write('passwordHash: $passwordHash')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, username, passwordHash);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserAccount &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.username == this.username &&
          other.passwordHash == this.passwordHash);
}

class UserAccountsCompanion extends UpdateCompanion<UserAccount> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> username;
  final Value<String> passwordHash;
  const UserAccountsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.username = const Value.absent(),
    this.passwordHash = const Value.absent(),
  });
  UserAccountsCompanion.insert({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    required String username,
    required String passwordHash,
  })  : username = Value(username),
        passwordHash = Value(passwordHash);
  static Insertable<UserAccount> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? username,
    Expression<String>? passwordHash,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (username != null) 'username': username,
      if (passwordHash != null) 'password_hash': passwordHash,
    });
  }

  UserAccountsCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? username,
      Value<String>? passwordHash}) {
    return UserAccountsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
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
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
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
          ..write('uuid: $uuid, ')
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
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: uuidGenerator.v4);
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
  List<GeneratedColumn> get $columns =>
      [id, name, uuid, userAccountId, isAdmin];
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
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
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
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
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

  /// A unique UUID to remove the reliance on sequential IDs in the API.
  final String uuid;

  /// The ID of the user account which this character belongs to.
  final int userAccountId;

  /// Whether or not this character is an admin.
  final bool isAdmin;
  const Character(
      {required this.id,
      required this.name,
      required this.uuid,
      required this.userAccountId,
      required this.isAdmin});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['uuid'] = Variable<String>(uuid);
    map['user_account_id'] = Variable<int>(userAccountId);
    map['is_admin'] = Variable<bool>(isAdmin);
    return map;
  }

  CharactersCompanion toCompanion(bool nullToAbsent) {
    return CharactersCompanion(
      id: Value(id),
      name: Value(name),
      uuid: Value(uuid),
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
      uuid: serializer.fromJson<String>(json['uuid']),
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
      'uuid': serializer.toJson<String>(uuid),
      'userAccountId': serializer.toJson<int>(userAccountId),
      'isAdmin': serializer.toJson<bool>(isAdmin),
    };
  }

  Character copyWith(
          {int? id,
          String? name,
          String? uuid,
          int? userAccountId,
          bool? isAdmin}) =>
      Character(
        id: id ?? this.id,
        name: name ?? this.name,
        uuid: uuid ?? this.uuid,
        userAccountId: userAccountId ?? this.userAccountId,
        isAdmin: isAdmin ?? this.isAdmin,
      );
  @override
  String toString() {
    return (StringBuffer('Character(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('uuid: $uuid, ')
          ..write('userAccountId: $userAccountId, ')
          ..write('isAdmin: $isAdmin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, uuid, userAccountId, isAdmin);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Character &&
          other.id == this.id &&
          other.name == this.name &&
          other.uuid == this.uuid &&
          other.userAccountId == this.userAccountId &&
          other.isAdmin == this.isAdmin);
}

class CharactersCompanion extends UpdateCompanion<Character> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> uuid;
  final Value<int> userAccountId;
  final Value<bool> isAdmin;
  const CharactersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.uuid = const Value.absent(),
    this.userAccountId = const Value.absent(),
    this.isAdmin = const Value.absent(),
  });
  CharactersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.uuid = const Value.absent(),
    required int userAccountId,
    this.isAdmin = const Value.absent(),
  })  : name = Value(name),
        userAccountId = Value(userAccountId);
  static Insertable<Character> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? uuid,
    Expression<int>? userAccountId,
    Expression<bool>? isAdmin,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (uuid != null) 'uuid': uuid,
      if (userAccountId != null) 'user_account_id': userAccountId,
      if (isAdmin != null) 'is_admin': isAdmin,
    });
  }

  CharactersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? uuid,
      Value<int>? userAccountId,
      Value<bool>? isAdmin}) {
    return CharactersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      uuid: uuid ?? this.uuid,
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
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
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
          ..write('uuid: $uuid, ')
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
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: uuidGenerator.v4);
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
  List<GeneratedColumn> get $columns => [id, uuid, path, gain];
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
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
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
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
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

  /// A unique UUID to remove the reliance on sequential IDs in the API.
  final String uuid;

  /// The path to the sound.
  final String path;

  /// The gain of the sound.
  final double gain;
  const Sound(
      {required this.id,
      required this.uuid,
      required this.path,
      required this.gain});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['path'] = Variable<String>(path);
    map['gain'] = Variable<double>(gain);
    return map;
  }

  SoundsCompanion toCompanion(bool nullToAbsent) {
    return SoundsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      path: Value(path),
      gain: Value(gain),
    );
  }

  factory Sound.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Sound(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      path: serializer.fromJson<String>(json['path']),
      gain: serializer.fromJson<double>(json['gain']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'path': serializer.toJson<String>(path),
      'gain': serializer.toJson<double>(gain),
    };
  }

  Sound copyWith({int? id, String? uuid, String? path, double? gain}) => Sound(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        path: path ?? this.path,
        gain: gain ?? this.gain,
      );
  @override
  String toString() {
    return (StringBuffer('Sound(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('path: $path, ')
          ..write('gain: $gain')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, path, gain);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Sound &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.path == this.path &&
          other.gain == this.gain);
}

class SoundsCompanion extends UpdateCompanion<Sound> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> path;
  final Value<double> gain;
  const SoundsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.path = const Value.absent(),
    this.gain = const Value.absent(),
  });
  SoundsCompanion.insert({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    required String path,
    this.gain = const Value.absent(),
  }) : path = Value(path);
  static Insertable<Sound> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? path,
    Expression<double>? gain,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (path != null) 'path': path,
      if (gain != null) 'gain': gain,
    });
  }

  SoundsCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? path,
      Value<double>? gain}) {
    return SoundsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
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
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
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
          ..write('uuid: $uuid, ')
          ..write('path: $path, ')
          ..write('gain: $gain')
          ..write(')'))
        .toString();
  }
}

class $ServerSecurityContextsTable extends ServerSecurityContexts
    with TableInfo<$ServerSecurityContextsTable, ServerSecurityContext> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServerSecurityContextsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _chainFilePathMeta =
      const VerificationMeta('chainFilePath');
  @override
  late final GeneratedColumn<String> chainFilePath = GeneratedColumn<String>(
      'chain_file_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _chainPasswordMeta =
      const VerificationMeta('chainPassword');
  @override
  late final GeneratedColumn<String> chainPassword = GeneratedColumn<String>(
      'chain_password', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _keyFilePathMeta =
      const VerificationMeta('keyFilePath');
  @override
  late final GeneratedColumn<String> keyFilePath = GeneratedColumn<String>(
      'key_file_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _keyPasswordMeta =
      const VerificationMeta('keyPassword');
  @override
  late final GeneratedColumn<String> keyPassword = GeneratedColumn<String>(
      'key_password', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, chainFilePath, chainPassword, keyFilePath, keyPassword];
  @override
  String get aliasedName => _alias ?? 'server_security_contexts';
  @override
  String get actualTableName => 'server_security_contexts';
  @override
  VerificationContext validateIntegrity(
      Insertable<ServerSecurityContext> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('chain_file_path')) {
      context.handle(
          _chainFilePathMeta,
          chainFilePath.isAcceptableOrUnknown(
              data['chain_file_path']!, _chainFilePathMeta));
    } else if (isInserting) {
      context.missing(_chainFilePathMeta);
    }
    if (data.containsKey('chain_password')) {
      context.handle(
          _chainPasswordMeta,
          chainPassword.isAcceptableOrUnknown(
              data['chain_password']!, _chainPasswordMeta));
    }
    if (data.containsKey('key_file_path')) {
      context.handle(
          _keyFilePathMeta,
          keyFilePath.isAcceptableOrUnknown(
              data['key_file_path']!, _keyFilePathMeta));
    } else if (isInserting) {
      context.missing(_keyFilePathMeta);
    }
    if (data.containsKey('key_password')) {
      context.handle(
          _keyPasswordMeta,
          keyPassword.isAcceptableOrUnknown(
              data['key_password']!, _keyPasswordMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServerSecurityContext map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServerSecurityContext(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      chainFilePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}chain_file_path'])!,
      chainPassword: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chain_password']),
      keyFilePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key_file_path'])!,
      keyPassword: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key_password']),
    );
  }

  @override
  $ServerSecurityContextsTable createAlias(String alias) {
    return $ServerSecurityContextsTable(attachedDatabase, alias);
  }
}

class ServerSecurityContext extends DataClass
    implements Insertable<ServerSecurityContext> {
  /// The primary key.
  final int id;

  /// The path to the chain file.
  final String chainFilePath;

  /// The password for the chain file.
  final String? chainPassword;

  /// The path to the key file.
  final String keyFilePath;

  /// The password for the key file.
  final String? keyPassword;
  const ServerSecurityContext(
      {required this.id,
      required this.chainFilePath,
      this.chainPassword,
      required this.keyFilePath,
      this.keyPassword});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['chain_file_path'] = Variable<String>(chainFilePath);
    if (!nullToAbsent || chainPassword != null) {
      map['chain_password'] = Variable<String>(chainPassword);
    }
    map['key_file_path'] = Variable<String>(keyFilePath);
    if (!nullToAbsent || keyPassword != null) {
      map['key_password'] = Variable<String>(keyPassword);
    }
    return map;
  }

  ServerSecurityContextsCompanion toCompanion(bool nullToAbsent) {
    return ServerSecurityContextsCompanion(
      id: Value(id),
      chainFilePath: Value(chainFilePath),
      chainPassword: chainPassword == null && nullToAbsent
          ? const Value.absent()
          : Value(chainPassword),
      keyFilePath: Value(keyFilePath),
      keyPassword: keyPassword == null && nullToAbsent
          ? const Value.absent()
          : Value(keyPassword),
    );
  }

  factory ServerSecurityContext.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServerSecurityContext(
      id: serializer.fromJson<int>(json['id']),
      chainFilePath: serializer.fromJson<String>(json['chainFilePath']),
      chainPassword: serializer.fromJson<String?>(json['chainPassword']),
      keyFilePath: serializer.fromJson<String>(json['keyFilePath']),
      keyPassword: serializer.fromJson<String?>(json['keyPassword']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chainFilePath': serializer.toJson<String>(chainFilePath),
      'chainPassword': serializer.toJson<String?>(chainPassword),
      'keyFilePath': serializer.toJson<String>(keyFilePath),
      'keyPassword': serializer.toJson<String?>(keyPassword),
    };
  }

  ServerSecurityContext copyWith(
          {int? id,
          String? chainFilePath,
          Value<String?> chainPassword = const Value.absent(),
          String? keyFilePath,
          Value<String?> keyPassword = const Value.absent()}) =>
      ServerSecurityContext(
        id: id ?? this.id,
        chainFilePath: chainFilePath ?? this.chainFilePath,
        chainPassword:
            chainPassword.present ? chainPassword.value : this.chainPassword,
        keyFilePath: keyFilePath ?? this.keyFilePath,
        keyPassword: keyPassword.present ? keyPassword.value : this.keyPassword,
      );
  @override
  String toString() {
    return (StringBuffer('ServerSecurityContext(')
          ..write('id: $id, ')
          ..write('chainFilePath: $chainFilePath, ')
          ..write('chainPassword: $chainPassword, ')
          ..write('keyFilePath: $keyFilePath, ')
          ..write('keyPassword: $keyPassword')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, chainFilePath, chainPassword, keyFilePath, keyPassword);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServerSecurityContext &&
          other.id == this.id &&
          other.chainFilePath == this.chainFilePath &&
          other.chainPassword == this.chainPassword &&
          other.keyFilePath == this.keyFilePath &&
          other.keyPassword == this.keyPassword);
}

class ServerSecurityContextsCompanion
    extends UpdateCompanion<ServerSecurityContext> {
  final Value<int> id;
  final Value<String> chainFilePath;
  final Value<String?> chainPassword;
  final Value<String> keyFilePath;
  final Value<String?> keyPassword;
  const ServerSecurityContextsCompanion({
    this.id = const Value.absent(),
    this.chainFilePath = const Value.absent(),
    this.chainPassword = const Value.absent(),
    this.keyFilePath = const Value.absent(),
    this.keyPassword = const Value.absent(),
  });
  ServerSecurityContextsCompanion.insert({
    this.id = const Value.absent(),
    required String chainFilePath,
    this.chainPassword = const Value.absent(),
    required String keyFilePath,
    this.keyPassword = const Value.absent(),
  })  : chainFilePath = Value(chainFilePath),
        keyFilePath = Value(keyFilePath);
  static Insertable<ServerSecurityContext> custom({
    Expression<int>? id,
    Expression<String>? chainFilePath,
    Expression<String>? chainPassword,
    Expression<String>? keyFilePath,
    Expression<String>? keyPassword,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chainFilePath != null) 'chain_file_path': chainFilePath,
      if (chainPassword != null) 'chain_password': chainPassword,
      if (keyFilePath != null) 'key_file_path': keyFilePath,
      if (keyPassword != null) 'key_password': keyPassword,
    });
  }

  ServerSecurityContextsCompanion copyWith(
      {Value<int>? id,
      Value<String>? chainFilePath,
      Value<String?>? chainPassword,
      Value<String>? keyFilePath,
      Value<String?>? keyPassword}) {
    return ServerSecurityContextsCompanion(
      id: id ?? this.id,
      chainFilePath: chainFilePath ?? this.chainFilePath,
      chainPassword: chainPassword ?? this.chainPassword,
      keyFilePath: keyFilePath ?? this.keyFilePath,
      keyPassword: keyPassword ?? this.keyPassword,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (chainFilePath.present) {
      map['chain_file_path'] = Variable<String>(chainFilePath.value);
    }
    if (chainPassword.present) {
      map['chain_password'] = Variable<String>(chainPassword.value);
    }
    if (keyFilePath.present) {
      map['key_file_path'] = Variable<String>(keyFilePath.value);
    }
    if (keyPassword.present) {
      map['key_password'] = Variable<String>(keyPassword.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServerSecurityContextsCompanion(')
          ..write('id: $id, ')
          ..write('chainFilePath: $chainFilePath, ')
          ..write('chainPassword: $chainPassword, ')
          ..write('keyFilePath: $keyFilePath, ')
          ..write('keyPassword: $keyPassword')
          ..write(')'))
        .toString();
  }
}

class $ServerProfilesTable extends ServerProfiles
    with TableInfo<$ServerProfilesTable, ServerProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServerProfilesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: uuidGenerator.v4);
  static const VerificationMeta _mainMenuMusicIdMeta =
      const VerificationMeta('mainMenuMusicId');
  @override
  late final GeneratedColumn<int> mainMenuMusicId = GeneratedColumn<int>(
      'main_menu_music_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sounds (id) ON DELETE SET NULL'));
  static const VerificationMeta _menuSelectSoundIdMeta =
      const VerificationMeta('menuSelectSoundId');
  @override
  late final GeneratedColumn<int> menuSelectSoundId = GeneratedColumn<int>(
      'menu_select_sound_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sounds (id) ON DELETE SET NULL'));
  static const VerificationMeta _menuActivateSoundIdMeta =
      const VerificationMeta('menuActivateSoundId');
  @override
  late final GeneratedColumn<int> menuActivateSoundId = GeneratedColumn<int>(
      'menu_activate_sound_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sounds (id) ON DELETE SET NULL'));
  static const VerificationMeta _portMeta = const VerificationMeta('port');
  @override
  late final GeneratedColumn<int> port = GeneratedColumn<int>(
      'port', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(8080));
  static const VerificationMeta _hostMeta = const VerificationMeta('host');
  @override
  late final GeneratedColumn<String> host = GeneratedColumn<String>(
      'host', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('0.0.0.0'));
  static const VerificationMeta _securityContextIdMeta =
      const VerificationMeta('securityContextId');
  @override
  late final GeneratedColumn<int> securityContextId = GeneratedColumn<int>(
      'security_context_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES server_security_contexts (id) ON DELETE SET NULL'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        uuid,
        mainMenuMusicId,
        menuSelectSoundId,
        menuActivateSoundId,
        port,
        host,
        securityContextId
      ];
  @override
  String get aliasedName => _alias ?? 'server_profiles';
  @override
  String get actualTableName => 'server_profiles';
  @override
  VerificationContext validateIntegrity(Insertable<ServerProfile> instance,
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
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    }
    if (data.containsKey('main_menu_music_id')) {
      context.handle(
          _mainMenuMusicIdMeta,
          mainMenuMusicId.isAcceptableOrUnknown(
              data['main_menu_music_id']!, _mainMenuMusicIdMeta));
    }
    if (data.containsKey('menu_select_sound_id')) {
      context.handle(
          _menuSelectSoundIdMeta,
          menuSelectSoundId.isAcceptableOrUnknown(
              data['menu_select_sound_id']!, _menuSelectSoundIdMeta));
    }
    if (data.containsKey('menu_activate_sound_id')) {
      context.handle(
          _menuActivateSoundIdMeta,
          menuActivateSoundId.isAcceptableOrUnknown(
              data['menu_activate_sound_id']!, _menuActivateSoundIdMeta));
    }
    if (data.containsKey('port')) {
      context.handle(
          _portMeta, port.isAcceptableOrUnknown(data['port']!, _portMeta));
    }
    if (data.containsKey('host')) {
      context.handle(
          _hostMeta, host.isAcceptableOrUnknown(data['host']!, _hostMeta));
    }
    if (data.containsKey('security_context_id')) {
      context.handle(
          _securityContextIdMeta,
          securityContextId.isAcceptableOrUnknown(
              data['security_context_id']!, _securityContextIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServerProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServerProfile(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      mainMenuMusicId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}main_menu_music_id']),
      menuSelectSoundId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}menu_select_sound_id']),
      menuActivateSoundId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}menu_activate_sound_id']),
      port: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}port'])!,
      host: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}host'])!,
      securityContextId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}security_context_id']),
    );
  }

  @override
  $ServerProfilesTable createAlias(String alias) {
    return $ServerProfilesTable(attachedDatabase, alias);
  }
}

class ServerProfile extends DataClass implements Insertable<ServerProfile> {
  /// The primary key.
  final int id;

  /// The name of something.
  final String name;

  /// A unique UUID to remove the reliance on sequential IDs in the API.
  final String uuid;

  /// The ID of the main menu music.
  final int? mainMenuMusicId;

  /// The ID of the menu select sound.
  final int? menuSelectSoundId;

  /// The ID of the menu activate sound.
  final int? menuActivateSoundId;

  /// The port to listen on.
  final int port;

  /// The host to bind on.
  final String host;

  /// The ID of the security context.
  final int? securityContextId;
  const ServerProfile(
      {required this.id,
      required this.name,
      required this.uuid,
      this.mainMenuMusicId,
      this.menuSelectSoundId,
      this.menuActivateSoundId,
      required this.port,
      required this.host,
      this.securityContextId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['uuid'] = Variable<String>(uuid);
    if (!nullToAbsent || mainMenuMusicId != null) {
      map['main_menu_music_id'] = Variable<int>(mainMenuMusicId);
    }
    if (!nullToAbsent || menuSelectSoundId != null) {
      map['menu_select_sound_id'] = Variable<int>(menuSelectSoundId);
    }
    if (!nullToAbsent || menuActivateSoundId != null) {
      map['menu_activate_sound_id'] = Variable<int>(menuActivateSoundId);
    }
    map['port'] = Variable<int>(port);
    map['host'] = Variable<String>(host);
    if (!nullToAbsent || securityContextId != null) {
      map['security_context_id'] = Variable<int>(securityContextId);
    }
    return map;
  }

  ServerProfilesCompanion toCompanion(bool nullToAbsent) {
    return ServerProfilesCompanion(
      id: Value(id),
      name: Value(name),
      uuid: Value(uuid),
      mainMenuMusicId: mainMenuMusicId == null && nullToAbsent
          ? const Value.absent()
          : Value(mainMenuMusicId),
      menuSelectSoundId: menuSelectSoundId == null && nullToAbsent
          ? const Value.absent()
          : Value(menuSelectSoundId),
      menuActivateSoundId: menuActivateSoundId == null && nullToAbsent
          ? const Value.absent()
          : Value(menuActivateSoundId),
      port: Value(port),
      host: Value(host),
      securityContextId: securityContextId == null && nullToAbsent
          ? const Value.absent()
          : Value(securityContextId),
    );
  }

  factory ServerProfile.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServerProfile(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      uuid: serializer.fromJson<String>(json['uuid']),
      mainMenuMusicId: serializer.fromJson<int?>(json['mainMenuMusicId']),
      menuSelectSoundId: serializer.fromJson<int?>(json['menuSelectSoundId']),
      menuActivateSoundId:
          serializer.fromJson<int?>(json['menuActivateSoundId']),
      port: serializer.fromJson<int>(json['port']),
      host: serializer.fromJson<String>(json['host']),
      securityContextId: serializer.fromJson<int?>(json['securityContextId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'uuid': serializer.toJson<String>(uuid),
      'mainMenuMusicId': serializer.toJson<int?>(mainMenuMusicId),
      'menuSelectSoundId': serializer.toJson<int?>(menuSelectSoundId),
      'menuActivateSoundId': serializer.toJson<int?>(menuActivateSoundId),
      'port': serializer.toJson<int>(port),
      'host': serializer.toJson<String>(host),
      'securityContextId': serializer.toJson<int?>(securityContextId),
    };
  }

  ServerProfile copyWith(
          {int? id,
          String? name,
          String? uuid,
          Value<int?> mainMenuMusicId = const Value.absent(),
          Value<int?> menuSelectSoundId = const Value.absent(),
          Value<int?> menuActivateSoundId = const Value.absent(),
          int? port,
          String? host,
          Value<int?> securityContextId = const Value.absent()}) =>
      ServerProfile(
        id: id ?? this.id,
        name: name ?? this.name,
        uuid: uuid ?? this.uuid,
        mainMenuMusicId: mainMenuMusicId.present
            ? mainMenuMusicId.value
            : this.mainMenuMusicId,
        menuSelectSoundId: menuSelectSoundId.present
            ? menuSelectSoundId.value
            : this.menuSelectSoundId,
        menuActivateSoundId: menuActivateSoundId.present
            ? menuActivateSoundId.value
            : this.menuActivateSoundId,
        port: port ?? this.port,
        host: host ?? this.host,
        securityContextId: securityContextId.present
            ? securityContextId.value
            : this.securityContextId,
      );
  @override
  String toString() {
    return (StringBuffer('ServerProfile(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('uuid: $uuid, ')
          ..write('mainMenuMusicId: $mainMenuMusicId, ')
          ..write('menuSelectSoundId: $menuSelectSoundId, ')
          ..write('menuActivateSoundId: $menuActivateSoundId, ')
          ..write('port: $port, ')
          ..write('host: $host, ')
          ..write('securityContextId: $securityContextId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, uuid, mainMenuMusicId,
      menuSelectSoundId, menuActivateSoundId, port, host, securityContextId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServerProfile &&
          other.id == this.id &&
          other.name == this.name &&
          other.uuid == this.uuid &&
          other.mainMenuMusicId == this.mainMenuMusicId &&
          other.menuSelectSoundId == this.menuSelectSoundId &&
          other.menuActivateSoundId == this.menuActivateSoundId &&
          other.port == this.port &&
          other.host == this.host &&
          other.securityContextId == this.securityContextId);
}

class ServerProfilesCompanion extends UpdateCompanion<ServerProfile> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> uuid;
  final Value<int?> mainMenuMusicId;
  final Value<int?> menuSelectSoundId;
  final Value<int?> menuActivateSoundId;
  final Value<int> port;
  final Value<String> host;
  final Value<int?> securityContextId;
  const ServerProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.uuid = const Value.absent(),
    this.mainMenuMusicId = const Value.absent(),
    this.menuSelectSoundId = const Value.absent(),
    this.menuActivateSoundId = const Value.absent(),
    this.port = const Value.absent(),
    this.host = const Value.absent(),
    this.securityContextId = const Value.absent(),
  });
  ServerProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.uuid = const Value.absent(),
    this.mainMenuMusicId = const Value.absent(),
    this.menuSelectSoundId = const Value.absent(),
    this.menuActivateSoundId = const Value.absent(),
    this.port = const Value.absent(),
    this.host = const Value.absent(),
    this.securityContextId = const Value.absent(),
  }) : name = Value(name);
  static Insertable<ServerProfile> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? uuid,
    Expression<int>? mainMenuMusicId,
    Expression<int>? menuSelectSoundId,
    Expression<int>? menuActivateSoundId,
    Expression<int>? port,
    Expression<String>? host,
    Expression<int>? securityContextId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (uuid != null) 'uuid': uuid,
      if (mainMenuMusicId != null) 'main_menu_music_id': mainMenuMusicId,
      if (menuSelectSoundId != null) 'menu_select_sound_id': menuSelectSoundId,
      if (menuActivateSoundId != null)
        'menu_activate_sound_id': menuActivateSoundId,
      if (port != null) 'port': port,
      if (host != null) 'host': host,
      if (securityContextId != null) 'security_context_id': securityContextId,
    });
  }

  ServerProfilesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? uuid,
      Value<int?>? mainMenuMusicId,
      Value<int?>? menuSelectSoundId,
      Value<int?>? menuActivateSoundId,
      Value<int>? port,
      Value<String>? host,
      Value<int?>? securityContextId}) {
    return ServerProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      uuid: uuid ?? this.uuid,
      mainMenuMusicId: mainMenuMusicId ?? this.mainMenuMusicId,
      menuSelectSoundId: menuSelectSoundId ?? this.menuSelectSoundId,
      menuActivateSoundId: menuActivateSoundId ?? this.menuActivateSoundId,
      port: port ?? this.port,
      host: host ?? this.host,
      securityContextId: securityContextId ?? this.securityContextId,
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
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (mainMenuMusicId.present) {
      map['main_menu_music_id'] = Variable<int>(mainMenuMusicId.value);
    }
    if (menuSelectSoundId.present) {
      map['menu_select_sound_id'] = Variable<int>(menuSelectSoundId.value);
    }
    if (menuActivateSoundId.present) {
      map['menu_activate_sound_id'] = Variable<int>(menuActivateSoundId.value);
    }
    if (port.present) {
      map['port'] = Variable<int>(port.value);
    }
    if (host.present) {
      map['host'] = Variable<String>(host.value);
    }
    if (securityContextId.present) {
      map['security_context_id'] = Variable<int>(securityContextId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServerProfilesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('uuid: $uuid, ')
          ..write('mainMenuMusicId: $mainMenuMusicId, ')
          ..write('menuSelectSoundId: $menuSelectSoundId, ')
          ..write('menuActivateSoundId: $menuActivateSoundId, ')
          ..write('port: $port, ')
          ..write('host: $host, ')
          ..write('securityContextId: $securityContextId')
          ..write(')'))
        .toString();
  }
}

class $ZonesTable extends Zones with TableInfo<$ZonesTable, Zone> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ZonesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: uuidGenerator.v4);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _zoneMusicIdMeta =
      const VerificationMeta('zoneMusicId');
  @override
  late final GeneratedColumn<int> zoneMusicId = GeneratedColumn<int>(
      'zone_music_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sounds (id) ON DELETE SET NULL'));
  @override
  List<GeneratedColumn> get $columns => [id, uuid, name, zoneMusicId];
  @override
  String get aliasedName => _alias ?? 'zones';
  @override
  String get actualTableName => 'zones';
  @override
  VerificationContext validateIntegrity(Insertable<Zone> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('zone_music_id')) {
      context.handle(
          _zoneMusicIdMeta,
          zoneMusicId.isAcceptableOrUnknown(
              data['zone_music_id']!, _zoneMusicIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Zone map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Zone(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      zoneMusicId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}zone_music_id']),
    );
  }

  @override
  $ZonesTable createAlias(String alias) {
    return $ZonesTable(attachedDatabase, alias);
  }
}

class Zone extends DataClass implements Insertable<Zone> {
  /// The primary key.
  final int id;

  /// A unique UUID to remove the reliance on sequential IDs in the API.
  final String uuid;

  /// The name of something.
  final String name;

  /// The ID of the music for this zone.
  final int? zoneMusicId;
  const Zone(
      {required this.id,
      required this.uuid,
      required this.name,
      this.zoneMusicId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || zoneMusicId != null) {
      map['zone_music_id'] = Variable<int>(zoneMusicId);
    }
    return map;
  }

  ZonesCompanion toCompanion(bool nullToAbsent) {
    return ZonesCompanion(
      id: Value(id),
      uuid: Value(uuid),
      name: Value(name),
      zoneMusicId: zoneMusicId == null && nullToAbsent
          ? const Value.absent()
          : Value(zoneMusicId),
    );
  }

  factory Zone.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Zone(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      zoneMusicId: serializer.fromJson<int?>(json['zoneMusicId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'zoneMusicId': serializer.toJson<int?>(zoneMusicId),
    };
  }

  Zone copyWith(
          {int? id,
          String? uuid,
          String? name,
          Value<int?> zoneMusicId = const Value.absent()}) =>
      Zone(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        zoneMusicId: zoneMusicId.present ? zoneMusicId.value : this.zoneMusicId,
      );
  @override
  String toString() {
    return (StringBuffer('Zone(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('zoneMusicId: $zoneMusicId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, name, zoneMusicId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Zone &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.zoneMusicId == this.zoneMusicId);
}

class ZonesCompanion extends UpdateCompanion<Zone> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> name;
  final Value<int?> zoneMusicId;
  const ZonesCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.zoneMusicId = const Value.absent(),
  });
  ZonesCompanion.insert({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    required String name,
    this.zoneMusicId = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Zone> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<int>? zoneMusicId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (zoneMusicId != null) 'zone_music_id': zoneMusicId,
    });
  }

  ZonesCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? name,
      Value<int?>? zoneMusicId}) {
    return ZonesCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      zoneMusicId: zoneMusicId ?? this.zoneMusicId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (zoneMusicId.present) {
      map['zone_music_id'] = Variable<int>(zoneMusicId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ZonesCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('zoneMusicId: $zoneMusicId')
          ..write(')'))
        .toString();
  }
}

class $ZoneBuildersTable extends ZoneBuilders
    with TableInfo<$ZoneBuildersTable, ZoneBuilder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ZoneBuildersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: uuidGenerator.v4);
  static const VerificationMeta _zoneIdMeta = const VerificationMeta('zoneId');
  @override
  late final GeneratedColumn<int> zoneId = GeneratedColumn<int>(
      'zone_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES zones (id) ON DELETE CASCADE'));
  static const VerificationMeta _characterIdMeta =
      const VerificationMeta('characterId');
  @override
  late final GeneratedColumn<int> characterId = GeneratedColumn<int>(
      'character_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES characters (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [id, uuid, zoneId, characterId];
  @override
  String get aliasedName => _alias ?? 'zone_builders';
  @override
  String get actualTableName => 'zone_builders';
  @override
  VerificationContext validateIntegrity(Insertable<ZoneBuilder> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    }
    if (data.containsKey('zone_id')) {
      context.handle(_zoneIdMeta,
          zoneId.isAcceptableOrUnknown(data['zone_id']!, _zoneIdMeta));
    } else if (isInserting) {
      context.missing(_zoneIdMeta);
    }
    if (data.containsKey('character_id')) {
      context.handle(
          _characterIdMeta,
          characterId.isAcceptableOrUnknown(
              data['character_id']!, _characterIdMeta));
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ZoneBuilder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ZoneBuilder(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      zoneId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}zone_id'])!,
      characterId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}character_id'])!,
    );
  }

  @override
  $ZoneBuildersTable createAlias(String alias) {
    return $ZoneBuildersTable(attachedDatabase, alias);
  }
}

class ZoneBuilder extends DataClass implements Insertable<ZoneBuilder> {
  /// The primary key.
  final int id;

  /// A unique UUID to remove the reliance on sequential IDs in the API.
  final String uuid;

  /// The ID of the zone this builder references.
  final int zoneId;

  /// The ID of the character who can build on this zone.
  final int characterId;
  const ZoneBuilder(
      {required this.id,
      required this.uuid,
      required this.zoneId,
      required this.characterId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['zone_id'] = Variable<int>(zoneId);
    map['character_id'] = Variable<int>(characterId);
    return map;
  }

  ZoneBuildersCompanion toCompanion(bool nullToAbsent) {
    return ZoneBuildersCompanion(
      id: Value(id),
      uuid: Value(uuid),
      zoneId: Value(zoneId),
      characterId: Value(characterId),
    );
  }

  factory ZoneBuilder.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ZoneBuilder(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      zoneId: serializer.fromJson<int>(json['zoneId']),
      characterId: serializer.fromJson<int>(json['characterId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'zoneId': serializer.toJson<int>(zoneId),
      'characterId': serializer.toJson<int>(characterId),
    };
  }

  ZoneBuilder copyWith(
          {int? id, String? uuid, int? zoneId, int? characterId}) =>
      ZoneBuilder(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        zoneId: zoneId ?? this.zoneId,
        characterId: characterId ?? this.characterId,
      );
  @override
  String toString() {
    return (StringBuffer('ZoneBuilder(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('zoneId: $zoneId, ')
          ..write('characterId: $characterId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, zoneId, characterId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ZoneBuilder &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.zoneId == this.zoneId &&
          other.characterId == this.characterId);
}

class ZoneBuildersCompanion extends UpdateCompanion<ZoneBuilder> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<int> zoneId;
  final Value<int> characterId;
  const ZoneBuildersCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.zoneId = const Value.absent(),
    this.characterId = const Value.absent(),
  });
  ZoneBuildersCompanion.insert({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    required int zoneId,
    required int characterId,
  })  : zoneId = Value(zoneId),
        characterId = Value(characterId);
  static Insertable<ZoneBuilder> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<int>? zoneId,
    Expression<int>? characterId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (zoneId != null) 'zone_id': zoneId,
      if (characterId != null) 'character_id': characterId,
    });
  }

  ZoneBuildersCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<int>? zoneId,
      Value<int>? characterId}) {
    return ZoneBuildersCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      zoneId: zoneId ?? this.zoneId,
      characterId: characterId ?? this.characterId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (zoneId.present) {
      map['zone_id'] = Variable<int>(zoneId.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<int>(characterId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ZoneBuildersCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('zoneId: $zoneId, ')
          ..write('characterId: $characterId')
          ..write(')'))
        .toString();
  }
}

class $RoomsTable extends Rooms with TableInfo<$RoomsTable, Room> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: uuidGenerator.v4);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ambianceIdMeta =
      const VerificationMeta('ambianceId');
  @override
  late final GeneratedColumn<int> ambianceId = GeneratedColumn<int>(
      'ambiance_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sounds (id) ON DELETE SET NULL'));
  static const VerificationMeta _zoneIdMeta = const VerificationMeta('zoneId');
  @override
  late final GeneratedColumn<int> zoneId = GeneratedColumn<int>(
      'zone_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES zones (id) ON DELETE RESTRICT'));
  static const VerificationMeta _maxXMeta = const VerificationMeta('maxX');
  @override
  late final GeneratedColumn<int> maxX = GeneratedColumn<int>(
      'max_x', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(100));
  static const VerificationMeta _maxYMeta = const VerificationMeta('maxY');
  @override
  late final GeneratedColumn<int> maxY = GeneratedColumn<int>(
      'max_y', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(100));
  static const VerificationMeta _wallSoundIdMeta =
      const VerificationMeta('wallSoundId');
  @override
  late final GeneratedColumn<int> wallSoundId = GeneratedColumn<int>(
      'wall_sound_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sounds (id) ON DELETE SET NULL'));
  static const VerificationMeta _defaultFootstepSoundIdMeta =
      const VerificationMeta('defaultFootstepSoundId');
  @override
  late final GeneratedColumn<int> defaultFootstepSoundId = GeneratedColumn<int>(
      'default_footstep_sound_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sounds (id) ON DELETE SET NULL'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        name,
        ambianceId,
        zoneId,
        maxX,
        maxY,
        wallSoundId,
        defaultFootstepSoundId
      ];
  @override
  String get aliasedName => _alias ?? 'rooms';
  @override
  String get actualTableName => 'rooms';
  @override
  VerificationContext validateIntegrity(Insertable<Room> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('ambiance_id')) {
      context.handle(
          _ambianceIdMeta,
          ambianceId.isAcceptableOrUnknown(
              data['ambiance_id']!, _ambianceIdMeta));
    }
    if (data.containsKey('zone_id')) {
      context.handle(_zoneIdMeta,
          zoneId.isAcceptableOrUnknown(data['zone_id']!, _zoneIdMeta));
    } else if (isInserting) {
      context.missing(_zoneIdMeta);
    }
    if (data.containsKey('max_x')) {
      context.handle(
          _maxXMeta, maxX.isAcceptableOrUnknown(data['max_x']!, _maxXMeta));
    }
    if (data.containsKey('max_y')) {
      context.handle(
          _maxYMeta, maxY.isAcceptableOrUnknown(data['max_y']!, _maxYMeta));
    }
    if (data.containsKey('wall_sound_id')) {
      context.handle(
          _wallSoundIdMeta,
          wallSoundId.isAcceptableOrUnknown(
              data['wall_sound_id']!, _wallSoundIdMeta));
    }
    if (data.containsKey('default_footstep_sound_id')) {
      context.handle(
          _defaultFootstepSoundIdMeta,
          defaultFootstepSoundId.isAcceptableOrUnknown(
              data['default_footstep_sound_id']!, _defaultFootstepSoundIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Room map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Room(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      ambianceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ambiance_id']),
      zoneId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}zone_id'])!,
      maxX: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_x'])!,
      maxY: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_y'])!,
      wallSoundId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wall_sound_id']),
      defaultFootstepSoundId: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}default_footstep_sound_id']),
    );
  }

  @override
  $RoomsTable createAlias(String alias) {
    return $RoomsTable(attachedDatabase, alias);
  }
}

class Room extends DataClass implements Insertable<Room> {
  /// The primary key.
  final int id;

  /// A unique UUID to remove the reliance on sequential IDs in the API.
  final String uuid;

  /// The name of something.
  final String name;

  /// The ID of an ambiance.
  final int? ambianceId;

  /// The ID of the zone this room belongs to.
  final int zoneId;

  /// The maximum x coordinate.
  final int maxX;

  /// The maximum y coordinate.
  final int maxY;

  /// The ID of the wall sound.
  final int? wallSoundId;

  /// The ID of the default footstep sound.
  final int? defaultFootstepSoundId;
  const Room(
      {required this.id,
      required this.uuid,
      required this.name,
      this.ambianceId,
      required this.zoneId,
      required this.maxX,
      required this.maxY,
      this.wallSoundId,
      this.defaultFootstepSoundId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || ambianceId != null) {
      map['ambiance_id'] = Variable<int>(ambianceId);
    }
    map['zone_id'] = Variable<int>(zoneId);
    map['max_x'] = Variable<int>(maxX);
    map['max_y'] = Variable<int>(maxY);
    if (!nullToAbsent || wallSoundId != null) {
      map['wall_sound_id'] = Variable<int>(wallSoundId);
    }
    if (!nullToAbsent || defaultFootstepSoundId != null) {
      map['default_footstep_sound_id'] = Variable<int>(defaultFootstepSoundId);
    }
    return map;
  }

  RoomsCompanion toCompanion(bool nullToAbsent) {
    return RoomsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      name: Value(name),
      ambianceId: ambianceId == null && nullToAbsent
          ? const Value.absent()
          : Value(ambianceId),
      zoneId: Value(zoneId),
      maxX: Value(maxX),
      maxY: Value(maxY),
      wallSoundId: wallSoundId == null && nullToAbsent
          ? const Value.absent()
          : Value(wallSoundId),
      defaultFootstepSoundId: defaultFootstepSoundId == null && nullToAbsent
          ? const Value.absent()
          : Value(defaultFootstepSoundId),
    );
  }

  factory Room.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Room(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      ambianceId: serializer.fromJson<int?>(json['ambianceId']),
      zoneId: serializer.fromJson<int>(json['zoneId']),
      maxX: serializer.fromJson<int>(json['maxX']),
      maxY: serializer.fromJson<int>(json['maxY']),
      wallSoundId: serializer.fromJson<int?>(json['wallSoundId']),
      defaultFootstepSoundId:
          serializer.fromJson<int?>(json['defaultFootstepSoundId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'ambianceId': serializer.toJson<int?>(ambianceId),
      'zoneId': serializer.toJson<int>(zoneId),
      'maxX': serializer.toJson<int>(maxX),
      'maxY': serializer.toJson<int>(maxY),
      'wallSoundId': serializer.toJson<int?>(wallSoundId),
      'defaultFootstepSoundId': serializer.toJson<int?>(defaultFootstepSoundId),
    };
  }

  Room copyWith(
          {int? id,
          String? uuid,
          String? name,
          Value<int?> ambianceId = const Value.absent(),
          int? zoneId,
          int? maxX,
          int? maxY,
          Value<int?> wallSoundId = const Value.absent(),
          Value<int?> defaultFootstepSoundId = const Value.absent()}) =>
      Room(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        ambianceId: ambianceId.present ? ambianceId.value : this.ambianceId,
        zoneId: zoneId ?? this.zoneId,
        maxX: maxX ?? this.maxX,
        maxY: maxY ?? this.maxY,
        wallSoundId: wallSoundId.present ? wallSoundId.value : this.wallSoundId,
        defaultFootstepSoundId: defaultFootstepSoundId.present
            ? defaultFootstepSoundId.value
            : this.defaultFootstepSoundId,
      );
  @override
  String toString() {
    return (StringBuffer('Room(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('ambianceId: $ambianceId, ')
          ..write('zoneId: $zoneId, ')
          ..write('maxX: $maxX, ')
          ..write('maxY: $maxY, ')
          ..write('wallSoundId: $wallSoundId, ')
          ..write('defaultFootstepSoundId: $defaultFootstepSoundId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, name, ambianceId, zoneId, maxX,
      maxY, wallSoundId, defaultFootstepSoundId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Room &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.ambianceId == this.ambianceId &&
          other.zoneId == this.zoneId &&
          other.maxX == this.maxX &&
          other.maxY == this.maxY &&
          other.wallSoundId == this.wallSoundId &&
          other.defaultFootstepSoundId == this.defaultFootstepSoundId);
}

class RoomsCompanion extends UpdateCompanion<Room> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> name;
  final Value<int?> ambianceId;
  final Value<int> zoneId;
  final Value<int> maxX;
  final Value<int> maxY;
  final Value<int?> wallSoundId;
  final Value<int?> defaultFootstepSoundId;
  const RoomsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.ambianceId = const Value.absent(),
    this.zoneId = const Value.absent(),
    this.maxX = const Value.absent(),
    this.maxY = const Value.absent(),
    this.wallSoundId = const Value.absent(),
    this.defaultFootstepSoundId = const Value.absent(),
  });
  RoomsCompanion.insert({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    required String name,
    this.ambianceId = const Value.absent(),
    required int zoneId,
    this.maxX = const Value.absent(),
    this.maxY = const Value.absent(),
    this.wallSoundId = const Value.absent(),
    this.defaultFootstepSoundId = const Value.absent(),
  })  : name = Value(name),
        zoneId = Value(zoneId);
  static Insertable<Room> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<int>? ambianceId,
    Expression<int>? zoneId,
    Expression<int>? maxX,
    Expression<int>? maxY,
    Expression<int>? wallSoundId,
    Expression<int>? defaultFootstepSoundId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (ambianceId != null) 'ambiance_id': ambianceId,
      if (zoneId != null) 'zone_id': zoneId,
      if (maxX != null) 'max_x': maxX,
      if (maxY != null) 'max_y': maxY,
      if (wallSoundId != null) 'wall_sound_id': wallSoundId,
      if (defaultFootstepSoundId != null)
        'default_footstep_sound_id': defaultFootstepSoundId,
    });
  }

  RoomsCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? name,
      Value<int?>? ambianceId,
      Value<int>? zoneId,
      Value<int>? maxX,
      Value<int>? maxY,
      Value<int?>? wallSoundId,
      Value<int?>? defaultFootstepSoundId}) {
    return RoomsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      ambianceId: ambianceId ?? this.ambianceId,
      zoneId: zoneId ?? this.zoneId,
      maxX: maxX ?? this.maxX,
      maxY: maxY ?? this.maxY,
      wallSoundId: wallSoundId ?? this.wallSoundId,
      defaultFootstepSoundId:
          defaultFootstepSoundId ?? this.defaultFootstepSoundId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (ambianceId.present) {
      map['ambiance_id'] = Variable<int>(ambianceId.value);
    }
    if (zoneId.present) {
      map['zone_id'] = Variable<int>(zoneId.value);
    }
    if (maxX.present) {
      map['max_x'] = Variable<int>(maxX.value);
    }
    if (maxY.present) {
      map['max_y'] = Variable<int>(maxY.value);
    }
    if (wallSoundId.present) {
      map['wall_sound_id'] = Variable<int>(wallSoundId.value);
    }
    if (defaultFootstepSoundId.present) {
      map['default_footstep_sound_id'] =
          Variable<int>(defaultFootstepSoundId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('ambianceId: $ambianceId, ')
          ..write('zoneId: $zoneId, ')
          ..write('maxX: $maxX, ')
          ..write('maxY: $maxY, ')
          ..write('wallSoundId: $wallSoundId, ')
          ..write('defaultFootstepSoundId: $defaultFootstepSoundId')
          ..write(')'))
        .toString();
  }
}

abstract class _$MonolithDatabase extends GeneratedDatabase {
  _$MonolithDatabase(QueryExecutor e) : super(e);
  late final $UserAccountsTable userAccounts = $UserAccountsTable(this);
  late final $CharactersTable characters = $CharactersTable(this);
  late final $SoundsTable sounds = $SoundsTable(this);
  late final $ServerSecurityContextsTable serverSecurityContexts =
      $ServerSecurityContextsTable(this);
  late final $ServerProfilesTable serverProfiles = $ServerProfilesTable(this);
  late final $ZonesTable zones = $ZonesTable(this);
  late final $ZoneBuildersTable zoneBuilders = $ZoneBuildersTable(this);
  late final $RoomsTable rooms = $RoomsTable(this);
  late final UserAccountsDao userAccountsDao =
      UserAccountsDao(this as MonolithDatabase);
  late final CharactersDao charactersDao =
      CharactersDao(this as MonolithDatabase);
  late final SoundsDao soundsDao = SoundsDao(this as MonolithDatabase);
  late final ServerProfilesDao serverProfilesDao =
      ServerProfilesDao(this as MonolithDatabase);
  late final ServerSecurityContextsDao serverSecurityContextsDao =
      ServerSecurityContextsDao(this as MonolithDatabase);
  late final ZonesDao zonesDao = ZonesDao(this as MonolithDatabase);
  late final ZoneBuildersDao zoneBuildersDao =
      ZoneBuildersDao(this as MonolithDatabase);
  late final RoomsDao roomsDao = RoomsDao(this as MonolithDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        userAccounts,
        characters,
        sounds,
        serverSecurityContexts,
        serverProfiles,
        zones,
        zoneBuilders,
        rooms
      ];
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
          WritePropagation(
            on: TableUpdateQuery.onTableName('sounds',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('server_profiles', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('sounds',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('server_profiles', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('sounds',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('server_profiles', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('server_security_contexts',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('server_profiles', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('sounds',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('zones', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('zones',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('zone_builders', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('characters',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('zone_builders', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('sounds',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('rooms', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('sounds',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('rooms', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('sounds',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('rooms', kind: UpdateKind.update),
            ],
          ),
        ],
      );
}
