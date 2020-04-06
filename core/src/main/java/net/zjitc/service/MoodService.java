package net.zjitc.service;

import net.zjitc.pojo.Mood;

import java.util.List;

public interface MoodService {

    List<Mood> findMoodByid(int pid);

    int addMood(Mood mood);
}
