package net.zjitc.controller;

import net.zjitc.pojo.Mood;
import net.zjitc.pojo.Product;
import net.zjitc.service.MoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/mood")
public class Moodcontroller {
@Autowired
    MoodService moodService;

@RequestMapping("/findMoodByid")
    public String findMoodByid(HttpSession session, int pid, Model model){
    List<Mood> findMoodByid =moodService.findMoodByid(pid);
    model.addAttribute("comment",findMoodByid);
    return "/client/preview";
}
    @RequestMapping("/addMood")
    public String addNotice(Mood mood, Model model,String textArea,HttpSession session){
        Product poc = (Product) session.getAttribute("poc");
        String login = (String) session.getAttribute("login");
        mood.setPid(poc.getId());
        mood.setUsername(login);
        mood.setMesg(textArea);
        int addMood = moodService.addMood(mood);
        return "redirect:/mood/findMoodByid.do?pid="+poc.getId();
    }
}
