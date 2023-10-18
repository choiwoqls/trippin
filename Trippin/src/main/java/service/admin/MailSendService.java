package service.admin;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSendService {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber;
	
	public MailSendService(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;
	}
	
	
	public void makeRandomNumber() {
		//난수 범위: 111111 ~ 999999 (6자리)
		Random r = new Random();
		
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호: " + checkNum);
		authNumber = checkNum;
	}
	
	//회원가입 인증 이메일 양식
	public String joinEmail(String m_email) {
		makeRandomNumber();
		String setFrom = "trippinyaho@gmail.com";
		String toMail = m_email;
		String title = "[트리핀] 회원가입 인증 이메일 입니다.";
		String content = 
				"트리핀 사이트에 방문해주셔서 감사합니다.<br><br>"
				+"인증 번호는 <b>" + authNumber + "</b>입니다.<br>"
				+"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	//비밀번호 재설정 이메일 양식
	public String rePw(String m_email, int m_seq) {
		String url = "http://localhost:8080/trippin/member/editProfile/inputNewPw?m_seq="+m_seq;
		String setFrom = "trippinyaho@gmail.com";
		String toMail = m_email;
		String title = "[트리핀] 비밀번호 재설정을 해주세요.";
		String content = 
				"<h3><b>비밀번호 재설정을 해주세요.</b></h3><br>"
				+"안녕하세요. 트리핀팀입니다.<br><br>"
				+"회원님의 계정 비밀번호 변경을 위해 아래 <b>비밀번호 재설정</b> 버튼을 눌러주세요.<br>"
				+"재설정하지 않으면 기존 비밀번호가 유지됩니다.<br><br><br>"
				+"<a style='text-decoration:none; color:#000; background-color:#9cf1de; padding:0.7%; border-radius: 4px;' href='"+url+"'>"+"비밀번호 설정하기"+"</a>";
		
		mailSend(setFrom, toMail, title, content);
		return "hi";
	}
	
	
	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		//true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능. 문자 인코딩 설정도 가능.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			//true 전달: html 형식으로 전송, 작성하지 않으면 단순 텍스틀 전달.
			helper.setText(content, true);
			mailSender.send(message);
		}catch(MessagingException e) {
			e.printStackTrace();
		}
	}
}
