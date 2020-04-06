package net.zjitc.common.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016100100638659";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCY1Jpts5XmkrQOKEHocJvn4sslYOWLUjXZ0v731wkFJhCpSSOnoMWo9t65hPqeVPu1ebzn3QWG4Lzz2ZklvO4319ceYGZKB8LFHteBvFJpZzFmh+mXDU+nScIRU3BVcyx9nIN6YXx70CYq6dNDaoL3EFfxEEBXUNadftxMLtXYiVkdzMMbT1wDxIXkyDmrFmxAYNi1mAODdbXYHFG6Hoes8IE+VkeDp5Lg0/P/1vZXoy01uzkGnu/zX7PXrovVK969MQHhdmQrc8/aWJEXQVS+XLqPp1eqIxjMjdUpxwD3Scjl+BzG6fxZV8cP1vqBHtDtQcSiZt58Se3YGX9ffaf/AgMBAAECggEACA1jmZYVttFR9VD/r/yG6l/TrkN9tKp/NdvdHTfSPNg1loXJACMDZxSixYmRHtiBbp1ca6cEjIe4zOxRGmDq+DxCFFKl8Q6Zn4MxfZ9rhCwwuSM+FnxYDwte00TfLVFlLbUaZE9QnMFp0WcCf5HUFqpgx83AZhlXRXMSrlzlXYRBiGzSfCoa1XoPOFD+OT/k8sVSKR9KCIpjCVH58tH5gG6VsdqPgBQuOHRkkjyXzol0u1spqAMe0oMXy+Odhtu1qcqDZ06PnxigAQiTO/qKtTkjtWVdLBKjM46haM4lv/ygotqbFR/UCrfhBWB9pu3NBacKMqZuiXFAeqbjUkIuiQKBgQD//H5e/W7Xxlp7eD7rnfRvznXxVvFNTOMJ489s1k2FERe/J0l6tskeZlH5W2CwQMLhmqlNvrtB1gzA2ilwY2ceLDcO5Uw0uh7oI4GnPsaH0eS+KdfCZbUi0ZTRlFxJTpmOoE7UGJk6xJ3s1ssMbZXclxeOioP6qz5KFz13vVEQFQKBgQCY1rJWGwQaZrecq9WzmluTtlPQk41+QFP7YNaMmyqeo9jlpNuetoC4yX5rI0z5t5a65sXtHw4/c/+FREqnwNtTZb2WB1zAx4lQRlQdCMKp8qIs/ijzr/HCN6Fihc53cfI9ILjujHDYhfpyQwRwmlv0v2/WoEEbIhgsxK/+WvbIwwKBgGNWQFPsVQ820fYH+6LDcQ/SNsKo0osEwzYbSWsa3oo8z9JGFKWiOPmrCzSQ2TyMZRPXSMv6sAAkaF6OSnZqnKGA1vzYznHHqCa9YJreKXybXwDMjAXMIjaYzf9ma0mnTr+iRfTYdt3vXrmBwNnZzMYFfAa8ierEeS+XRSsqNELhAoGABIA+HD8LbeOcgKam0nU3QTBbY4cU4aTvVDXT26wuIyHcH1ctiI0DWW3FpU4S1D/N1o85QPRrLP8zhS8vq6UIUHpsjOCGoL6/knefvoMliG+2yvBpMFP8IKYWwJoELIxUf+xYxd2o7Rd0+qxykwZYsup4Vq+9exkT8S2RqUHwhpUCgYEAvLPqv2sqwAP//GGSWentSNWsWx2T37KU4VZfivntd/5AdsVGlSdPGRC+vyJfECJPicunfHrV4e0NTeu8pBy2kk753XZ5GGIFJpcSPEw2QQHFILLp3tHqEMC7yQ+o2fbbjXSE1nJwpG2jVS7SbdLcdh7y3r9vU5c8WjELE5Enap0=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjc7qqyWmfnSfyi+ZOcfigBbDND3ifUUA21G/6DpLk3XVVQ3ljsZRz4XLzslRvi+KKmKNZad/qkR5ktaFi7T9RmU10bCFL232Ex32fWqflyRcK5IXlBQyK8cz7/TZlnFVnkYV8/KnEkzZ4M1a8phPVvouQBFywajXP2dtlHugRU3ePaopCH/zBUtBsMOgdrh0/vjn9ToazwNCyzukvMJO2OKRN+0AD1CA9A2DfL6/iBAU0HH/HtkLQu4/kD+C+aaah+nYUvSs28/nArTnuNoneTLSi6OM9MvPNBS9FnUWXC9+mOuhwPTzL4VYMSZaezYjQho6SOX6PtezStfdJo7cJwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080//alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/payReturn.do";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

