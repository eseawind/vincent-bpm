package com.fhd.bpm.web;

import com.fhd.bpm.modules.test.security.shiro.ShiroTestUtils;
import com.fhd.bpm.service.ProcessService;
import com.fhd.bpm.service.ShiroDbRealm.ShiroUser;
import com.fhd.bpm.webservice.soap.response.dto.TaskDto;
import org.apache.shiro.SecurityUtils;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import java.util.ArrayList;

import static org.hamcrest.Matchers.hasSize;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

public class TaskControlTest {

    private MockMvc mockMvc;

    @Mock
    private ProcessService mockProcessService;

    @InjectMocks
    private TaskControl taskControl;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
        /*
         * 如果要使用完全默认Spring Web Context, 例如不需要对Controller注入,则使用 WebApplicationContext mockMvc =
         * MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
         */
        // mockMvc = MockMvcBuilders.standaloneSetup(categoryController).build();
        mockMvc = MockMvcBuilders.standaloneSetup(taskControl).build();
        ShiroTestUtils.mockSubject(new ShiroUser("admin","admin","admin"));
    }

    @Test
    public void testList() throws Exception {
        ShiroUser shiroUser =  (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        Mockito.when(mockProcessService.findUserTaskList(shiroUser.getUserId())).thenReturn(new ArrayList<TaskDto>());

        mockMvc.perform(get("/task/list").param("userId","admin"))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(view().name("task/list"))
                .andExpect(model().attribute("list", hasSize(0)));
        Mockito.verify(mockProcessService).findUserTaskList(shiroUser.getUserId());

    }
}