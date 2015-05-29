<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                </head>

                <body scroll="yes">
                   <header >

                        <div class='block' id="enter">
                            <br/>
                            <p>${user.firstname} ${user.lastname}</p><br>
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
                        <form name="addrecipe" method="post" action="controller" enctype="multipart/form-data">
                            <div id="recipe_menu" style="float: left">
                                <div style="width:100%">
                                    <table id="form_add_recipe">
                                        <input  type="hidden" name="user" value=${user.userId} />
                                        <tr><td colspan="2"><p><h2>Добавить Рецепт</h2></p></td> </tr> 
                                        <tr><td><p>Название рецепта:</p></td><td><input type="text" name="name_recipe" required/></td></tr> 
                                        <tr><td> <p>Фото рецепта:</p></td>
                                            <td><p>
                                                    <input type="file" name="data"  accept="image/*,image/jpeg" required="required" title="Необходимо выбрать файл"/>
                                                    
                                                </p></td>
                                        <td> <p>${error_data}</p></td></tr>
                                        <tr><td><p>Время приготовления(в мин.):</p></td><td >
                                                <input pattern=[0-9]{1,} type="text" name="time_cooking" style="width:50px" required title="Введите целые числа"/></td>
                                         </tr>
                                        <tr><td><p>Категория рецепта:</p></td>
                                            <td>
                                                <select size="1" name="category">
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
                                        <tr><td><p>Вид кухни:</p></td>
                                            <td>
                                                <select size="1" name="kitchen" >
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
                                        <tr><td><p>Ингредиент:</p></td>  
                                            <td><p>Количество:</p></td>
                                            <td><p>Единицы:</p></td>
                                            <td style="width:25px">
                                                <input type=button name="btnNext" value="+" onClick ='add_new_row_ingr()' style="width:30px; background: black;color:white"/>;
                                            </td>
                                    </table>
                                    <table id="tbl">
                                        <tr>
                                            <td><input type="text" name="ingr" required/></td>
                                            <td><input type="text" name="kol" style="width: 40px; margin-left: 13%;" required pattern="\d+(\.\d{0,})?" /></td>
                                            <td>
                                                <select size="1" name="unit">
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
                                    </table>
                                    <table id="tblstep">
                                        <tr><td><p>Описание:</p></td><td style="width:25px" >
                                                <input type=button name="btnNext" value="Добавить этап" onClick ='add_new_row_dscrb(this)' style=" background: black;color:white"/>;
                                            </td>

                                        </tr> 
                                        <tr>
                                            <td ><p>Этап 1</p></td>
                                        </tr>
                                        <tr>
                                            <td><textarea name="dscrb" required></textarea></td>
                                        </tr>
                                        <tr>  
                                            <td>

                                                <input type="file" name="data_dscrb" accept="image/*" style="background: black;color:white"/>;

                                            </td>
                                        </tr>  
                                    </table>
                                    <input id="changeInput" type="hidden" name="command" value="addrecipe" />
                                    <input type="submit" value="Добавить рецепт"  style="background: black;color:white; width: 250px; text-align: center;margin-left: 200px"/>
                                    </form>

                                </div>


                            </div>
                    </div>

                </body>

                </html>
