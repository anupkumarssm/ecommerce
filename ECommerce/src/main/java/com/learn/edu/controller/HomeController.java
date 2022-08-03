package com.learn.edu.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.learn.edu.dao.HomeDao;
import com.learn.edu.entity.Cart;
import com.learn.edu.entity.Category;
import com.learn.edu.entity.ChallangeCount;
import com.learn.edu.entity.ChallengeTime;
import com.learn.edu.entity.Orderitem;
import com.learn.edu.entity.QAnswer;
import com.learn.edu.entity.Question;
import com.learn.edu.entity.QuestionAnswer;
import com.learn.edu.entity.SubCategory;
import com.learn.edu.repository.CartRepository;
import com.learn.edu.repository.CategoryRepository;
import com.learn.edu.repository.ChallangeCountRepository;
import com.learn.edu.repository.ChallengeTimeRepository;
import com.learn.edu.repository.OrderitemRepository;
import com.learn.edu.repository.QAnswerRepository;
import com.learn.edu.repository.QuestionAnswerRepository;
import com.learn.edu.repository.QuestionRepository;
import com.learn.edu.repository.SubCategoryRepository;

@Controller
public class HomeController {

	@Autowired
	CategoryRepository categoryRepository;
	@Autowired
	SubCategoryRepository subCategoryRepository;
	@Autowired
	QAnswerRepository qAnswerRepository;
	@Autowired
	QuestionAnswerRepository questionAnswerRepository;
	@Autowired
	QuestionRepository questionRepository;
	@Autowired
	ChallangeCountRepository challangeCountRepository;
	@Autowired
	ChallengeTimeRepository challengeTimeRepository;
	@Autowired
	CartRepository cartRepository;
	@Autowired
	OrderitemRepository orderitemRepository;
	
	@Autowired
	HomeDao homeDao;

	@RequestMapping(value = "/home")
	public String home(Model model,HttpServletRequest req) {
		model.addAttribute("subCIDMap", subCategoryRepository.findOnlyOneQuestionId());
		model.addAttribute("categories", categoryRepository.findAll());
		model.addAttribute("subCategories", subCategoryRepository.allSubCategory());
		model.addAttribute("status",req.getSession().getAttribute("status"));
		req.getSession().removeAttribute("status");
		System.out.println("SESSION_ID==="+req.getSession().getId());
		return "home";
	}
	
	@RequestMapping(value = "/products")
	public String products(Model model,HttpServletRequest req) {
		model.addAttribute("categories", categoryRepository.findByStatus(0));
		model.addAttribute("subCategories", subCategoryRepository.allSubCategory());
		model.addAttribute("status", req.getSession().getAttribute("status"));
		req.getSession().removeAttribute("status");
		return "products";
	}
	
	@RequestMapping(value = "/subproducts")
	public String subproducts(Model model,HttpServletRequest req) {
		try {
			int id = Integer.parseInt(req.getParameter("id")); 
			model.addAttribute("categories", subCategoryRepository.getSubCategory(id));
			model.addAttribute("status", req.getSession().getAttribute("status"));
			String username = req.getUserPrincipal().getName();
			model.addAttribute("cartItemCount", cartRepository.getCartItemCountByUsername(username));
			req.getSession().removeAttribute("status");
		} catch (Exception e) {
			return "redirect:/login";
		}
		
		return "subproducts";
	}
	
	@RequestMapping(value = "/productdetails")
	public String productdetails(Model model,HttpServletRequest req) {
		int id = Integer.parseInt(req.getParameter("id")); 
		model.addAttribute("product", subCategoryRepository.getProductById(id));
		model.addAttribute("status", req.getSession().getAttribute("status"));
		req.getSession().removeAttribute("status");
		return "productdetails";
	}
	
