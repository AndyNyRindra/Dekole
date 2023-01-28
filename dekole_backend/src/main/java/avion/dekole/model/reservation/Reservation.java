package avion.dekole.model.reservation;

import avion.dekole.model.common.BaseModel;
import avion.dekole.model.flight.Flight;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Entity
@Getter
@Setter
public class Reservation extends BaseModel {

    private String client;

    @ManyToOne
    private Flight flight;

    @Temporal(TemporalType.TIMESTAMP)
    private Date date = java.sql.Date.valueOf(LocalDate.now());

    @OneToMany(mappedBy = "reservationId")
    private List<ReservationDetails> details;

    @Transient
    private List<RequestDetails> requestDetails;

    @Transient
    private Double totalPrice;

    public Double getTotalPrice() {
        Double totalPrice = 0.0;
        for (ReservationDetails detail : getDetails()) {
            totalPrice += detail.getPrice();
        }
        return totalPrice;
    }

}
