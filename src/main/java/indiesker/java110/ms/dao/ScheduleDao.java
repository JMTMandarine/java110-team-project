package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.Schedule;

public interface ScheduleDao {
  List<Schedule> findperschedule(Map<String,Object> params);
  void insertperschedule(Schedule perschedule);
  List<Schedule> findMyAllSchedule(Map<String,Object> params);
  List<Schedule> findbydate(Map<String,Object> params);
  List<Schedule> findbyflag(Map<String,Object> params);
  void insertstageschedule(Schedule schedule);
  List<Schedule> findreqschedule(Map<String,Object> params);
  Schedule findbybrno(int no);
  Schedule findbypsno(int no);
  
}