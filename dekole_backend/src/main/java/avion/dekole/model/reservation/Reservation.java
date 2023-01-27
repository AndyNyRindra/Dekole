package avion.dekole.model.reservation;

import avion.dekole.model.common.BaseModel;
import avion.dekole.model.flight.Flight;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

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
    private Date date;

    @OneToMany(mappedBy = "reservationId")
    private List<ReservationDetails> details;

}
