package indiesker.java110.ms.service;

import indiesker.java110.ms.domain.StagePhoto;
import indiesker.java110.ms.domain.Supporter;

public interface SupporterService {
  int checkName(String name);
  int add(Supporter supporter);
  int insert(StagePhoto stagephoto);
}