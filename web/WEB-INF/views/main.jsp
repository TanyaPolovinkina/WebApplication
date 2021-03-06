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

            <link rel="stylesheet" type="text/css" href="div_recipe.css">
                <link rel="stylesheet" type="text/css" href="tag.css">
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        </head>
                        <body>
                            <header>
                                <div class='block' id="enter">
                                    <br/>
                                    <c:if test="${user.firstname==null}">
                                        <form method="post" action="controller">
                                            <input type="hidden" name="command" value="enterpage"/>
                                            <input type="submit" value="Войти"  class="submit_enter" /><br>
                                        </form>
                                        <form method="post" action="controller">
                                            <input type="hidden" name="command" value="registerpage"/>
                                            <input type="submit"   value="Регистрация" class="submit_registration"/>
                                        </form>
                                    </c:if>
                                    <c:if test="${user.firstname ne null}">
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
                                            <c:if test="${user.firstname ne null and user.firstname ne 'admin'}">
                                                <tr>
                                                    <td>
                                                        <a href="controller?command=SHOWCOOKBOOK&userid=${user.userId}" class="tag">
                                                            Кулинарная книга
                                                        </a>
                                                    </td> 
                                                </tr>
                                            </c:if>
                                            <c:if test="${user.firstname ne null}">
                                                <tr>
                                                    <td>
                                                        <a href="controller?command=SHOWMYRECIPES&userid=${user.userId}" class="tag">
                                                            Мои рецепты
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td >
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
                                        <div style="width: 100%; height: 10%;">
                                            <table style="width: 900px; height: 70px">
                                                <tr>
                                                    <td style="width: 5%"></td>
                                                    <input  type="hidden" name="command" value="findrecipe"/>
                                                    <input  type="hidden" name="userid" value="${user.userId}"/>
                                                    <td style="width: 65%"><input type="text" name="find" class="find"/></td>
                                                    <td style="width: 30%"><input type="submit" value="Найти"  class="find"/></td></tr>
                                            </table>
                                        </div>
                                    </form>
                                    <div id="recipe" style="width: 850px">
                                        <h1><p>${message}</p></h1>

                                        <c:if test="${findrecipes ne 'null'}">
                                            <c:forEach items="${findrecipes}" var="recipe">
                                                <div class="cbm_wrap ">
                                                    <a href="controller?command=SHOWRECIPE&param=${recipe.recipeId}" style="text-decoration:none" >
                                                        <p >${recipe.recipeName}</p>
                                                    </a>
                                                    <a href="controller?command=SHOWRECIPE&param=${recipe.recipeId}" >
                                                        <img src="${recipe.recipePhoto}" style="width: 250px"/>
                                                    </a>
                                                    <c:if test="${user ne null and user.firstname ne 'admin'}">
                                                        <c:if test="${myrecipe eq 'true'}">
                                                            <form method="post" action="controller">
                                                                <input type="hidden" name="command" value="edit"/>
                                                                <input type="hidden" name="recipeid" value="${recipe.recipeId}"/>
                                                                <input type="submit" value="Редактировать" class="submit_enter" style="display: block ;margin: 0 auto"/>
                                                            </form>
                                                        </c:if>
                                                        <c:set var="added" value="no"/>
                                                        <c:if test="${myrecipe ne 'true'}">
                                                            <c:if test="${recipe.user.userId ne user.userId and cookbook ne 'true'}">
                                                                <c:forEach items="${user.recipes}" var="userrecipe">
                                                                    <c:if test="${recipe.recipeId == userrecipe.recipeId}">
                                                                        <c:set var="added" value="yes"/>
                                                                        <h3>Добавлен</h3>
                                                                    </c:if>
                                                                </c:forEach>  

                                                                <c:if test="${added eq 'no'}">
                                                                    <form method="post" action="controller">
                                                                        <input type="hidden" name="command" value="addcookbook"/>
                                                                        <input type="hidden" name="userid" value="${user.userId}"/>
                                                                        <input type="hidden" name="recipeid" value="${recipe.recipeId}"/>
                                                                        <input type="submit" value="Добавить" class="submit_enter" style="display: block ;margin: 0 auto"/>
                                                                    </form>
                                                                </c:if>

                                                            </c:if>
                                                            <c:if test="${recipe.user.userId == user.userId}">
                                                                <h3>Это ваш рецепт</h3>
                                                            </c:if>

                                                            <c:if test="${cookbook eq 'true'}">
                                                                <form method="post" action="controller">
                                                                    <input type="hidden" name="command" value="delete"/>
                                                                    <input type="hidden" name="userid" value="${user.userId}"/>
                                                                    <input type="hidden" name="recipeid" value="${recipe.recipeId}"/>
                                                                    <input type="submit" value="Удалить" class="submit_enter" style="display: block ;margin: 0 auto"/>
                                                                </form>
                                                            </c:if>


                                                        </c:if>
                                                    </c:if>
                                                    <c:if test="${user ne null and user.firstname eq 'admin'}">
                                                        <form method="post" action="controller">
                                                            <input type="hidden" name="command" value="edit"/>
                                                            <input type="hidden" name="recipeid" value="${recipe.recipeId}"/>
                                                            <input type="submit" value="Редактировать" class="submit_enter" style="display: block ;margin: 0 auto"/>
                                                        </form>
                                                        <form method="post" action="controller">
                                                            <input type="hidden" name="command" value="deletebyadmin"/>
                                                            <input type="hidden" name="recipeid" value="${recipe.recipeId}"/>
                                                            <input type="submit" value="Удалить" class="submit_enter" style="display: block ;margin: 0 auto"/>
                                                        </form>
                                                    </c:if>
                                                </div>
                                            </c:forEach>
                                        </c:if>

                                    </div>


                                </div>
                            </div>

                        </body>
                        </html>
