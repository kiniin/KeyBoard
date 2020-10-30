package javaservlet.dao;

import javaservlet.vo.User;

import java.util.HashMap;

public interface UserDAO {
    public int queryByUsername(User user) throws Exception;
    public HashMap<String,String> getUserinfo(String account) throws Exception;
    public int checkByQuestion(User user) throws Exception;
    public int ChangePassword(User user) throws Exception;
    public int ChangeDetailed(User user) throws Exception;
}
