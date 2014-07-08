package com.fhd.bpm.service;

import static org.assertj.core.api.Assertions.*;

import com.fhd.bpm.entity.SysUser;
import com.fhd.bpm.repository.jpa.UserDao;
import com.fhd.core.utils.Identities;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;

public class UserServiceTest {

    @InjectMocks
    private UserService userService;

    @Mock
    private UserDao mockUserDao;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void testLogin() throws Exception {
        SysUser sysUser = new SysUser();
        sysUser.setId(Identities.uuid());
        sysUser.setUsername("admin");
        sysUser.setPassword("admin");
        // 把mockUserDao.findByUsername mock掉，就是忽略掉
        Mockito.when(mockUserDao.findByUsername("admin")).thenReturn(sysUser);
        SysUser loginUser = userService.login("admin");
        // 验证被忽略掉的方法是否被调用
        Mockito.verify(mockUserDao).findByUsername("admin");
        assertThat(loginUser).isEqualTo(sysUser);

    }
}