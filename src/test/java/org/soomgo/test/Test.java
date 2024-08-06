package org.soomgo.test;

import org.junit.jupiter.api.extension.ExtendWith;
import org.soomgo.soomgo_project.mappers.TestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import javax.sql.DataSource;
import java.sql.Connection;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class Test {

    @Autowired
    DataSource dataSource;

    @Autowired(required = false)
    TestMapper testMapper;

    @org.junit.jupiter.api.Test
    public void test1(){
        System.out.println("테스트");
    }

    @org.junit.jupiter.api.Test
    public void testCon () throws Exception{

        Connection con = dataSource.getConnection();

        System.out.println(con);

        con.close();
    }

}
