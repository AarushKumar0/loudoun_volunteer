import 'package:flutter/material.dart';
import 'package:loudoun_volunteer/models/account.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';




class DatabaseHelper {


  static const _databaseName = "accounts.db";
  static const _databaseVersion = 42;
  static const _tableName = "account";


  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();


  static Database? _database;


  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }


  _initDatabase() async {
    //device/data/datasename.db
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }


  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        username TEXT PRIMARY KEY,
        password TEXT NOT NULL,
        first_name TEXT NOT NULL,
        last_name TEXT NOT NULL,
        mobileHope INTEGER DEFAULT 0,
        transitionalHousing INTEGER DEFAULT 0,
        morverPark INTEGER DEFAULT 0,
        interfaithRelief INTEGER DEFAULT 0,
        arborAssistingLiving INTEGER DEFAULT 0,
        idaLeePark INTEGER DEFAULT 0,
        goodShepherdThrift INTEGER DEFAULT 0,
        franklinPark INTEGER DEFAULT 0,
        bansheeReeks INTEGER DEFAULT 0,
        heritageMuseum INTEGER DEFAULT 0,
        salvationArmy INTEGER DEFAULT 0,
        animalServices INTEGER DEFAULT 0,
        claudeMoorePark INTEGER DEFAULT 0,
        womenGivingBack INTEGER DEFAULT 0,
        aging INTEGER DEFAULT 0,
        mapping INTEGER DEFAULT 0,
        adamsCenter INTEGER DEFAULT 0,
        loudounCares INTEGER DEFAULT 0,
        loudounHungerRelief INTEGER DEFAULT 0
      )
    ''');
  }


  Future<int> insert(Account account) async {
    Database db = await instance.database;
    return await db.insert(_tableName, account.toJson());
  }


  Future<List<Account>> getAccount(String username) async {
    Database db = await instance.database;
    var result =
        await db.query(_tableName, where: 'username = ?', whereArgs: [username]);


    if (result.isNotEmpty) {
    var account = Account.fromJsonDatabase(result.first);
    dynamic list = [account];
    return list;
    }
  else {
    throw Exception('Account not found for username: $username');
  }
   
  }


  Future<int> toggleMobileHope(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'mobileHope': account.mobileHope ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
   
  }


  Future<int> toggleTransitionalHousing(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'transitionalHousing': account.transitionalHousing ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
  }


  Future<int> toggleMorverPark(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'morverPark': account.morverPark ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
  }


  Future<int> toggleInterFaithRelief(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'interFaithRelief': account.interfaithRelief ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
  }


  Future<int> toggleArborAssistingLiving(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'arborAssistingLiving': account.arborAssistingLiving ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
  }


  Future<int> toggleIdaLeePark(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'idaLeePark': account.idaLeePark ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
  }


  Future<int> toggleGoodShepherdThrift(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'goodShepherdThrift': account.goodShepherdThrift ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
  }




  Future<int> toggleFranklinPark(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'franklinPark': account.franklinPark ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
  }


  Future<int> toggleBansheeReeks(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'bansheeReeks': account.bansheeReeks ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
  }


  Future<int> toggleHeritageMuseum(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'heritageMuseum': account.heritageMuseum ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
  }


  Future<int> toggleSalvationArmy(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'salvationArmy': account.salvationArmy ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
  }


  Future<int> toggleAnimalServices(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'animalServices': account.animalServices ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
  }


  Future<int> toggleClaudeMoorePark(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'claudeMoorePark': account.claudeMoorePark ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
  }


  Future<int> toggleWomenGivingBack(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'womenGivingBack': account.womenGivingBack ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
  }


  Future<int> toggleAging(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'aging': account.aging ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
  }


  Future<int> toggleMapping(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'mapping': account.mapping ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
  }


  Future<int> toggleAdamsCenter(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'adamsCenter': account.adamsCenter ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
  }


  Future<int> toggleLoudounCares(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'loudounCares': account.loudounCares ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
  }


  Future<int> toggleLoudounHungerRelief(String username, Account baccount) async {
    Database db = await instance.database;
    var laccount = await getAccount(username);
    var account = laccount[0];
    return await db.update(_tableName, {'loudounHungerRelief': account.loudounHungerRelief ? 0 : 1},
        where: 'username = ?', whereArgs: [username]);
  }








}
