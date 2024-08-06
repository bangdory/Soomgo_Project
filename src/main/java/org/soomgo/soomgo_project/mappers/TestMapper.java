package org.soomgo.soomgo_project.mappers;

import org.apache.ibatis.annotations.Select;

public interface TestMapper {

    @Select("select now()")
    String gettime();

    String getTime2();
}
