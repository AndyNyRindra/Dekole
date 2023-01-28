package avion.dekole.service.airplane;

import avion.dekole.model.airplane.AirplaneClass;
import avion.dekole.repo.airplane.AirplaneClassRepo;
import avion.dekole.service.common.CrudService;
import org.springframework.stereotype.Service;

@Service
public class AirplaneClassService extends CrudService<AirplaneClass, AirplaneClassRepo> {

    public AirplaneClassService(AirplaneClassRepo repo) {
        super(repo);
    }
}

