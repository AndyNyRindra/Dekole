package avion.dekole.model.common;


import avion.dekole.exception.CustomException;

public abstract class HasFK<FK> extends BaseModel {
    public abstract void setFK(FK fk) throws CustomException;
}
