package avion.dekole.model.flight;

import avion.dekole.model.airplane.Airplane;
import avion.dekole.model.common.BaseModel;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Entity
@Getter
@Setter
public class Flight extends BaseModel {

    private String flightNumber;
    private String departure;
    private String arrival;

    @ManyToOne
    private Airplane airplane;

    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
}
