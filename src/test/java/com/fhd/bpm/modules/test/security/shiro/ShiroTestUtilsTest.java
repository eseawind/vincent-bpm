package com.fhd.bpm.modules.test.security.shiro;

import static org.assertj.core.api.Assertions.*;

import org.apache.shiro.SecurityUtils;
import org.junit.Test;

public class ShiroTestUtilsTest {

	@Test
	public void testMockSubject() {
		ShiroTestUtils.mockSubject("foo");
		assertThat(SecurityUtils.getSubject().isAuthenticated()).isTrue();
		assertThat(SecurityUtils.getSubject().getPrincipal()).isEqualTo("foo");

		ShiroTestUtils.clearSubject();

		ShiroTestUtils.mockSubject("bar");
		assertThat(SecurityUtils.getSubject().isAuthenticated()).isTrue();
		assertThat(SecurityUtils.getSubject().getPrincipal()).isEqualTo("bar");

	}

}
