package net.zjitc.service;

import net.zjitc.common.ServiceResponse;
import net.zjitc.pojo.Notice;

import java.util.List;

/**
 * @Author admin
 * @Date 2019/5/15 11:18
 */
public interface NoticeService {
    List<Notice>findNotice();

    int deleteNotice(int id);

    int addNotice(Notice notice);

    Notice findById(int id);

    ServiceResponse updateById(Notice notice);

}
