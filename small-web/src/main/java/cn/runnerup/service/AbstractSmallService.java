package cn.runnerup.service;

import org.apache.commons.lang3.BooleanUtils;

import cn.runnerup.model.User;

public abstract class AbstractSmallService implements SmallService {

	public boolean validateUser(User user){
		if(BooleanUtils.isTrue(user.getDisabled()))
			return false;
		return true;
	}

	public User getUser() {
		SmallSession eapSession = getSession();
		if(eapSession != null) return eapSession.getUser();
		else return null;
	}

}
