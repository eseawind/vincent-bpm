package com.fhd.bpm.webservice.rest;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by vincent on 2014/6/10.
 */
@XmlRootElement(name = "User")
public class UserDTO {

    private String id;

    private String username;

    private String realname;

    private String userStatus;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }
}
