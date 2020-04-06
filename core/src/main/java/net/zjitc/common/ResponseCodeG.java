package net.zjitc.common;

public enum ResponseCodeG {

    SUCCESS(0,"SUCCESS"),
    ERROR(1,"ERROR");
    private final String desc;

    private final int code;


    ResponseCodeG(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public int getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }






}