	@ResponseBody
	@RequestMapping(value = "/addtocart")
	public int addtocart(Model model,HttpServletRequest req,Cart cart) {
    System.out.println(req.getParameter("pid"));
//   Cart cart = new Cart();
//		cart.setPname(req.getParameter("pname"));
//		cart.setPprice(req.getParameter("pprice"));
//		cart.setPqty(req.getParameter("pqty"));
//		cart.setPimg(req.getParameter("pimg"));
		cart.setUsername(req.getUserPrincipal().getName());
		cart.setStatus(1);
		String username = req.getUserPrincipal().getName(); 
		int c = cartRepository.findByPidCount(cart.getPid(),username);
		if(c == 0) {
			cartRepository.save(cart);
		}else {
			return -1;
		} 
		return cartRepository.getCartItemCountByUsername(username);
	}
	
	@RequestMapping(value = "/cart")
	public String cart(Model model,HttpServletRequest req) {
		String username = req.getUserPrincipal().getName();
		System.out.println("username==="+username);
		model.addAttribute("cartList", cartRepository.getCartDetailsByUsername(username));
		model.addAttribute("cartItemCount", cartRepository.getCartItemCountByUsername(username));
		return "cart";
	}
	@ResponseBody
	@RequestMapping(value="/checkoutitems",method=RequestMethod.POST)
	public int  getSearchUserProfiles(HttpServletRequest req,@RequestBody Orderitem[] orderitem) {
		try {
			String username = req.getUserPrincipal().getName();
			Random rand = new Random(); 
			int rand1 = rand.nextInt(1250);  
			for (Orderitem ord: orderitem) {
				ord.setUsername(username);
				ord.setOrderno("#ORDER"+rand1);
				orderitemRepository.save(ord);
				Cart c = cartRepository.findById(Integer.parseInt(ord.getPid())).get();
				c.setStatus(0);
				cartRepository.save(c);
				System.out.println(c);
		    }   
			return 1; 
		} catch (Exception e) {
			return 0; 
		}
		
	   }	 

	
//	
//	@RequestMapping(value = "/challenge")
//	public String challenge(Model model,HttpServletRequest req) {
//		model.addAttribute("subCIDMap", subCategoryRepository.findOnlyOneQuestionId());
//		model.addAttribute("categories", categoryRepository.findAll());
//		model.addAttribute("subCategories", subCategoryRepository.allSubCategory());
//		model.addAttribute("status",req.getSession().getAttribute("status"));
//		req.getSession().removeAttribute("status");
//		System.out.println("SESSION_ID==="+req.getSession().getId());
//		
//		List<Map<String,Object>> list= challangeCountRepository.findBySessionid(req.getSession().getId());
//		System.out.println("---"+list);
//		challangeCountRepository.deleteBySessionid(req.getSession().getId());
//		challengeTimeRepository.deleteBySessionid(req.getSession().getId());
//		
//		return "challenge";
//	}
//	
//	
//
//	@Secured("ROLE_ADMIN")
//	@RequestMapping(value = "/questions")
//	public String question(Model model,HttpServletRequest req) {
//
//		model.addAttribute("categories", categoryRepository.findAll());
//		model.addAttribute("status",req.getSession().getAttribute("status")); 
//		return "Admin/questions";
//	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "category", method = RequestMethod.GET)
	public String category(Model model,HttpServletRequest req) {
		model.addAttribute("categories", categoryRepository.findAll());
		model.addAttribute("category", "CATEGORY");
		model.addAttribute("subCategory", null);
		model.addAttribute("status",req.getSession().getAttribute("status"));
		req.getSession().removeAttribute("status");
		return "Admin/category";
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "add-category", method = RequestMethod.POST)
	public String addLebel(Category category,HttpServletRequest req) {
		category = categoryRepository.save(category);
		
		 MultipartFile productImage = category.getProductImage();
	        try {
	            byte[] bytes = productImage.getBytes();
	            String imageExt = "cat_"+category.getId() + ".jpg";
	            category.setImage(imageExt);
	            categoryRepository.save(category);
	            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File("src/main/resources/catimg/"+imageExt)));
	            stream.write(bytes);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        
		req.getSession().setAttribute("status","1"); 
		return "redirect:category";
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "category-product", method = RequestMethod.GET)
	public String subCatery(HttpServletRequest req, Model model) {
		model.addAttribute("category", "SUB-CATEGORY");
		model.addAttribute("subCategory", null);
		model.addAttribute("allCategories", categoryRepository.findAll());
		model.addAttribute("subcategories", subCategoryRepository.findAllCategyWithSubCategory());
		model.addAttribute("status",req.getSession().getAttribute("status"));
		req.getSession().removeAttribute("status");
		return "Admin/categoryproduct";
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "add-sub-category", method = RequestMethod.POST)
	public String addSubCatery(HttpServletRequest req) {
		SubCategory subCategory = new SubCategory();
		String name = req.getParameter("name");
		String price = req.getParameter("price");
		String description = req.getParameter("description");
		String cid = req.getParameter("category_id");
		String sid = req.getParameter("id");
		subCategory.setPrice(price);
		subCategory.setDescription(description);
		//System.out.println("----" + sid);
		if (sid.equals("0")) {
		} else {
			subCategory.setId(Integer.parseInt(sid));
		}
		subCategory.setName(name);
		subCategory.setCategoryId(Integer.parseInt(cid));
		subCategoryRepository.save(subCategory);
		req.getSession().setAttribute("status","1"); 
		return "redirect:category-product";
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "delete-category", method = RequestMethod.GET)
	public String deleteCatery(HttpServletRequest req, Model model) {
		int id = Integer.parseInt(req.getParameter("id"));
		categoryRepository.deleteById(id);
		req.getSession().setAttribute("status","0"); 
		return "redirect:category";
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "delete-sub-category", method = RequestMethod.GET)
	public String deleteSubCatery(HttpServletRequest req, Model model) {
		int id = Integer.parseInt(req.getParameter("id"));
		subCategoryRepository.deleteById(id);
		req.getSession().setAttribute("status","0"); 
		return "redirect:category-product";
	}

	@ResponseBody
	@RequestMapping(value = "/get-sub-category")
	public List<Map<String, Object>> getSubCategory(HttpSession session, HttpServletRequest req, Model model)
			throws Exception {
		String categoryId = req.getParameter("categoryId");
		return subCategoryRepository.getSubCategory(Integer.parseInt(categoryId));
	}

