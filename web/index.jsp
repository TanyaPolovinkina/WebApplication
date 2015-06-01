<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <script type="text/javascript" src="jquery-1.11.3.js"></script>
        <script type="text/javascript" src="jquery.js"></script>
        <title>Главная</title>
        <link rel="stylesheet" type="text/css" href="index.css"> 
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                </head>
                <body>
                    <jsp:forward page="/controller">
                        <jsp:param name="command" value="findrecipe"/>
                        <jsp:param name="find" value=""/>
                    </jsp:forward>
                </body>
                </html>
