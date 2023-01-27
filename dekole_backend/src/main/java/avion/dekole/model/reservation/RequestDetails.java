package avion.dekole.model.reservation;

import avion.dekole.model.airplane.AirplaneClass;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RequestDetails {

    private AirplaneClass airplaneClass;
    private Integer seats;

}
