package indiesker.java110.ms.service;

import java.util.List;
import indiesker.java110.ms.domain.BuskerPromotion;

public interface BuskerPromotionService {
    List<BuskerPromotion> list();
    List<BuskerPromotion> SearchByCity(String city);
    
}
