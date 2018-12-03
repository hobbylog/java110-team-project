package indiesker.java110.ms.service;

import java.util.ArrayList;
import java.util.List;
import indiesker.java110.ms.domain.Schedule;

public interface ScheduleService {
    List<Schedule> myperlist(int pageNo, int pageSize);
    void addSchedule(Schedule schedule);
    List<Schedule> mybslist(int pageNo, int pageSize);
    List<Schedule> findbydate(String no, String date);
    List<Schedule> findbyflag(String flag, int pageNo, int pageSize);
    void addStageSchedule(Schedule schedule);
    List<Schedule> mysslist(int no, int pageNo, int PageSize);
    Schedule myperdetail(int no);
    Schedule myreqdetail(int no);
    List<Schedule> chkStageDate(int no, String date);
    List<Schedule> findSuggestsbyflag(int no, int flag, int pageNo, int pageSize);
    List<Schedule> findunableSchedule(String date, int no);
    int removeStageDates(ArrayList<String> arr);
    int insertStageDates(List<Schedule> rlist);
    int deleteReqSchedule(int no);
    int deletePerSchedule(int no);
    List<Schedule> findFeedPerSchedule(int no);
    List<Schedule> findFeedFixSchedule(int no);
    Schedule showDatail(int no);
    List<Schedule> findTodaySchedule();
    List<Schedule> findTodaySchedule(String city);
    int consentapply(ArrayList<Integer> list);
    int refuseapply(ArrayList<Integer> list);
    List<Schedule> showpast(int no, String date);
    int checkperschedule(String sdt, String edt, int no);
    int checkreqschedule(String sdt, String edt, int no);
    int editperschedule(Schedule schedule);
    List<Schedule> showScedule();
    List<Integer> showSsnos(int no);
    List<Schedule> findPossibleStages(int no, String date);
    int ApplyStages(int no, String cont, String count, ArrayList<Integer>ssno);
    String weekOfAvi();
    List<Schedule> mybslistbyflag(int flag, int no, int pageNo, int pageSize);
    int checkeditperschedule(String sdt, String edt, String nsdt, String nedt, int no);
    int checkeditreqschedule(String sdt, String edt, String nsdt, String nedt, int no);
    List<Schedule> searchScehdule(String type, String keyword, String date);
}
