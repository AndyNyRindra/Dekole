package avion.dekole.model.flight;

import avion.dekole.model.airplane.AirplaneClass;
import avion.dekole.model.common.BaseModel;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class FlightPrice extends BaseModel {

    @ManyToOne
    private Flight flight;

    @ManyToOne
    private AirplaneClass airplaneClass;

    private Double price;
}
