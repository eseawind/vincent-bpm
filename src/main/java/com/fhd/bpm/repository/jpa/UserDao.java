package com.fhd.bpm.repository.jpa;

import com.fhd.bpm.entity.SysUser;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by vincent on 2014/5/30.
 */
public interface UserDao extends PagingAndSortingRepository<SysUser, String>, JpaSpecificationExecutor<SysUser> {

    public SysUser findByUsername(String username);

}
