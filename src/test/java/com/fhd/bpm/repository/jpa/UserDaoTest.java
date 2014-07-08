package com.fhd.bpm.repository.jpa;

import static org.assertj.core.api.Assertions.*;

import com.fhd.bpm.entity.SysUser;
import com.fhd.bpm.modules.test.spring.SpringTransactionalTestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ContextConfiguration;


@DirtiesContext
@ContextConfiguration(locations = { "/spring-config.xml" })
public class UserDaoTest extends SpringTransactionalTestCase {

    @Autowired
    private UserDao userDao;

    @Test
    public void testFindByUsername() throws Exception {

        SysUser sysUser = userDao.findByUsername("admin");
        assertThat(sysUser).isNotNull();

        Iterable<SysUser> users = userDao.findAll();
        assertThat(users).hasSize(319);

    }
}