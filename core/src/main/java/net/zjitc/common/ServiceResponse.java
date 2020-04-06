package net.zjitc.common;

public class ServiceResponse<T> {
    private int status;
    private String message;
    private T data;

    public ServiceResponse(int status) {
        this.status = status;
    }

    public ServiceResponse(int status, T data) {
        this.status = status;
        this.data = data;
    }

    public ServiceResponse(int status, String message) {
        this.status = status;
        this.message = message;
    }

    public ServiceResponse(int status, String message, T data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    public int getStatus() {
        return status;
    }

    public String getMessage() {
        return message;
    }

    public T getData() {
        return data;
    }
    /**
     * 响应成功
     * 响应状态
     */

    public static <T> ServiceResponse<T> createBySuccessStatus(){
        return new ServiceResponse<T>(ResponseCode.SUCCESS.getStatus());
    }

    /**
     * 响应成功
     *响应状态，响应消息
     */
    public static <T> ServiceResponse<T> createBySuccessAndMessage(String msg){
        return new ServiceResponse<T>(ResponseCode.SUCCESS.getStatus(),msg);
    }
    /**
     * 响应成功
     *响应状态，响应数据
     */
    public static <T> ServiceResponse<T> createBySuccessAndDate(T date){
        return new ServiceResponse<T>(ResponseCode.SUCCESS.getStatus(),date);
    }
    /**
     * 响应成功
     *响应状态，响应消息，响应数据
     */
    public static <T> ServiceResponse<T> createBySuccess(String msg, T date){
        return new ServiceResponse<T>(ResponseCode.SUCCESS.getStatus(),msg,date);
    }

    /**
     * 响应失败
     * 响应状态
     */
    public static <T> ServiceResponse<T> createByError(){
        return new ServiceResponse<T>(ResponseCode.ERROR.getStatus(),ResponseCode.ERROR.getName());
    }
    /**
     * 响应失败
     *响应状态，响应消息
     */
    public static <T> ServiceResponse<T> createByErrorMessage(String msg){
        return new ServiceResponse<T>(ResponseCode.ERROR.getStatus(),msg);
    }
    /**
     * 响应失败
     *响应状态，响应消息，响应数据
     */
    public static <T> ServiceResponse<T> createByErrorCodeMessage(int errorCode, String msg){
        return new ServiceResponse<T>(errorCode,msg);
    }

}
