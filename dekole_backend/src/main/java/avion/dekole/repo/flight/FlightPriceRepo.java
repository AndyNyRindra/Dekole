package avion.dekole.repo.flight;

import avion.dekole.model.airplane.AirplaneClass;
import avion.dekole.model.flight.Flight;
import avion.dekole.model.flight.FlightPrice;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FlightPriceRepo extends JpaRepository<FlightPrice, Long> {

    public FlightPrice findByAirplaneClassAndFlight(AirplaneClass airplaneClass, Flight flight);
}
