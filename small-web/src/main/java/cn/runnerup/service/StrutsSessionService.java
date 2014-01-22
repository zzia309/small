package cn.runnerup.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import cn.runnerup.model.User;

import com.opensymphony.xwork2.ActionContext;

@Service
public class StrutsSessionService extends AbstractSmallService implements SmallService {

	public SmallSession login(User user) throws Exception {
		Map<String, Object> session = getContextSession();
		if(session == null)
			throw new Exception("Get context session error!");
		SmallSession eapSession = createSession(user);
		session.put(SESSION_KEY, eapSession);
		return eapSession;
	}

	public void logout() {
		Map<String, Object> session = getContextSession();
		if(session != null) {
			SmallSession eapSession = (SmallSession) session.get(SESSION_KEY);
			if(eapSession != null) {
				session.remove(SESSION_KEY);
			}
		}
	}

	public SmallSession getSession() {
		Map<String, Object> httpSession = getContextSession();
		return (SmallSession) httpSession.get(SESSION_KEY);
	}

	private Map<String, Object> getContextSession() {
		ActionContext ctx = ActionContext.getContext();
		if(ctx != null) return ctx.getSession();
		else return null;
	}

	private SmallSession createSession(User user) {
		SmallSession session = new SmallSession();
		session.setUser(user);
		return session;
	}

}
