package avion.dekole.model.flight;

import avion.dekole.model.common.BaseModel;
import jakarta.persistence.Entity;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Entity
@Getter
@Setter
public class Promotion extends BaseModel {

    private Double discount;

    @Temporal(TemporalType.TIMESTAMP)
    private Date beginDate;

    @Temporal(TemporalType.TIMESTAMP)
    private Date endDate;

    private Long flightPriceId;
}
