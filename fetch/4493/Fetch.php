<?php

/**
 * Created by PhpStorm.
 * User: zhaohongyu
 * Date: 16/5/10
 * Time: 下午8:48
 */

require 'simple_html_dom.php';

class Fetch {
    private $html;

    public function __construct() {
        $this->html = new simple_html_dom();
    }

    public function fetch_4493($target_url) {
        $conn_res = $this->my_load_file($target_url);
        if ($conn_res) {
            return false;
        }
        $list = array();
        foreach ($this->html->find('div.piclist ul li') as $post) {
            $item['href']  = $this->get_referer($target_url) . $post->find('a', 0)->getAttribute('href');// 套图链接
            $item['cover'] = $post->find('a img', 0)->getAttribute('src');// 缩略图地址
            $item['title'] = mb_convert_encoding($post->find('a span', 0)->innertext, 'UTF-8', 'GB2312');// 标题
            $item['date']  = $post->find('.b1', 0)->innertext;// 上传日期
            $item['like']  = $post->find('.b2', 0)->innertext;// 喜欢人数
            $list[]        = $item;
        }
        $this->html->clear();
        return $list;
    }

    public function fetch_4493_single($target_url) {
        $conn_res = $this->my_load_file($target_url);
        if ($conn_res) {
            return false;
        }
        $href = '';
        $_obj = $this->html->find('div.picsboxcenter', 0);
        if (is_object($_obj)) {
            $obj  = $_obj->find('p img', 0);
            $href = '';
            if (is_object($obj)) {
                $href = $obj->getAttribute('src');
            }
        }
        $this->html->clear();
        return $href;
    }

    public function __destruct() {
        unset($this->html);
    }

    public function my_load_file($target_url) {
        $referer         = "Referer:{$this->get_referer($target_url)}\r\n";
        $USERAGENT       = "User-Agent:Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1\r\n";
        $ip              = $this->ip_generate();
        $x_forwarded_for = "X-FORWARDED-FOR:{$ip}\r\n";
        $clinet_ip       = "CLIENT-IP:{$ip}\r\n";
        $option          = array(
            'http' => array(
                'header'  => $referer . $USERAGENT . $x_forwarded_for . $clinet_ip,
                'timeout' => 8,// 单位秒
            ),
        );
        $cnt             = 0;
        $conn_res        = false;
        while (
            $cnt < 3
            && ($conn_res = $this->html->load_file($target_url, false, stream_context_create($option))) === FALSE) {
            $cnt++;
        }
        return $conn_res;
    }

    public function get_referer($target_url) {
        $arr = parse_url($target_url);
        return $arr['scheme'] . '://' . $arr['host'];
    }

    public function get_4493_sub_next_page($target_url) {
        $pos_start = strrpos($target_url, "/");
        $pos_end   = strrpos($target_url, ".htm");
        $page      = substr($target_url, $pos_start + 1, $pos_end - $pos_start - 1);
        $page++;
        $next_url = substr($target_url, 0, $pos_start + 1) . $page . '.htm';
        return $next_url;
    }

    private function ip_generate() {
        $ip0 = mt_rand(1, 255);
        $ip1 = mt_rand(1, 255);
        $ip2 = mt_rand(1, 255);
        $ip3 = mt_rand(1, 255);
        return "{$ip0}.{$ip1}.{$ip2}.{$ip3}";
    }

}