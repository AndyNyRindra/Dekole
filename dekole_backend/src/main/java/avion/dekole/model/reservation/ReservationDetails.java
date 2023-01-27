package avion.dekole.model.reservation;

import avion.dekole.model.airplane.AirplaneClass;
import avion.dekole.model.common.BaseModel;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class ReservationDetails extends BaseModel {

    private Long reservationId;

    @ManyToOne
    private AirplaneClass airplaneClass;

    private Integer line;
    private Integer column;
    private Double price;
}
