package avion.dekole.repo.reservation;

import avion.dekole.model.reservation.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ReservationRepo extends JpaRepository<Reservation, Long> {

    @Query(value = "select count(*) from reservation r join reservation_details d on r.id=d.reservation_id where flight_id = ?1 and airplane_class_id = ?2", nativeQuery = true)
    public Integer countByFlightIdAndAirplaneClassId(Long flightId, Long airplaneClassId);
}
