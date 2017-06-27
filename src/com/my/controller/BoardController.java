package com.my.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.dao.BoardDAOOracle;
import com.my.vo.Customer;
import com.my.vo.Paging;
import com.my.vo.RepBoard;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
@Controller
public class BoardController {

   @Autowired
   private BoardDAOOracle dao;
   

   @RequestMapping("boardWrite.do")
   public String board(HttpServletRequest rq ,HttpServletResponse response, Model model, HttpSession session){
      Customer c = (Customer)session.getAttribute("loginInfo");
      String nick = c.getNickname();
      String email = c.getEmail();
      
      /*String savePath = "C:\\Users\\ywj\\git\\KITRI-project\\WebContent\\image";*/
      String savePath = "/var/lib/tomcat8/Project/webapps/up_image";
      System.out.println(savePath);
      int maxPostSize = 1024*1024*15;
      
      System.out.println("request getContentType : " + rq.getContentType());
      
      RepBoard board;
      try {
		MultipartRequest multi = new MultipartRequest(rq, savePath, maxPostSize, "utf-8", new DefaultFileRenamePolicy());
		System.out.println("init");
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		String password = multi.getParameter("password");
		System.out.println(subject+":"+content+":"+password);
	      board = new RepBoard();
	      board.setContent(content);
	      board.setSubject(subject);
	      board.setPassword(password);
	      board.setEmail(email);
	      

	         if (content == null || subject == null || password == null){
	      }else {
	      dao.insert(board);
	      dao.setGrp(email);
	      }
	         
	         model.addAttribute("msg", board);
	         model.addAttribute("nick", nick);

	} catch (IOException e) {
		e.printStackTrace();
	} catch (Exception e){
		e.printStackTrace();
	}

      
      String forwardURL = "boardList.do";
      return forwardURL;
   }


   @RequestMapping("boardList.do")
   public String board(HttpServletRequest request, Model model, HttpSession session, @RequestParam(value="page", defaultValue = "0") int page){

      String forwardURL = "";
      List<RepBoard> b=null;
      Customer c = (Customer)session.getAttribute("loginInfo");
      String log = "";
      int size = 10;
      double count = dao.getCount();
      int pageCount = (int) Math.ceil(count/size);
      //System.out.println("총 글 갯수 : " + count + " 페이지 수 : " + pageCount );
      Paging paging = new Paging();
      paging.setPageCount(pageCount);
      paging.setSize(size);
      if(page == 0 || page == 1){
         paging.setStand(0);      
      }else{
         paging.setStand(size*(page-1));
      }
      
     // System.out.println(paging.getStand());
      
      if(c == null){
         try {
            b = dao.List(paging);
         } catch (Exception e) {
            e.printStackTrace();
         }
         log="2";
      }else if (c != null){
      try {
         b = dao.List(paging);
         log="1";
      } catch (Exception e) {
         e.printStackTrace();
      }
      }
      
      model.addAttribute("count",pageCount);
      model.addAttribute("log", log);
      model.addAttribute("msg", b);
      forwardURL ="/boardList.jsp";
      return forwardURL;
   }
   
   


   
   @RequestMapping("boardView.do")  //글보기!!!!!!!!!!!!!!!!!!
   public String boardView(Model model, HttpSession session, int no){
      
      RepBoard list;
      String email= "";
      dao.viewsup(no);
      
      list= dao.content(no);
      String id = list.getEmail();
      
      
      
      Customer c = (Customer)session.getAttribute("loginInfo");
      
      if(c != null){
         email = c.getNickname();
      }
      
      

      String msg = "";
      if ( id .equals(email)){
         msg = "1";
      } else  {
         msg = "2";
      }
      model.addAttribute("msg", msg);
      model.addAttribute("list", list);
      String forwardURL ="boardView.jsp";
      return forwardURL;
   }
   
   
   @RequestMapping("boardModi.do")  //글 수정값 불러오기
   public String boardModi(Model model, HttpSession session, int no){

      RepBoard b = dao.content(no);

      
      model.addAttribute("msg", b);
      String forwardURL ="boardModi.jsp";
      return forwardURL;
   }
   
   @RequestMapping("boardModi1.do")  //글 수정하기!!!!
   public String boardModi1(Model model, HttpSession session, int no, String subject, String content){
      
      RepBoard b = new RepBoard(subject, content, no);
      dao.update(b);
      String forwardURL ="boardList.do";
      return forwardURL;
   }
   
   @RequestMapping("boardDelete.do")  //글 삭제하기!!!!
   public String boardDelete(Model model, HttpSession session, int no){

      dao.delete(no);
      String forwardURL ="boardList.do";
      return forwardURL;
   }
   
   
   @RequestMapping("boardReply.do")  //글 답글하기!!!!
   public String boardReply(Model model, HttpSession session, int no, String subject){

      RepBoard b = new RepBoard();
      b.setNo(no);
      b.setSubject(subject);
      model.addAttribute("msg", b);
      String forwardURL ="boardReply.jsp";
      return forwardURL;
   }

   
   @RequestMapping("reply.do")  //글 답글작성하기!!!!
   public String boardReply1(Model model, HttpSession session, int no, String subject, String content, String password){

      Customer c =(Customer)session.getAttribute("loginInfo");
      String email=c.getEmail();

      RepBoard b = new RepBoard();
      b.setParent_no(no);
      b.setSubject(subject);
      b.setContent(content);
      b.setPassword(password);
      b.setEmail(email);
      
      dao.reply(b);
      model.addAttribute("msg", b);
      String forwardURL ="boardList.do";
      return forwardURL;
   }
   
   @RequestMapping("boardSearch.do")  //글 답글작성하기!!!!
   public String boardSearch(Model model, HttpSession session, String select, String input){
	   System.out.println(select);
	   System.out.println(input);
	   System.out.println("구별 ㅇㅇㅇㅇㅇ");
      List<RepBoard> list;
      if(select.equals("닉네임")){
         String nickname = input;
         list = dao.searchByWriter(nickname);
         model.addAttribute("msg", list);
      } else if(select.equals("제목")){
         String subject = input;
         list = dao.searchBySubject(subject);
         model.addAttribute("msg", list);
      }else if(select.equals("내용")){
         String content = input;
         list = dao.searchByContent(content);
         model.addAttribute("msg", list);
      }

      String forwardURL ="boardList.jsp";
      return forwardURL;
   }
   
   
   @RequestMapping("boardWrite2.do")  //글 답글작성하기!!!!
   public String boardReply2(HttpServletRequest rq, Model model, HttpSession session){
	      String savePath = rq.getServletContext().getRealPath("image");
	      System.out.println(savePath);
	      int maxPostSize = 1024*1024*15;
	       
	      String extraField = rq.getParameter("extraField");
	      System.out.println(extraField);
		try {
			MultipartRequest multi = new MultipartRequest(rq, savePath, maxPostSize, "utf-8", new DefaultFileRenamePolicy());
			System.out.println(multi.getParameter("extraField"));
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

      return null;
   }
   
}