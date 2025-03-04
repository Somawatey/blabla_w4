import 'package:blabla_w4/model/ride_pref/ride_pref.dart';
import 'package:blabla_w4/repository/ride_repository.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {

  //static List<Ride> availableRides = fakeRides;  

  static final RidesService _instance = RidesService._internal();
  late RidesRepository _repository;

  //private constructor
  RidesService._internal();

  static RidesService get instance => _instance;


  void initialize(RidesRepository repository) {
    _repository = repository;
  }
  ///
  ///  Return the relevant rides, given the passenger preferences
  ///
  List<Ride> getRidesfor(RidePreference preference, RidesFilter? filter) {

     return _repository.getRides(preference, filter);
  }
 
}

class RidesFilter {
  final bool acceptPets;
  
  RidesFilter({this.acceptPets = false});
}