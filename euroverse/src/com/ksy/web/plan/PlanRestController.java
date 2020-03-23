package com.ksy.web.plan;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ksy.service.domain.Offer;
import com.ksy.service.domain.Party;
import com.ksy.service.domain.Plan;
import com.ksy.service.domain.Push;
import com.ksy.service.domain.Todo;
import com.ksy.service.domain.User;
import com.ksy.service.myPage.MyPageService;
import com.ksy.service.plan.PlanService;
import com.ksy.service.planSub.PlanSubService;
import com.ksy.service.push.PushService;
import com.ksy.service.user.UserService;

@RestController
@RequestMapping("/plan/*")
public class PlanRestController {
	
	@Autowired
	@Qualifier("planServiceImpl")
	private PlanService planService;
	
	@Autowired
	@Qualifier("planSubServiceImpl")
	private PlanSubService planSubService;
	
	@Autowired
	@Qualifier("pushServiceImpl")
	private PushService pushService;
	
	@Autowired
	@Qualifier("myPageServiceImpl")
	private MyPageService myPageService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public PlanRestController() {
		System.out.println(this.getClass());
	}
	
	
	

	
	
//	@RequestMapping( value = "json/updateUserSlot/{userId}", method = RequestMethod.GET )
//	public void updateUserSlot( @PathVariable String userId ) throws Exception {
//		
//		myPageService.updateUserSlot(userId);
//	}
	
	
//	@RequestMapping( value = "json/getPlanPartyList/{planId}", method = RequestMethod.GET )
//	public List<User> getPlanPartyList( @PathVariable String planId ) throws Exception {
//		
//		List<User> planPartyList = planService.getPlanPartyList(planId);
//		
//		return planPartyList;
//	}
	
	/* PlanController�� �̵�! */
//	@RequestMapping( value = "json/deletePlanParty/{planId}/{userId}", method = RequestMethod.GET )
//	public List<User> deletePlanParty( @PathVariable String planId, @PathVariable String userId ) throws Exception {
//		
//		Party party = new Party();
//		party.setRefId(planId);
//		party.setPartyUserId(userId);
//		
//		planService.deletePlanParty(party);
//		
//		List<User> planPartyList = planService.getPlanPartyList(planId);
//		return planPartyList;
//	}
	
	/* findUser...? Plan��Ʈ�ѷ��� ��ġ�ϴ°� �´°� */
	@RequestMapping( value = "json/findUser/{planId}/{userId}", method = RequestMethod.GET )
	public String[] findUser( @PathVariable String planId, @PathVariable String userId ) throws Exception {
		
		String findUserId[] = new String[2];
		
		findUserId[0] = "A";
		findUserId[1] = userService.findUserId(userId);
		
		Party party = new Party();
		party.setRefId(planId);
		party.setPartyUserId(userId);
		
		if( findUserId[1] != null ) {	//DB�� ��ϵ� ȸ��(����ȸ��)
			String checkUserId = planService.checkUserFromParty(party);
			if( checkUserId != null ) {	//�÷��� ��Ƽ �����Ͽ� ����
				findUserId[1] += " ���� �̹� �÷��ʿ� �������� ����Դϴ�.";
				findUserId[0] = "X";
			}
			// else => �÷��ʿ� ���������� ȸ���� :: �ʴ��� �� ���� !
			// return findUserId(ȸ�����̵�)
		}else {						//DB�� ����(�̰���)
			findUserId[1] = userId+" ���� ã�� �� �����ϴ�.";
			findUserId[0] = "X";
		}
		
		return findUserId;
	}
	
	@RequestMapping( value = "json/addOffer", method = RequestMethod.POST )
	public String addOffer( @RequestBody Offer offer, HttpSession session ) throws Exception {
		
		User user = (User)session.getAttribute("user");
		offer.setFromUserId(user.getUserId());
		
		planService.addOffer(offer);
		
		/* �÷��� �ʴ� push �ϱ� method */
		Push push = new Push();
		push.setPushType("I");
		push.setRefId(offer.getRefId());
		push.setReceiverId(offer.getToUserId());
		pushService.addPush(push);
		
		return offer.getToUserId();
	}
	
	
	@RequestMapping( value = "json/checkPlanCount/{userId}", method = RequestMethod.GET )
	public int checkPlanCount( @PathVariable String userId ) throws Exception {
		
		 int planCount = planService.getPlanCount( userId );
		 return planCount;
	}
	
	
	
	@RequestMapping( value = "json/getTodoList/{planId}", method = RequestMethod.GET )
	public List<Todo> getTodoList( @PathVariable String planId ) throws Exception {
		
		List<Todo> todoList = planService.getTodoList(planId);
		return todoList;
	}
	
	/* checkTodo & updateTodoName �޼ҵ� ���� SQL�� ���̳������� �����! */
	@RequestMapping( value = "json/checkTodo", method = RequestMethod.POST )
	public void checkTodo( @RequestBody Todo todo ) throws Exception {
		
		planService.checkTodo(todo);
	}
	
	@RequestMapping( value = "json/addTodo", method = RequestMethod.POST )
	public Todo addTodo( @RequestBody Todo todo ) throws Exception {
		
		planService.addTodo(todo);	//todo ��� ��
		
		List<Todo> todoList = planService.getTodoList(todo.getPlanId());	// ����Ʈ ��˻��ؼ� �ٽ� �ѷ��ֱ�!
		return todoList.get(todoList.size()-1);
	}
	
	@RequestMapping( value = "json/deleteTodo/{todoId}", method = RequestMethod.GET )
	public void deleteTodo( @PathVariable String todoId ) throws Exception {
		
		planService.deleteTodo(todoId);
	}
	
//	@RequestMapping( value = "json/updateTodoName/{todoName}/{todoId}", method = RequestMethod.GET )
//	public void updateTodoName( @PathVariable String todoName, @PathVariable String todoId ) throws Exception {
//		
//		Todo todo = new Todo();
//		todo.setTodoName(todoName);
//		todo.setTodoId(todoId);
//		
//		planService.updateTodoName(todo);
//	}
	

//	@RequestMapping( value = "json/getPlan/{planId}", method = RequestMethod.GET )
//	public Plan getPlan( @PathVariable String planId ) throws Exception {
//		
//		Plan plan = planService.getPlan(planId);
//		//������.............������..?
//		User planMaster = new User();
//		planMaster.setUserId(plan.getPlanMaster().getUserId());
//		planMaster.setSlot(3);
//		plan.setPlanMaster(planMaster);
//		return plan;
//	}
	
}
