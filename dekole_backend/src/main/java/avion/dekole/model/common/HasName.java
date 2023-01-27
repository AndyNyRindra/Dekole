package avion.dekole.model.common;

import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@MappedSuperclass
public class HasName extends BaseModel {

    private String name;

}
