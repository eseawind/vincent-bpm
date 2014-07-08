package com.fhd.bpm.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;


/**
 * SysRole entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "T_SYS_ROLE")
public class SysRole extends IdEntity implements java.io.Serializable {

	private static final long serialVersionUID = 9080021866738613391L;
	/**
	 * 角色编号.
	 */
	@Column(name = "ROLE_CODE", length = 20)
	private String roleCode;
	/**
	 * 角色名称.
	 */
	@Column(name = "ROLE_NAME", length = 30)
	private String roleName;
	/**
	 * 排序
	 */
	@Column(name = "ESORT")
	private Integer sort;
	/**
	 * 用户(多对多关系维护).
	 */
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "T_SYS_USER_ROLE", joinColumns = { @JoinColumn(name = "ROLE_ID", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "USER_ID", nullable = false, updatable = false) })
	private Set<SysUser> sysUsers = new HashSet<SysUser>(0);

	/**
	 * 权限(多对多关系维护).
	 */
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "T_SYS_ROLE_AUTHORITY", joinColumns = { @JoinColumn(name = "ROLE_ID", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "AUTH_ID", nullable = false, updatable = false) })
	private Set<SysAuthority> sysAuthorities = new HashSet<SysAuthority>(0);


	// Constructors

	/** default constructor */
	public SysRole() {
	}

	/** full constructor */
	public SysRole(String roleCode, String roleName) {
		this.roleCode = roleCode;
		this.roleName = roleName;
	}
	


	// Property accessors

	public String getRoleCode() {
		return this.roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Set<SysUser> getSysUsers() {
		return this.sysUsers;
	}

	public void setSysUsers(Set<SysUser> sysUsers) {
		this.sysUsers = sysUsers;
	}

	public Set<SysAuthority> getSysAuthorities() {
		return this.sysAuthorities;
	}

	public void setSysAuthorities(Set<SysAuthority> sysAuthorities) {
		this.sysAuthorities = sysAuthorities;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

}