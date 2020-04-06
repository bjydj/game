package net.zjitc.common;


public enum ResponseCode {
    SUCCESS(0,"SUCCESS"),
    ERROR(1,"ERROR"),
    ILLEGAL_ARGUMENT(2,"ILLEGAL_ARGUMENT");
    private final int status;
    private final String name;

    ResponseCode(int status, String name) {
        this.status = status;
        this.name = name;
    }

    public int getStatus() {
        return status;
    }

    public String getName() {
        return name;
    }
}
