

import 'package:blabla_w4/model/ride/locations.dart';
import 'package:blabla_w4/model/ride/ride.dart';
import 'package:blabla_w4/model/ride_pref/ride_pref.dart';
import 'package:blabla_w4/repository/mock/mock_user.dart';
import 'package:blabla_w4/repository/ride_repository.dart';
import 'package:blabla_w4/service/rides_service.dart';
import 'package:blabla_w4/utils/date_time_util.dart';

class MockRidesRepository implements RidesRepository {
  @override
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    final allRides = [
      Ride(
        departureLocation: Location(name: "Battambang", country: Country.cambodia),
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        departureDate: DateTime.now().copyWith(hour: 5, minute: 30),
        arrivalDateTime: DateTime.now().copyWith(hour: 7, minute: 30),
        duration: Duration(hours: 2),
        driver: kannika,
        ridesFilter: RidesFilter(acceptPets: false),
        availableSeats: 2,
        pricePerSeat: 30,
      ),
      Ride(
        departureLocation: Location(name: "Battambang", country: Country.cambodia),
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        departureDate: DateTime.now().copyWith(hour: 20,minute: 00),
        arrivalDateTime: DateTime.now().copyWith(hour: 22, minute: 00),
        duration: Duration(hours: 2),
        driver: chaylim,
        ridesFilter: RidesFilter(acceptPets: false),
        availableSeats: 0,
        pricePerSeat: 20,
      ),
      Ride(
        departureLocation: Location(name: "Battambang", country: Country.cambodia),
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        departureDate: DateTime.now().copyWith(hour: 5, minute: 00),
        arrivalDateTime: DateTime.now().copyWith(hour: 8, minute: 00),
        duration: Duration(hours: 3),
        driver: mengtech,
        ridesFilter: RidesFilter(acceptPets: false),
        availableSeats: 1,
        pricePerSeat: 10,
      ),
      Ride(
        departureLocation: Location(name: "Battambang", country: Country.cambodia),
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        departureDate: DateTime.now().copyWith(hour: 20, minute: 00),
        arrivalDateTime: DateTime.now().copyWith(hour: 22, minute: 00),
        duration: Duration(hours: 2),
        driver: limhao,
        ridesFilter: RidesFilter(acceptPets: true),
        availableSeats: 2,
        pricePerSeat: 18,
      ),
      Ride(
       departureLocation: Location(name: "Battambang", country: Country.cambodia),
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        departureDate: DateTime.now().copyWith(hour: 5,minute: 00),
        arrivalDateTime: DateTime.now().copyWith(hour: 8,minute: 00),
        duration: Duration(hours: 3),
        driver: sovanda,
        ridesFilter: RidesFilter(acceptPets: false),
        availableSeats: 1,
        pricePerSeat: 15.0,
      ),
    ];
      if (preference == null) return allRides;

      return allRides.where((ride) {
        final matchesLocations = 
          ride.departureLocation == preference.departure &&
          ride.arrivalLocation == preference.arrival;
        
        final matchesDate = DateTimeUtils.formatDateTime(ride.departureDate) ==
            DateTimeUtils.formatDateTime(preference.departureDate);

        final matchesPets = filter?.acceptPets == null || 
            ride.ridesFilter.acceptPets == filter?.acceptPets;

        return matchesLocations && matchesDate && matchesPets;
      }).toList();
    }
  }

 
