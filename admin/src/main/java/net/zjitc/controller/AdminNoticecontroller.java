package net.zjitc.controller;

import net.zjitc.common.ServiceResponse;
import net.zjitc.pojo.Notice;
import net.zjitc.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/notice")
public class AdminNoticecontroller {
    @Autowired
    NoticeService noticeService;

    @RequestMapping("/findAll")
    public String findAll(Model model){
        List<Notice> notice = noticeService.findNotice();
        model.addAttribute("list",notice);
        return "/admin/notices/list";
    }

    /*删除公告*/
    @RequestMapping("/deleteNotice")
    public String deleteNotice(int id,Model model){
        int deleteNotice = noticeService.deleteNotice(id);
        return "redirect:/notice/findAll.do";
    }

    @RequestMapping("/addNotice")
    public String addNotice(Notice notice,Model model){
        int addNotice = noticeService.addNotice(notice);
        return "redirect:/notice/findAll.do";
    }

    @RequestMapping("/findById")
    public String findById(int id,Model model){
        Notice byId = noticeService.findById(id);
        model.addAttribute("notice",byId);
        return "/admin/notices/edit";
    }

    @RequestMapping("/editNotice")
    @ResponseBody
    public ServiceResponse editNotice(@RequestBody Notice notice){
        ServiceResponse serviceResponse = noticeService.updateById(notice);
        return serviceResponse;
    }
}