//	@Secured("ROLE_ADMIN")
//	@RequestMapping(value = "add-subjects", method = RequestMethod.POST)
//	public String addSubjects(HttpServletRequest req) throws NumberFormatException, SQLException {
//		System.out.println("ADD Subject=======");
//		String categoryId = req.getParameter("categoryid");
//		String subCategoryId = req.getParameter("subcategoryid");
//		String question[] = req.getParameterValues("question");
//
//		String q_answer_a[] = req.getParameterValues("q_answer_a");
//		String q_answer_b[] = req.getParameterValues("q_answer_b");
//		String q_answer_c[] = req.getParameterValues("q_answer_c");
//		String q_answer_d[] = req.getParameterValues("q_answer_d");
//
//		String answer_a[] = req.getParameterValues("answer_a");
//		String answer_b[] = req.getParameterValues("answer_b");
//		String answer_c[] = req.getParameterValues("answer_c");
//		String answer_d[] = req.getParameterValues("answer_d");
//
//		QAnswer qAnswer = new QAnswer();
//		QuestionAnswer questionAnswer = new QuestionAnswer();
//		Question quest = new Question();
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
//		//System.out.println("add post=====" + timestamp);
//
//		for (int i = 0; i < question.length; i++) {
//			//System.out.println("q----" + question[i]);
//
//			int qid = homeDao.addQuestion(question[i].toString(), Integer.parseInt(subCategoryId),
//					timestamp.toString());
//			//System.out.println("QID===" + qid);
//			homeDao.addQAns(q_answer_a[i].toString(), q_answer_b[i].toString(), q_answer_c[i].toString(),
//					q_answer_d[i].toString(), qid);
//
//			homeDao.addQuestAns(Integer.parseInt(answer_a[i].toString()), Integer.parseInt(answer_b[i].toString()), Integer.parseInt(answer_c[i].toString()),
//					Integer.parseInt(answer_d[i].toString()), qid);
//
//		}
//		req.getSession().setAttribute("status","1"); 
//		return "redirect:questions";
//	}
//
//	@RequestMapping(value = "/get-question-answer-by-sub-category")
//	public String getSubBySubCategory(HttpSession session, HttpServletRequest req, Model model) throws Exception {
//		String subId = req.getParameter("subId");
//		String subName = req.getParameter("subName");
//		model.addAttribute("subName", subName);
//		//System.out.println("SID===" + subId);
//		//System.out.println("subName===" + subName);
//		model.addAttribute("questions", questionRepository.findBySubcategory(Integer.parseInt(subId)));
//		model.addAttribute("qAnswer", qAnswerRepository.findAllByQAnswery(Integer.parseInt(subId)));
//		// model.addAttribute("qAnswer",questionAnswerRepository.findAllQuestionAnswery(Integer.parseInt(subId)));
//		return "getQuestionBySubCategory";
//	}
//
//	@ResponseBody
//	@RequestMapping(value = "/check-answer")
//	public int checkAnswer(HttpSession session, HttpServletRequest req, Model model) throws Exception {
//		String sNo = req.getParameter("sno");
//		String subjectId = req.getParameter("subjectId");
//		System.out.println("sNo===" + sNo);
//		System.out.println("subjectId===" + subjectId);
//		int result = 0;
//		Map<String, Object> qaMap = questionAnswerRepository.findAllQuestionAnswery(Integer.parseInt(subjectId));
//
//		switch (Integer.parseInt(sNo)) {
//		case 0:
//			result = Integer.parseInt(qaMap.get("answer_a").toString());
//			break;
//		case 1:
//			result = Integer.parseInt(qaMap.get("answer_b").toString());
//			break;
//		case 2:
//			result = Integer.parseInt(qaMap.get("answer_c").toString());
//			break;
//		case 3:
//			result = Integer.parseInt(qaMap.get("answer_d").toString());
//			break;
//		}
//
//		return result;
//	}
//	
//	
//	@ResponseBody
//	@RequestMapping(value = "/get-answer")
//	public  Map<String, Object> getAnswer(HttpSession session, HttpServletRequest req, Model model)
//			throws Exception {
//		String subId = req.getParameter("subId"); 
//		Map<String, Object> qaMap = questionAnswerRepository.findAllQuestionAnswery(Integer.parseInt(subId));
//		return qaMap;
//	}
//	
//	@Secured("ROLE_ADMIN")
//	@RequestMapping(value = "/update-questions")
//	public  String updateQuestion(HttpSession session, HttpServletRequest req, Model model)
//			throws Exception {
//		model.addAttribute("categories", categoryRepository.findAll());
//		model.addAttribute("status",req.getSession().getAttribute("status")); 
//		return "Admin/updateQuestion";
//	}
//	
//	@Secured("ROLE_ADMIN")
//	@RequestMapping(value = "/get-question-list")
//	public  String getSelectedQuestion(HttpSession session, HttpServletRequest req, Model model)
//			throws Exception { 
//		String catId = req.getParameter("catId"); 
//		String subCatId = req.getParameter("subCatId"); 
//		model.addAttribute("questions", questionRepository.findBySubcategory(Integer.parseInt(subCatId))); 
//		return "Admin/getQuestionList";
//	}
//	
//	@Secured("ROLE_ADMIN")
//	@RequestMapping(value = "/get-question-modal")
//	public  String getSelectedQuestionModal(HttpSession session, HttpServletRequest req, Model model)
//			throws Exception { 
//		String qid = req.getParameter("id"); 
//		String subCatId = req.getParameter("subCatId"); 
//		model.addAttribute("subCatId", subCatId); 
//		model.addAttribute("questions", questionRepository.findByIdQuestion(Integer.parseInt(qid))); 
//		model.addAttribute("qAnswer", qAnswerRepository.findAnswerByQuestionId(Integer.parseInt(qid)));
//		model.addAttribute("questionAnswer", questionAnswerRepository.findByQuestionId(Integer.parseInt(qid)));
//		return "Admin/updateQuestionModal";
//	}
//	
//	
//	
//	@Secured("ROLE_ADMIN")
//	@RequestMapping(value = "update-question-form", method = RequestMethod.POST)
//	public String updateSubjects(HttpServletRequest req) throws NumberFormatException, SQLException {
//		System.out.println("ADD Subject======="); 
//		String subCategoryId = req.getParameter("subcategoryid");
//		String questionid = req.getParameter("questionid");
//		String question = req.getParameter("question");
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
//		Question quest = new Question();
//		quest.setId(Integer.parseInt(questionid));
//		quest.setName(question);
//		quest.setCreatedon(timestamp);
//		quest.setSubcategoryid(Integer.parseInt(subCategoryId));
//		questionRepository.save(quest);
//		
//		String q_answer_id = req.getParameter("q_answer_id");
//		String q_answer_a = req.getParameter("q_answer_a");
//		String q_answer_b = req.getParameter("q_answer_b");
//		String q_answer_c = req.getParameter("q_answer_c");
//		String q_answer_d = req.getParameter("q_answer_d");
//		QAnswer qAnswer = new QAnswer();
//		qAnswer.setId(Integer.parseInt(q_answer_id));
//		qAnswer.setqAnswerA(q_answer_a);
//		qAnswer.setqAnswerB(q_answer_b);
//		qAnswer.setqAnswerC(q_answer_c);
//		qAnswer.setqAnswerD(q_answer_d);
//		qAnswer.setQuestionId(Integer.parseInt(questionid));
//		qAnswerRepository.save(qAnswer);
//
//		String answer_id = req.getParameter("answer_id");
//		int answer_a = Integer.parseInt(req.getParameter("answer_a"));
//		int answer_b = Integer.parseInt(req.getParameter("answer_b"));
//		int answer_c =Integer.parseInt( req.getParameter("answer_c"));
//		int answer_d = Integer.parseInt(req.getParameter("answer_d"));
//		QuestionAnswer questionAnswer = new QuestionAnswer();
//		questionAnswer.setId(Integer.parseInt(answer_id));
//		questionAnswer.setAnswerA(answer_a);
//		questionAnswer.setAnswerB(answer_b);
//		questionAnswer.setAnswerC(answer_c);
//		questionAnswer.setAnswerD(answer_d);
//		questionAnswer.setQuestionId(Integer.parseInt(questionid));
//		questionAnswerRepository.save(questionAnswer);
// 
//		req.getSession().setAttribute("status","2"); 
//		return "redirect:home";
//	}
//	
//	@ResponseBody
//	@RequestMapping(value = "/challengecount")
//	public   Map<String,Object> challengecount(HttpSession session, HttpServletRequest req, Model model)
//			throws Exception { 
//		String status = req.getParameter("status"); 
//		String sessionId = req.getSession().getId();
//		 String totalTime = req.getParameter("totaltime"); 
//		 System.out.println("========"+status);
//		ChallangeCount challangeCount=new ChallangeCount();
//		challangeCount.setSessionid(sessionId);
//		challangeCount.setStatus(Integer.parseInt(status));
//		challangeCount.setTotaltime(Integer.parseInt(totalTime));
//		challangeCountRepository.save(challangeCount); 
//		 Map<String,Object> result=challangeCountRepository.findTotal(sessionId);
//		 System.out.println("====="+result.get("count"));
//		 return challangeCountRepository.getresult(sessionId, sessionId, sessionId, sessionId);
//	}
//	
//	
//	@ResponseBody
//	@RequestMapping(value = "/challengetime")
//	public   Map<String,Object> challengetime(HttpSession session, HttpServletRequest req, Model model)
//			throws Exception {  
//		String sessionId = req.getSession().getId();
//		 String totalTime = req.getParameter("totaltime"); 
//		 System.out.println("========"+totalTime);
//		 ChallengeTime challangeTime=new ChallengeTime();
//		 challangeTime.setSessionid(sessionId);
//		challangeTime.setTotaltime(Integer.parseInt(totalTime));
//		challengeTimeRepository.save(challangeTime);  
//		 return challengeTimeRepository.getTimeResult(sessionId);
//	}
	
}
