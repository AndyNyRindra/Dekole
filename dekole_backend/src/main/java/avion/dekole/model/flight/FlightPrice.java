package avion.dekole.model.flight;

import avion.dekole.model.airplane.AirplaneClass;
import avion.dekole.model.common.BaseModel;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.Date;
import java.util.List;

@Entity
@Getter
@Setter
public class FlightPrice extends BaseModel {

    @ManyToOne
    private Flight flight;

    @ManyToOne
    private AirplaneClass airplaneClass;

    private Double price;

    @OneToMany(mappedBy = "flightPriceId")
    private List<Promotion> promotions;

    public Double getDiscountedPrice() {
        Instant instant = LocalDateTime.now().toInstant(ZoneOffset.UTC);
        Date now = Date.from(instant);
        for (Promotion promotion : getPromotions()) {
            if (promotion.getBeginDate().before(now) && promotion.getEndDate().after(now)) {
                return getPrice() - (getPrice() * promotion.getDiscount());
            }
        }
        return getPrice();
    }

}
