package com.greathiit.lab.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import com.greathiit.lab.entity.Customer;

/**
 * Servlet Filter implementation class Filter
 */
public class Filter implements javax.servlet.Filter {
	public FilterConfig config;

    /**
     * Default constructor. 
     */
    public Filter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		this.config = null;
	}
	 public static boolean isContains(String container, String[] regx) {
	        boolean result = false;

	        for (int i = 0; i < regx.length; i++) {
	            if (container.indexOf(regx[i]) != -1) {
	                return true;
	            }
	        }
	        return result;
	    }


	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		 HttpServletRequest hrequest = (HttpServletRequest)request;
	        HttpServletResponseWrapper wrapper = new HttpServletResponseWrapper((HttpServletResponse) response);

	        String logonStrings = config.getInitParameter("logonStrings");        // 登录登陆页面
	        String includeStrings = config.getInitParameter("includeStrings");    // 过滤资源后缀参数
	        String redirectPath = hrequest.getContextPath() + config.getInitParameter("redirectPath");// 没有登陆转向页面
	        String disabletestfilter = config.getInitParameter("disabletestfilter");// 过滤器是否有效

	        if (disabletestfilter.toUpperCase().equals("Y")) {    // 过滤无效
	            chain.doFilter(request, response);
	            return;
	        }
	        String[] logonList = logonStrings.split(";");
	        String[] includeList = includeStrings.split(";");

	        if (!this.isContains(hrequest.getRequestURI(), includeList)) {// 只对指定过滤参数后缀进行过滤
	            chain.doFilter(request, response);
	            return;
	        }

	        if (this.isContains(hrequest.getRequestURI(), logonList)) {// 对登录页面不进行过滤
	            chain.doFilter(request, response);
	            return;
	        }
	        Customer customer = (Customer)hrequest.getSession().getAttribute("loginCustomer");//判断用户是否登录
	        if (customer == null) {
	            wrapper.sendRedirect(redirectPath);
	            return;
	        }else {
	            chain.doFilter(request, response);
	            return;
	        }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	  public void init(FilterConfig filterConfig) throws ServletException {
	        config = filterConfig;
	    }

}
