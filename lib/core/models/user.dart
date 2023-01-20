
import 'package:hive_flutter/adapters.dart';


part 'user.g.dart';
@HiveType(typeId: 1 )
class User{
  @HiveField(0)
  final String username;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String password;
  @HiveField(3)
  final Role role;
  User(this.username, this.email, this.password, this.role);
}

@HiveType(typeId: 2)
enum Role {
   @HiveField(0)
  admin,
   @HiveField(1)
  user
}