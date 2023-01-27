package avion.dekole.model.airplane;

import avion.dekole.model.common.BaseModel;
import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Airplane extends BaseModel {

    private String model;
    private Integer lines;
    private Integer columns;
    private String number;
}
