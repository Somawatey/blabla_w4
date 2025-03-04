import 'package:blabla_w4/model/ride/ride.dart';
import 'package:blabla_w4/model/ride_pref/ride_pref.dart';
import 'package:blabla_w4/service/rides_service.dart';

abstract class RidesRepository {
  List<Ride> getRides(RidePreference preference, RidesFilter? filter);
}