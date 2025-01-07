import 'dart:convert';


class Account {
  final String username;
  final String password;
  final String first_name;
  final String last_name;
  bool mobileHope;
  bool transitionalHousing;
  bool morverPark;
  bool interfaithRelief;
  bool arborAssistingLiving;
  bool idaLeePark;
  bool goodShepherdThrift;
  bool franklinPark;
  bool bansheeReeks;
  bool heritageMuseum;
  bool salvationArmy;
  bool animalServices;
  bool claudeMoorePark;
  bool womenGivingBack;
  bool aging;
  bool mapping;
  bool adamsCenter;
  bool loudounCares;
  bool loudounHungerRelief;


  Account({required this.username,
  required this.password,
  required this.first_name,
  required this.last_name,
  this.mobileHope=false,
  this.transitionalHousing=false,
  this.morverPark=false,
  this.interfaithRelief=false,
  this.arborAssistingLiving=false,
  this.idaLeePark=false,
  this.goodShepherdThrift=false,
  this.franklinPark=false,
  this.bansheeReeks=false,
  this.heritageMuseum=false,
  this.salvationArmy=false,
  this.animalServices=false,
  this.claudeMoorePark=false,
  this.womenGivingBack=false,
  this.aging=false,
  this.mapping=false,
  this.adamsCenter=false,
  this.loudounCares=false,
  this.loudounHungerRelief=false});


  Map<String,dynamic> toJson(){
    return{
      "username" : username,
      "password": password,
      "first_name": first_name,
      "last_name" : last_name,
      "mobileHope": mobileHope ? 1:0,
      "transitionalHousing": transitionalHousing ? 1:0,
      "morverPark" : morverPark ? 1:0,
      "interfaithRelief": interfaithRelief ? 1:0,
      "arborAssistingLiving" : arborAssistingLiving ? 1:0,
      "idaLeePark" : idaLeePark ? 1:0,
      "goodShepherdThrift" : goodShepherdThrift ? 1:0,
      "franklinPark" : franklinPark ? 1:0,
      "bansheeReeks" : bansheeReeks ? 1:0,
      "heritageMuseum" : heritageMuseum ? 1:0,
      "salvationArmy" : salvationArmy ? 1:0,
      "animalServices" : animalServices ? 1:0,
      "claudeMoorePark" : claudeMoorePark ? 1:0,
      "womenGivingBack" : womenGivingBack ? 1:0,
      "aging" : aging ? 1:0,
      "mapping" : mapping ? 1:0,
      "adamsCenter" : adamsCenter ? 1:0,
      "loudounCares" : loudounCares ? 1:0,
      "loudounHungerRelief" : loudounHungerRelief ? 1:0,
    };
  }


  factory Account.fromJsonDatabase(Map<String, dynamic> jsonObject) {
    return Account(
      username: jsonObject['username'] as String,
      password: jsonObject['password'] as String,
      first_name: jsonObject['first_name'] as String,
      last_name: jsonObject['last_name'] as String,
      mobileHope: (jsonObject['mobileHope'] as int) == 1,
      transitionalHousing: (jsonObject['transitionalHousing'] as int) == 1,
      morverPark: (jsonObject['morverPark'] as int) == 1,
      interfaithRelief: (jsonObject['interfaithRelief'] as int) == 1,
      arborAssistingLiving: (jsonObject['arborAssistingLiving'] as int) == 1,
      idaLeePark: (jsonObject['idaLeePark'] as int) == 1,
      goodShepherdThrift: (jsonObject['goodShepherdThrift'] as int) == 1,
      franklinPark: (jsonObject['franklinPark'] as int) == 1,
      bansheeReeks: (jsonObject['bansheeReeks'] as int) == 1,
      heritageMuseum: (jsonObject['heritageMuseum'] as int) == 1,
      salvationArmy: (jsonObject['salvationArmy'] as int) == 1,
      animalServices: (jsonObject['animalServices'] as int) == 1,
      claudeMoorePark: (jsonObject['claudeMoorePark'] as int) == 1,
      womenGivingBack: (jsonObject['womenGivingBack'] as int) == 1,
      aging: (jsonObject['aging'] as int) == 1,
      mapping: (jsonObject['mapping'] as int) == 1,
      adamsCenter: (jsonObject['adamsCenter'] as int) == 1,
      loudounCares: (jsonObject['loudounCares'] as int) == 1,
      loudounHungerRelief: (jsonObject['loudounHungerRelief'] as int) == 1,
    );
  }




}
