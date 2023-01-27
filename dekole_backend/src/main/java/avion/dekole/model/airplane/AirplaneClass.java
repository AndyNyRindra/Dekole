package avion.dekole.model.airplane;

import avion.dekole.model.common.BaseModel;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class AirplaneClass extends BaseModel {

    @ManyToOne
    private Airplane airplane;

    @ManyToOne
    @JoinColumn(name = "class_id")
    private Class classs;

    private Integer beginLine;
    private Integer endLine;

    public Integer getSeats() {
        return (getEndLine() - getBeginLine() + 1) * airplane.getColumns();
    }

}
