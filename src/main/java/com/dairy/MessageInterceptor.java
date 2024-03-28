package com.dairy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;


@Component
public class MessageInterceptor implements HandlerInterceptor {

	 private final MessageSource messageSource;

	    @Autowired
	    public MessageInterceptor(MessageSource messageSource) {
	        this.messageSource = messageSource;
	    }

	    @Override
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	                           ModelAndView modelAndView) throws Exception {
	        if (isGetRequest(request) && modelAndView != null) {
	            addMessagesToModel(request, modelAndView);
	        }
	    }

	    private boolean isGetRequest(HttpServletRequest request) {
	        return "GET".equalsIgnoreCase(request.getMethod());
	    }

	    private void addMessagesToModel(HttpServletRequest request, ModelAndView modelAndView) {
	        HttpSession session = request.getSession();
	        String lang = (String) session.getAttribute("lang");
	        if (lang == null) {
	            lang = "mr"; // Default language
	        }
	       // session.setAttribute("lang", lang);

	        int numOfMessages = 260; // Assuming you have 260 messages
	        List<String> messages = new ArrayList<>();
	        for (int i = 1; i <= numOfMessages; i++) {
	            String messageKey = "message" + i;
	            String message = messageSource.getMessage(messageKey, null, Locale.forLanguageTag(lang));
	            messages.add(message);
	        }
	       
	        modelAndView.addObject("messages", messages);
	    }

}
