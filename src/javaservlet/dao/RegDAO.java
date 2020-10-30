package javaservlet.dao;

import javaservlet.vo.User;

public interface RegDAO {
    public int CreateUserinfo(User user) throws Exception;
    public int queryAccount(String account) throws Exception;
    public int CreateDetailed(int userNo) throws Exception;
    public int queryUserNo(String account) throws Exception;
}
