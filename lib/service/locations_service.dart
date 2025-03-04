import 'package:blabla_w4/model/ride/locations.dart';
import 'package:blabla_w4/repository/locations_repository.dart';

class LocationsService {
  // Private static instance of the class
  static final LocationsService _instance = LocationsService._internal();
  
  // Private repository variable
  LocationsRepository? _repository;

  // Private constructor
  LocationsService._internal();

  // Getter for the singleton instance
  static LocationsService get instance => _instance;

  // Initializer method to set the repository
  void initialize(LocationsRepository repository) {
    _repository = repository;
  }

  // Method to get locations with repository check
  List<Location> getLocations() {
    // Ensure repository is initialized before use
    if (_repository == null) {
      throw StateError('Repository must be initialized before getting locations');
    }

    // Delegate location retrieval to the repository
    return _repository!.getLocations();
  }
}