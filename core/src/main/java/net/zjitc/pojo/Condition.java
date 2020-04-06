package net.zjitc.pojo;

/**
 * @Author admin
 * @Date 2019/4/8 10:20
 */
public class Condition {
    private String id;
    private String name;
    private Double minprice;
    private Double maxprice;
    private Integer cid;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getMinprice() {
        return minprice;
    }

    public void setMinprice(Double minprice) {
        this.minprice = minprice;
    }

    public Double getMaxprice() {
        return maxprice;
    }

    public void setMaxprice(Double maxprice) {
        this.maxprice = maxprice;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }
}
