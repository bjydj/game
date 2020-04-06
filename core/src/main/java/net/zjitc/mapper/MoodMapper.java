package net.zjitc.mapper;

import java.util.List;
import net.zjitc.pojo.Mood;
import net.zjitc.pojo.MoodExample;
import org.apache.ibatis.annotations.Param;

public interface MoodMapper {
    int countByExample(MoodExample example);

    int deleteByExample(MoodExample example);

    int deleteByPrimaryKey(Integer mid);

    int insert(Mood record);

    int insertSelective(Mood record);

    List<Mood> selectByExample(MoodExample example);

    Mood selectByPrimaryKey(Integer mid);

    int updateByExampleSelective(@Param("record") Mood record, @Param("example") MoodExample example);

    int updateByExample(@Param("record") Mood record, @Param("example") MoodExample example);

    int updateByPrimaryKeySelective(Mood record);

    int updateByPrimaryKey(Mood record);
}