package com.user.servlet;

import javax.servlet.http.HttpServlet;
import javax.mail.internet.*;
import javax.mail.*;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletResponse;

import com.DAO.OtpDAO;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;

@WebServlet("/sendOtp")
public class SendOtp extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email = req.getParameter("email");

			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			OtpDAO dao2 = new OtpDAO(DBConnect.getConn());
			HttpSession session = req.getSession();

			if (dao.checkEmailForForgot(email)) {

				if (dao2.checkEmail(email)) {
					dao2.deleteEmailAndOtp(email);

					String otp = String.valueOf((int) (Math.random() * (999999 - 111111 + 1) + 111111));

					String msg = "Hi, \n Online Ebook Store forgot password Otp : " + otp;

					if (dao2.addOtp(email, otp)) {
						SendEmail(msg, "Forgot password Otp", email, "Forgot Password <no-reply@gmail.com>");

						session.setAttribute("otpEmail", email);
						session.setAttribute("succMsg", "check your mail otp sent..");
						resp.sendRedirect("email_send.jsp");

					} else {
						session.setAttribute("errorMsg", "something went wrong or incorrect data");
						resp.sendRedirect("email_send.jsp");
					}
				} else {

					String otp = String.valueOf((int) (Math.random() * (999999 - 111111 + 1) + 111111));

					String msg = "Hi, \n Online Ebook Store forgot password Otp : " + otp;

					if (dao2.addOtp(email, otp)) {
						SendEmail(msg, "Forgot password Otp", email, "Forgot Password <no-reply@gmail.com>");

						session.setAttribute("otpEmail", email);
						session.setAttribute("succMsg", "check your mail otp sent..");
						resp.sendRedirect("email_send.jsp");

					} else {
						session.setAttribute("errorMsg", "something went wrong or incorrect data");
						resp.sendRedirect("email_send.jsp");
					}

				}

			} else {
				session.setAttribute("errorMsg", "Invalid email ! ");
				resp.sendRedirect("email_send.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void SendEmail(String msg, String subject, String to, String from) {

		String host = "smtp.gmail.com";

		Properties properties = System.getProperties();

		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {

				return new PasswordAuthentication("j708@gmail.com", "gggg");
			}
		});
		session.setDebug(true);

		MimeMessage m = new MimeMessage(session);
		try {

			m.setFrom(from);

			m.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			m.setSubject(subject);
			m.setText(msg);

			Transport.send(m);

		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}

}
