package avion.dekole.service.flight;

import avion.dekole.model.flight.Flight;
import avion.dekole.repo.flight.FlightRepo;
import avion.dekole.service.common.CrudService;
import org.springframework.stereotype.Service;

@Service
public class FlightService extends CrudService<Flight, FlightRepo> {
    public FlightService(FlightRepo repo) {
        super(repo);
    }
}
