package com.blog.iblog.member.vo;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

@SuppressWarnings("serial")
@Component("memberVO")
public class MemberVO implements UserDetails {

    private String id;
    private String password;
    private String name;
    private String email;
    private String authority;
    private boolean enabled;
    private String runblog;
    
   

	public String getRunblog() {
		return runblog;
	}

	public void setRunblog(String runblog) {
		this.runblog = runblog;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setPASSWORD(String password) {
		this.password = password;
	}

	public void setAUTHORITY(String authority) {
		this.authority = authority;
	}

	public void setENABLED(boolean enabled) {
		this.enabled = enabled;
	}

	public String getId() {
		return id;
	}
	
	public String getPwd() {
		return password;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(authority));
        return auth;
    }
 
    @Override
    public String getPassword() {
        return password;
    }
 
    @Override
    public String getUsername() {
        return id;
    }
    
    public void setUsername(String id) {
    	this.id = id;
    }
 
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }
 
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }
 
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }
 
    @Override
    public boolean isEnabled() {
        return enabled;
    }
    
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
 
}

	
	
