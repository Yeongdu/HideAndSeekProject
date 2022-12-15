package com.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.model.DeliveryDTO;
import com.spring.model.MailDTO;
import com.spring.model.UserDTO;


@Repository
public class UserDAOImpl implements UserDAO{
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private JavaMailSender mailSender;
	
	UserDTO dto;


	//로그인
	@Override
    public int userCheck(Map<String, Object> map) {
       return sqlSession.selectOne("getMember",map);
      }


	//회원가입_아이디 중복체크
	@Override
	public int idCheck(String id) {
		
		int cnt = this.sqlSession.selectOne("idCheck",id);
		System.out.println("IMPL >>> " + id);
		
		System.out.println(cnt);
		return cnt;
	}


	//회원가입_ 이메일 중복체크
	@Override
	public int emailCheck(String email) {
		
		int cnt = this.sqlSession.selectOne("emailCheck",email);
		System.out.println("emailIMPL >>> " + email);
		
		System.out.println(cnt);
		return cnt;
	}


	
	//회원가입완료(DB에 값 저장)
	@Override
	public int insertUser(UserDTO dto) {
		
		return this.sqlSession.insert("add", dto);
	}


	//통합 이메일 확인해서 메일보내기
	@Override
	public int findId(String email) {
		// TODO Auto-generated method stub
		int resultCode = 0;
		List<String> list = this.sqlSession.selectList("findId", email);
		if(list != null ) {
			if(list.size() > 0) {
				MailDTO dto = new MailDTO();
				dto.setTomail(email);
				dto.setTitle("술래잡기 아이디 찾기 메일입니다.");
				String ctn = "아이디는" + list.get(0) + "입니다.";
				dto.setContent(ctn);
				resultCode = this.mailSending(dto);
				
			}
		}else {
			resultCode = 2; // 확인되는 아이디가 없습니다.
		}
		return resultCode;
	}
	
	
	// 통합메일 보내기 서비스 
		@Override
		public int mailSending(MailDTO dto) {
			// TODO Auto-generated method stub
			int resultCode = 0;
			String setfrom = "yeajizy@gmail.com";
			String tomail = dto.getTomail(); // 받는 사람 이메일
			String title = dto.getTitle(); // 제목
			//String title = "술래잡기 임시 비밀번호입니다."; // 제목
			
			String content = dto.getContent(); // 내용

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,
						true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);
				resultCode = 1;  // 성공
			} catch (Exception e) {
				System.out.println(e);
				resultCode = 0; // 실패
			}

			//return "main/main.tiles";
			return resultCode;
		}

		@Override
		public int findPw(Map<String, Object> map) {
			return this.sqlSession.update("findPw",map);
		}


		//배송지 설정
		@Override
		public void insertDelivery(DeliveryDTO dto) {
			this.sqlSession.insert("insert_delivery", dto);
		}


	


	


	
	  
	  



	


	
	
	}

	
	

	

