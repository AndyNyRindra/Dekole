package avion.dekole.service.reservation;

import avion.dekole.model.reservation.Reservation;
import avion.dekole.repo.reservation.ReservationRepo;
import avion.dekole.service.common.CrudService;
import org.springframework.stereotype.Service;

@Service
public class ReservationService extends CrudService<Reservation, ReservationRepo> {

    public ReservationService(ReservationRepo repo) {
        super(repo);
    }

    public Integer getSeatsSetted(Long flightId, Long airplaneClassId) {
        return repo.countByFlightIdAndAirplaneClassId(flightId, airplaneClassId);
    }


}
