package avion.dekole.service.reservation;

import avion.dekole.exception.CustomException;
import avion.dekole.model.airplane.AirplaneClass;
import avion.dekole.model.flight.Flight;
import avion.dekole.model.flight.FlightPrice;
import avion.dekole.model.reservation.RequestDetails;
import avion.dekole.model.reservation.Reservation;
import avion.dekole.model.reservation.ReservationDetails;
import avion.dekole.repo.airplane.AirplaneClassRepo;
import avion.dekole.repo.flight.FlightPriceRepo;
import avion.dekole.repo.reservation.ReservationRepo;
import avion.dekole.service.airplane.AirplaneClassService;
import avion.dekole.service.common.CrudService;
import avion.dekole.service.flight.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationService extends CrudService<Reservation, ReservationRepo> {

    @Autowired
    private AirplaneClassService airplaneClassService;

    @Autowired
    private FlightPriceRepo flightPriceRepo;


    public ReservationService(ReservationRepo repo) {
        super(repo);
    }

    public Integer getSeatsSetted(Long flightId, Long airplaneClassId) {
        return repo.countByFlightIdAndAirplaneClassId(flightId, airplaneClassId);
    }

    public Integer getSeatsAvailable(Long flightId, Long airplaneClassId) throws CustomException {
        AirplaneClass airplaneClass = airplaneClassService.findById(airplaneClassId);
        Integer seatsAvailable = airplaneClass.getSeats() - getSeatsSetted(flightId, airplaneClassId);
        if (seatsAvailable <= 0) {
            throw new CustomException("No seats available for the class " + airplaneClass.getClasss().getName());
        }
        return seatsAvailable;
    }

    public Boolean validateSeatsOfClass(Long flightId, Long airplaneClassId, Integer seats) throws CustomException {
        if (seats > getSeatsAvailable(flightId, airplaneClassId)) {
            throw new CustomException("No seats available for the class " + airplaneClassId);
        }
        return true;
    }

    public Boolean validateAllSeats(Reservation reservation) throws CustomException {
        for (RequestDetails requestDetails: reservation.getRequestDetails()) {
            try {
                validateSeatsOfClass(reservation.getFlight().getId(), requestDetails.getAirplaneClass().getId(), requestDetails.getSeats());
            } catch (CustomException e) {
                throw e;
            }
        }
        return true;
    }

    public void setDetailsPrice(Reservation reservation) {
        for (ReservationDetails reservationDetails: reservation.getDetails()) {
            FlightPrice flightPrice = flightPriceRepo.findByAirplaneClassAndFlight(reservationDetails.getAirplaneClass(), reservation.getFlight());
            reservationDetails.setPrice(flightPrice.getDiscountedPrice());
        }
    }

    public Reservation save(Reservation reservation) throws CustomException {
        try {
            validateAllSeats(reservation);
            setDetailsPrice(reservation);
        } catch (CustomException e) {
            throw e;
        }
        return repo.save(reservation);
    }

}
