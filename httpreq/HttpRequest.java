package httpreq;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;

public class HttpRequest {

    public static void main(String[] args) {
        //String url = "http://admin.honlytech.com/api.php";
        String url = "http://mybearbaby.com/api.php";
        String requestParam = "{    \"action\": \"sendMessage\",    \"clientType\": \"iphone\",    \"clientVersion\": \"1.0\",    \"deviceId\": \"a52bb12d9a4dddedf7e8e538c3cb908e\",    \"messages_info\": \"测试发送一条消息\",    \"messages_type\": \"0\",    \"picture_ids\": \"1,2,3\",    \"tag_list\": [        {            \"tag_name\": \"我是标签1\",            \"tag_url\": \"http://admin.honlytech.com/Uploads/Picture/2015-09-29/560a3aeba8898.jpg\",            \"tag_x\": \"123\",            \"tag_y\": \"456\"        },        {            \"tag_name\": \"我是标签2\",            \"tag_url\": \"http://admin.honlytech.com/Uploads/Picture/2015-09-29/560a3aeba8898.jpg\",            \"tag_x\": \"443\",            \"tag_y\": \"222\"        }    ],    \"token\": \"u0GZubrAbnHVBotz9250biNXtOuaXpj5\",    \"topic_list\": [        {            \"topic_content\": \"我是话题1\"        },        {            \"topic_content\": \"我是话题2\"        }    ],    \"userId\": \"1\",    \"userName\": \"test\"}";
        //发送 GET 请求
        String s = HttpRequest.sendGet(url, "requestParam=" + requestParam);
        System.out.println("发送 GET 请求后的返回结果是：" + s);
        //发送 POST 请求
        //String sr = HttpRequest.sendPost(url, requestParam);
        //System.out.println("发送 Post 请求后的返回结果是：" + sr);
    }

    /**
     * 向指定URL发送GET方法的请求
     *
     * @param url 发送请求的URL
     * @param param 请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return URL 所代表远程资源的响应结果
     */
    public static String sendGet(String url, String param) {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = url + "?" + param;
            System.out.println("发送 GET 请求拼接的URL地址：" + urlNameString);
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        } // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }

    /**
     * 向指定 URL 发送POST方法的请求
     *
     * @param url 发送请求的 URL
     * @param param 请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return 所代表远程资源的响应结果
     */
    public static String sendPost(String url, String param) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection conn = realUrl.openConnection();
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(conn.getOutputStream());
            // 发送请求参数
            out.print(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送 POST 请求出现异常！" + e);
            e.printStackTrace();
        } //使用finally块来关闭输出流、输入流
        finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }
}
