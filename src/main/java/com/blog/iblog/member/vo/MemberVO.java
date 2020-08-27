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

    private String authority;
    private String email;
    private boolean enabled;
    private String id;
    private String name;
    private String password;
    private String runblog;
    
   

	@Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(authority));
        return auth;
    }

	public String getEmail() {
		return email;
	}

	public String getId() {
		return id;
	}

	public String getName() {
        return name;
    }

	@Override
    public String getPassword() {
        return password;
    }

	public String getPwd() {
		return password;
	}

	public String getRunblog() {
		return runblog;
	}
	
	@Override
    public String getUsername() {
        return id;
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
 
    public void setAUTHORITY(String authority) {
		this.authority = authority;
	}
 
    public void setEmail(String email) {
		this.email = email;
	}
    
    public void setENABLED(boolean enabled) {
		this.enabled = enabled;
	}
 
    public void setId(String id) {
		this.id = id;
	}
 
    public void setName(String name) {
        this.name = name;
    }
 
    public void setPassword(String password) {
		this.password = password;
	}
 
    public void setPASSWORD(String password) {
		this.password = password;
	}
    
    public void setRunblog(String runblog) {
		this.runblog = runblog;
	}
 
    public void setUsername(String id) {
    	this.id = id;
    }
 
}

	
	
