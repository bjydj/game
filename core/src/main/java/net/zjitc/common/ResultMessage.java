package net.zjitc.common;

public class ResultMessage<T> {
    private int status;
    private String message;
    private T date;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    private ResultMessage(int status){
        this.status = status;
    }
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }


    private ResultMessage(int status, String message) {
        this.status = status;
        this.message = message;
    }

    private ResultMessage(int status, T date) {
        this.status = status;
        this.date = date;
    }

    private ResultMessage(int status, String message, T date) {
        this.status = status;
        this.message = message;
        this.date = date;
    }

    public static ResultMessage createSuccessMessage(String message){
       return new ResultMessage(ResponseCodeG.SUCCESS.getCode(),message);
    }



    public static<T> ResultMessage<T> createSuccessDate(T date){
        return new ResultMessage(ResponseCodeG.SUCCESS.getCode(),date);
    }

    public static ResultMessage createErrorMessage(String message){
        return new ResultMessage(ResponseCodeG.ERROR.getCode(),message);
    }


}
