<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>

        <script type="text/javascript" src="jquery-1.11.3.js"></script>
        <script type="text/javascript" src="jquery.js"></script>
        <SCRIPT  language = 'JavaScript'>
            var numb = 1; // переменная для формирования идентификатора элемента
            var numb_step = 1; // переменная для формирования идентификатора элемента
            var numb_step_photo;
            numb_step_photo = 1;
            function add_new_row_ingr() {
                var currrow;
                var gr = "гр";
                var kg = "кг";
                var ml = "мл",
                        l = "л",
                        chl = "ч.л",
                        stl = "ст.л",
                        st = "стакан",
                        sht = "штука";
                currow = document.all.tbl.rows.length; // вычислить количество строк в таблице
                numb++;
                document.all.tbl.insertRow(currow); // добавляем строку в таблицу
                document.all.tbl.rows[currow].insertCell(0); // добавляем ячейки
                document.all.tbl.rows[currow].insertCell(1);
                document.all.tbl.rows[currow].insertCell(2);
                // вставляем в форму поля
                document.all.tbl.rows[currow].cells[0].innerHTML =
                        '<input type=\"text\" name=\"ingr\">';
                document.all.tbl.rows[currow].cells[1].innerHTML =
                        '<input type=\"text\" name=\"kol\" style=\"width: 40px ; margin-left: 13%;"\">';
                document.all.tbl.rows[currow].cells[2].innerHTML =
                        '<select size=\"1\" name=\"unit\">' +
                        '<option value=\"гр\">' + gr + '</option>' +
                        '<option value =\"кг\">' + kg + '</option>' +
                        '<option value = \"мл\">' + ml + '</option>' +
                        '<option value = \"л\">' + l + '</option>' +
                        '<option value = \"ч.л\">' + chl + '</option>' +
                        '<option value = \"ст.л\">' + stl + '</option>' +
                        '<option value = \"стакан\">' + st + '</option>' +
                        '<option value = \"штука\">' + sht + '</option>' +
                        '</select>';


            }
            function add_new_row_dscrb() {
                var currrow;
                currow = document.all.tblstep.rows.length; // вычислить количество строк в таблице
                numb_step++;
                document.all.tblstep.insertRow(currow); // добавляем строку в таблицу
                document.all.tblstep.rows[currow].insertCell(0);
                document.all.tblstep.rows[currow].cells[0].innerHTML =
                        '<p>' + "Этап " + +numb_step + '</p>';
                currow = document.all.tblstep.rows.length;
                document.all.tblstep.insertRow(currow); // добавляем строку в таблицу
                document.all.tblstep.rows[currow].insertCell(0);
                document.all.tblstep.rows[currow].insertCell(1);
                document.all.tblstep.rows[currow].cells[0].innerHTML =
                        ' <textarea name=\"dscrb\"></textarea>';
                currow = document.all.tblstep.rows.length;
                document.all.tblstep.insertRow(currow); // добавляем строку в таблицу
                document.all.tblstep.rows[currow].insertCell(0);
                document.all.tblstep.rows[currow].cells[0].innerHTML =
                        '<input type=\"file\" name="data_dscrb\" multiple accept=\"image/*\" value=\"Выбрать фото\" style=\"background:black; color:white\"/></p>';
            }
            function SendFormAddRecipe() {

                document.getElementById("changeInput").value = 'addrecipe';
                document.addrecipe.submit();



            }
        </SCRIPT>
        <title>Главная</title>
        <link rel="stylesheet" type="text/css" href="index.css"> 
            <link rel="stylesheet" type="text/css" href="tag.css"> 
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
                            <form name="addrecipe" method="post" action="controller" enctype="multipart/form-data">
                                <input id="changeInput" type="hidden" name="command" value="addrecipe" />

                                <div id="recipe_menu" style="float: left">
                                    <div style="width:100%">
                                        <table id="form_add_recipe">
                                            <input  type="hidden" name="user" value=${user.userId} />
                                            <input  type="hidden" name="recipeid" value=${recipe.recipeId} />
                                            <tr><td colspan="2"><p><h2>Редактировать Рецепт</h2></p></td> </tr> 
                                            <tr>
                                                <td colspan="2"><p>
                                                        <img src="${recipe.recipePhoto}" class="recipe_img"/>
                                                    </p></td>
                                            </tr><tr>
                                                <td><p>Название рецепта:</p></td><td><input type="text" name="name_recipe" required value="${recipe.recipeName}"/></td></tr> 

                                            <tr><td><p>Время приготовления(в мин.):</p></td><td >
                                                    <input pattern=[0-9]{1,} value="${recipe.cookingTime}" type="text" name="time_cooking" style="width:50px" required title="Введите целые числа"/></td>
                                            </tr>
                                            <c:forEach items="${recipe.categories}" var="category">
                                                <c:if test="${category.categoryId < 10}">
                                                    <tr><td><p>Категория рецепта:</p></td>

                                                        <td>
                                                            <select size="1" name="category" >
                                                                <option value="${category.categoryName}" selected>${category.categoryName}</option>

                                                                <option value="Салаты">Салаты</option>
                                                                <option value="Закуски">Закуски</option>
                                                                <option value="Первые блюда">Первые блюда</option>
                                                                <option value="Вторые блюда">Вторые блюда</option>
                                                                <option value="Выпечка">Выпечка</option>
                                                                <option value="Блины">Блины</option>
                                                                <option value="Десерты">Десерты</option>
                                                                <option value="Напитки">Напитки</option>
                                                                <option value="Соусы">Соусы</option>
                                                            </select></td></tr>
                                                        </c:if>
                                                        <c:if test="${category.categoryId > 9}">
                                                    <tr><td><p>Вид кухни:</p></td>
                                                        <td>
                                                            <select size="1" name="kitchen">
                                                                <option value="${category.categoryName}" selected>${category.categoryName}</option>

                                                                <option value="Американская">Американская</option>
                                                                <option value="Грузинская">Грузинская</option>
                                                                <option value="Индийская">Индийская</option>
                                                                <option value="Испанская">Испанская</option>
                                                                <option value="Итальянская">Итальянская</option>
                                                                <option value="Китайская">Китайская</option>
                                                                <option value="Македонская">Македонская</option>
                                                                <option value="Русская">Русская</option>
                                                                <option value="Узбекская">Узбекская</option>
                                                                <option value="Французская">Французская</option> 
                                                            </select>
                                                        </td></tr>
                                                    </c:if>
                                                </c:forEach>
                                            <tr><td><p>Ингредиент:</p></td>  
                                                <td><p>Количество:</p></td>
                                                <td><p>Единицы:</p></td>
                                                
                                        </table>
                                        <table id="tbl">

                                            <c:forEach items="${recipe.recipeingredients}" var="ingredient">
                                                <input  type="hidden" name="recipeingredient" value=${ingredient.recipeIngredientId} />

                                                <tr>
                                                    <td><input type="text" name="ingr" required value="${ingredient.ingredient.ingredientName}"/></td>
                                                    <td><input type="text" name="kol" value="${ingredient.quantity}" style="width: 40px; margin-left: 13%;" required pattern="\d+(\.\d{0,})?" /></td>
                                                    <td>
                                                        <select size="1" name="unit">
                                                            <option value="${ingredient.unit}" >${ingredient.unit}</option>
                                                            <option value="гр">гр</option>
                                                            <option value="кг">кг</option>
                                                            <option value="мл">мл</option>
                                                            <option value="л">л</option>
                                                            <option value="ч.л">ч.л</option>
                                                            <option value="ст.л">ст.л</option>
                                                            <option value="стакан">стакан</option>
                                                            <option value="штука">штука</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                        <table id="tblstep">
                                            <tr><td><p>Описание:</p></td><td style="width:25px" >
                                                </td>

                                            </tr> 
                                            <c:forEach items="${steps}" var="step">
                                                <input  type="hidden" name="step" value=${step.stepId} />

                                                <tr>
                                                    <td ><p>Этап ${step.stepNumber}</p></td>
                                                </tr>
                                                <tr>
                                                    <td><textarea name="dscrb" required >${step.description}</textarea></td>
                                                </tr>
                                                <tr>  
                                                    <td>
                                                        <c:if test="${step.photo ne ''}">
                                                            <img src="${step.photo}" class="recipe_img"/>
                                                        </c:if>
                                                    </td>
                                                </tr>  
                                            </c:forEach>>
                                        </table>
                                        <input type="submit" value="Редактировать рецепт"  style="background: black;color:white; width: 250px; text-align: center;margin-left: 200px"/>
                                        </form>

                                    </div>
                                    <div style="height: 100px;">

                                    </div>
                                </div>

                                </body>

                                </html>
