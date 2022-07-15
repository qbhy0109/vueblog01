package com.markerhub;

import com.google.gson.Gson;
import com.markerhub.util.MailUtil;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class VueblogApplicationTests {

    @Test
    void testMailUtil() throws Exception{
        MailUtil.sendMail("3100954150@qq.com", "hello","this is a test!");
    }

}

















