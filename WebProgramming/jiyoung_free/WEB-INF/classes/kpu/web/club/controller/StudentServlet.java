package kpu.web.club.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kpu.web.club.domain.StudentVO;
import kpu.web.club.persistence.StudentDAO;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String cmdReq="";
		cmdReq = request.getParameter("cmd");
		
		if( cmdReq.equals("reser")) {
			StudentDAO dao=new StudentDAO();
			StudentVO student = dao.readUser(request.getParameter("id"));
			request.setAttribute("reservation", student);
			request.setAttribute("id", request.getParameter("id"));
			System.out.println(student);
			RequestDispatcher view= request.getRequestDispatcher("reservation.jsp");
			view.forward(request, response);
		} else if(cmdReq.equals("login")) {
			//response.sendRedirect("home.jsp");
		} else if( cmdReq.equals("list")) {
			StudentDAO dao = new StudentDAO();
			ArrayList<StudentVO> studentList = dao.getStudentList();
			request.setAttribute("reservationList",  studentList);
			request.setAttribute("id", request.getParameter("id"));
			RequestDispatcher view = request.getRequestDispatcher("reserForm.jsp");
			view.forward(request, response);
		} else if(cmdReq.equals("update")) {
			StudentDAO dao=new StudentDAO();
			StudentVO student = dao.readReser(request.getParameter("id"), request.getParameter("date"));
			request.setAttribute("reservation", student);
			request.setAttribute("user", request.getParameter("user"));
			RequestDispatcher view= request.getRequestDispatcher("updateReser.jsp");
			view.forward(request, response);
		} else if(cmdReq.equals("delete")) {
			StudentDAO dao=new StudentDAO();
			StudentVO student = dao.readReser(request.getParameter("id"), request.getParameter("date"));
			request.setAttribute("student", student);
			
			String message;
			if(dao.delete(student)) message = "삭제되었습니다.";
			else message = "삭제 실패입니다.";
			request.setAttribute("greetings", message);
			request.setAttribute("user", request.getParameter("user"));
			RequestDispatcher view= request.getRequestDispatcher("reserCheck.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String cmdReq="";
		cmdReq = request.getParameter("cmd");
		
		
		
		if(cmdReq.equals("reser")) {
			StudentVO studentVO = new StudentVO();
			
			studentVO.setId(request.getParameter("id"));
			studentVO.setName(request.getParameter("name"));
			studentVO.setDate(request.getParameter("date"));
			studentVO.setTime(request.getParameter("time"));
			studentVO.setRoom(request.getParameter("room"));
			
			StudentDAO studentDao = new StudentDAO();
			
			String message;
			if(studentDao.add(studentVO)) message = "예약이 완료되었습니다.";
			else message = "예약에 실패하였습니다. 이미 예약된 열람실입니다.";
			
			request.setAttribute("greetings", message);
			request.setAttribute("student", studentVO);
			request.setAttribute("user", request.getParameter("user"));
			RequestDispatcher view = request.getRequestDispatcher("reserCheck.jsp");
			view.forward(request, response);
		} else if(cmdReq.equals("list")) {
			StudentVO studentVO = new StudentVO();
			
			studentVO.setId(request.getParameter("id"));
			
			
			request.setAttribute("id", studentVO.getId());
			RequestDispatcher view = request.getRequestDispatcher("reserForm.jsp");
			
			
			view.forward(request, response);
		}
		
		
		else if(cmdReq.equals("login")) {
			StudentVO studentVO = new StudentVO();
			
			studentVO.setId(request.getParameter("id"));
			studentVO.setPasswd(request.getParameter("passwd"));
			
			StudentDAO studentDao = new StudentDAO();
			
			if(studentDao.login(studentVO)) {
				
				request.setAttribute("id", studentVO.getId());
				RequestDispatcher view = request.getRequestDispatcher("home.jsp");
				
				
				view.forward(request, response);
			}
			else{
				
				RequestDispatcher view = request.getRequestDispatcher("login.jsp");
				view.forward(request, response);
			};
			
			
			
		} else if(cmdReq.equals("update")) {
			StudentVO studentVO = new StudentVO();
			
			studentVO.setId(request.getParameter("id"));
			studentVO.setName(request.getParameter("name"));
			studentVO.setDate(request.getParameter("date"));
			studentVO.setTime(request.getParameter("time"));
			studentVO.setRoom(request.getParameter("room"));
			
			StudentDAO dao = new StudentDAO();
		
			String message;
			if(dao.update(studentVO)) message = "수정이 완료되었습니다.";
			else message = "수정 실패입니다.";
			
			request.setAttribute("greetings", message);
			request.setAttribute("student", studentVO);
			request.setAttribute("user", request.getParameter("user"));
			RequestDispatcher view = request.getRequestDispatcher("reserCheck.jsp");
			view.forward(request, response);
		} 
	}

}
