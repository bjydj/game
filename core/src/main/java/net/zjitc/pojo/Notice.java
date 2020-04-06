package net.zjitc.pojo;


import java.sql.Date;

public class Notice {
    private Integer nId;

    private String title;

    private String details;

    private Date nTime;

    public Integer getnId() {
        return nId;
    }

    public void setnId(Integer nId) {
        this.nId = nId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details == null ? null : details.trim();
    }

    public Date getnTime() {
        return nTime;
    }

    public void setnTime(Date nTime) {
        this.nTime = nTime;
    }
}