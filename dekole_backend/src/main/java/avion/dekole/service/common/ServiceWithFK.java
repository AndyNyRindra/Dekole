package avion.dekole.service.common;

import java.util.List;

public interface ServiceWithFK<E, FK> extends Service<E> {

    List<E> findForFK (FK fk);

}
