import '../../../model/bike/bike_model.dart';

abstract class BikeRepository {
  Future<List<Bike>> fetchBikes();
  Future<void> updateBikeStatus(Bike bike);
}