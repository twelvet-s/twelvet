package com.twelvet;

import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 获取Secret安全码
 */
public class Secret {

    @Test
    public void getSecret(){
        System.out.println(
                new BCryptPasswordEncoder()
                        .encode("123456")
        );
    }

}
