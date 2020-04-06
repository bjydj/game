package net.zjitc.service.impl;

import net.zjitc.common.ServiceResponse;
import net.zjitc.mapper.NoticeMapper;
import net.zjitc.pojo.Notice;
import net.zjitc.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

/**
 * @Author admin
 * @Date 2019/5/15 11:18
 */
@Service
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    NoticeMapper noticeMapper;
    public List<Notice> findNotice() {
        return noticeMapper.selectByExample(null);
    }

    public int deleteNotice(int id) {
        return  noticeMapper.deleteByPrimaryKey(id);
    }

    public int addNotice(Notice notice) {
        notice.setnTime(new Date(System.currentTimeMillis()));
        int insert = noticeMapper.insert(notice);
        return insert;
    }

    public Notice findById(int id) {
        return noticeMapper.selectByPrimaryKey(id);
    }



    public ServiceResponse updateById(Notice notice) {
        int reultCount = noticeMapper.updateById(notice);
        if (reultCount>0){
            return ServiceResponse.createBySuccessAndMessage("修改成功");
        }
        return ServiceResponse.createByErrorMessage("修改失败");

    }
}
