<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <script type="text/javascript" src="jquery-1.11.3.js"></script>
        <script type="text/javascript" src="jquery.js"></script>

        <title></title>
        <link rel="stylesheet" type="text/css" href="index.css"> 
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                </head>

                <body scroll="yes">
                    <jsp:useBean id="user" scope="request" class="entity.User"/>
                    <header >

                        <div class='block' id="enter">
                            <br>
                                <form  method="post" action="controller">
                                    <p>${user.firstname} ${user.lastname}</p><br/>

                                </form>
                        </div>
                        <div class='block' id="h">
                            <h2>Кулинария - это не просто умение приготовить обед, это целое искусство.</h2>
                        </div>

                    </header>
                    <div  class="main">
                        <div class="menu">
                            <table>
                                <tr><td class="main_menu"><a href="vk.com">Салаты</a></td></tr>
                                <tr><td class="main_menu">Закуски</td></tr>
                                <tr><td class="main_menu">Первые блюда</td></tr>
                                <tr><td class="main_menu">Вторые блюда</td></tr>
                                <tr><td class="main_menu">Выпечка</td></tr>
                                <tr><td class="main_menu">Блины</td></tr>
                                <tr><td class="main_menu">Десерты</td></tr>
                                <tr><td class="main_menu">Напитки</td></tr>
                                <tr><td class="main_menu">Соусы</td></tr>
                                <tr><td class="main_menu" id="spisok">
                                        <h3>Кухня<span class="expand">+</span></h3>
                                        <ul>
                                            <li>Американская</li>
                                            <li>Грузинская</li>
                                            <li>Индийская</li>
                                            <li>Испанская</li>
                                            <li>Итальянская</li>
                                            <li>Китайская</li>
                                            <li>Македонская</li>
                                            <li>Русская</li>
                                            <li>Узбекская</li>
                                            <li>Французская</li>                                                    
                                        </ul>
                                    </td></tr>
                            </table>
                        </div>
                        <form name="addrecipe" method="post" action="contoller">
                            <div id="recipe_menu" style="float: left">
                                
                            </div>
                        </form>
                    </div>



                    </div>
                    </div>

                </body>

                </html>
