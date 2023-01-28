package avion.dekole.repo.flight;

import avion.dekole.model.flight.Flight;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FlightRepo extends JpaRepository<Flight, Long> {
}
