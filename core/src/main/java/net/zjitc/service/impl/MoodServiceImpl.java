package net.zjitc.service.impl;

import net.zjitc.mapper.MoodMapper;
import net.zjitc.pojo.Mood;
import net.zjitc.pojo.MoodExample;
import net.zjitc.service.MoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MoodServiceImpl implements MoodService {
    @Autowired
    MoodMapper moodMapper;


    public List<Mood> findMoodByid(int pid) {
        MoodExample moodExample = new MoodExample();
        MoodExample.Criteria criteria = moodExample.createCriteria();
        criteria.andPidEqualTo(pid);
        List<Mood> moods = moodMapper.selectByExample(moodExample);
        return moods;
    }

    public int addMood(Mood mood) {

        return moodMapper.insert(mood);
    }
}
