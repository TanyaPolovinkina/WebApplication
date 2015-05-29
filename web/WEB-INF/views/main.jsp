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
            <link rel="stylesheet" type="text/css" href="tag.css"> 
                <link rel="stylesheet" type="text/css" href="div_recipe.css">
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        </head>
                        <body>
                            <header>
                                <div class='block' id="enter">
                                    <br/>
                                    <c:if test="${user==null}">
                                        <form method="post" action="controller">
                                            <input type="hidden" name="command" value="enterpage"/>
                                            <input type="submit" value="Войти"  class="submit_enter" /><br>
                                        </form>
                                        <form method="post" action="controller">
                                            <input type="hidden" name="command" value="registerpage"/>
                                            <input type="submit"   value="Регистрация" class="submit_registration"/>
                                        </form>
                                    </c:if>
                                    <c:if test="${user ne null}">
                                        <p>${user.firstname} ${user.lastname}</p>
                                        <form method="post" action="controller">
                                            <input type="hidden" name="command" value="logout"/>
                                            <input type="submit" value="Выйти"  class="submit_enter" />
                                        </form>
                                    </c:if>
                                </div>

                                <div class='block' style="width:80%">
                                    <h2>Кулинария - это не просто умение приготовить обед, это целое искусство.</h2>
                                </div>

                            </header>

                            <div  class="main">

                                <div class="menu">
                                    <table>
                                        <form name="showrecipes" method="get" action="controller" >
                                            <c:if test="${user ne null}">
                                                <tr>
                                                    <td>
                                                        <a href="controller?command=SHOWCOOKBOOK" class="tag">
                                                            Кулинарная книга
                                                        </a>
                                                    </td> 
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <a href="controller?command=SHOWMYRECIPES" class="tag">
                                                            Мои рецепты
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                        <td>
                                                            <a href="controller?command=add" class="tag" />
                                                                Добавить рецепт
                                                            </a>
                                                        </td>
                                                    
                                                </tr>
                                            </c:if>

                                            <input id="changeMenu" type="hidden" value="Салаты"/>
                                            <tr><td class="main_menu"><a href="controller?command=SHOWRECIPES&param=Салаты" >Салаты</a></td></tr>
                                            <tr><td class="main_menu"><a href="controller?command=SHOWRECIPES&param=Закуски">Закуски</a></td></tr>
                                            <tr><td class="main_menu"><a href="controller?command=SHOWRECIPES&param=Первые блюда">Первые блюда</a></td></tr>
                                            <tr><td class="main_menu"><a href="controller?command=SHOWRECIPES&param=Вторые блюда">Вторые блюда</a></td></tr>
                                            <tr><td class="main_menu"><a href="controller?command=SHOWRECIPES&param=Выпечка">Выпечка</a></td></tr>
                                            <tr><td class="main_menu"><a href="controller?command=SHOWRECIPES&param=Блины">Блины</a></td></tr>
                                            <tr><td class="main_menu"><a href="controller?command=SHOWRECIPES&param=Десерты">Десерты</a></td></tr>
                                            <tr><td class="main_menu"><a href="controller?command=SHOWRECIPES&param=Напитки">Напитки</a></td></tr>
                                            <tr><td class="main_menu"><a href="controller?command=SHOWRECIPES&param=Соусы">Соусы</a></td></tr>
                                            <tr><td class="main_menu" id="spisok">
                                                    <h3>Кухня<span class="expand">+</span></h3>
                                                    <ul>
                                                        <li><a href="controller?command=SHOWRECIPES&param=Американская" >Американская</a></li>
                                                        <li><a href="controller?command=SHOWRECIPES&param=Грузинская" >Грузинская</a></li>
                                                        <li><a href="controller?command=SHOWRECIPES&param=Индийская" >Индийская</a></li>
                                                        <li><a href="controller?command=SHOWRECIPES&param=Испанская" >Испанская</a></li>
                                                        <li><a href="controller?command=SHOWRECIPES&param=Итальянская" >Итальянская</a></li>
                                                        <li><a href="controller?command=SHOWRECIPES&param=Китайская" >Китайская</a></li>
                                                        <li><a href="controller?command=SHOWRECIPES&param=Македонская" >Македонская</a></li>
                                                        <li><a href="controller?command=SHOWRECIPES&param=Русская" >Русская</a></li>
                                                        <li><a href="controller?command=SHOWRECIPES&param=Узбекская" >Узбекская</a></li>
                                                        <li><a href="controller?command=SHOWRECIPES&param=Французская" >Французская</a></li>                                                    
                                                    </ul>
                                                </td></tr>

                                        </form>
                                    </table>
                                </div>

                                <div id="recipe_menu" style="float: left">
                                    <form method="post" action="controller" name="findrecipes">
                                        <input type="hidden" name="command" value="findrecipe"/>
                                        <div style="width: 100%; height: 10%;">
                                            <table style="width: 900px; height: 70px">
                                                <tr>
                                                    <td style="width: 5%"></td>
                                                    <input  type="hidden" name="command" value="findrecipe"/>
                                                    <input  type="hidden" name="userid" value="${user.userId}" />
                                                    <td style="width: 65%"><input type="text" name="find" class="find"/></td>
                                                    <td style="width: 30%"><input type="submit" value="Найти"  class="find"/></td></tr>
                                            </table>
                                        </div>
                                    </form>
                                    <div id="recipe" style="width: 830px">
                                        <h1><p>${message}</p></h1>

                                        <c:if test="${category ne 'null'}">
                                            <c:forEach items="${category.recipes}" var="recipe">

                                                <div class="cbm_wrap ">
                                                    <p >${recipe.recipeName}</p>
                                                    <img src="${recipe.recipePhoto}" style="width: 250px"/>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${findrecipes ne 'null'}">
                                            <c:forEach items="${findrecipes}" var="recipe">
                                                <div class="cbm_wrap ">
                                                    <p >${recipe.recipeName}</p>
                                                    <img src="${recipe.recipePhoto}" style="width: 250px"/>
                                                </div>
                                            </c:forEach>
                                        </c:if>

                                    </div>


                                </div>
                            </div>

                        </body>
                        </html>
