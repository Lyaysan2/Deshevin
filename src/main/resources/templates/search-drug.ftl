<!doctype html>
<html lang="ru" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Страница поиска препаратов">
    <meta name="author" content="Ф. Гусев">
    <title>Поиск препаратов</title>
    <#include "components/links.ftl">
    <script>
        function updateList() {
            $.getJSON('/search/prefix/'+document.getElementById('prefix_text').value, function(data) {
                const old_tbody = document.getElementById("content-tbody")
                const new_tbody = document.createElement('tbody');
                new_tbody.setAttribute("id", "content-tbody")
                old_tbody.parentNode.replaceChild(new_tbody, old_tbody)
                for(var i in data) {
                    var tbodyRef = document.getElementById("content-table").getElementsByTagName('tbody')[0];
                    var newRow = tbodyRef.insertRow();

                    var newCellTitle = newRow.insertCell();
                    var titleLink = document.createElement('a');
                    titleLink.innerHTML = '<a href="/drug/'+data[i].id+'">'+data[i].title+'</a>';
                    newCellTitle.appendChild(titleLink);

                    newRow.insertCell().appendChild(document.createTextNode(data[i].description + '...'));
                    newRow.insertCell().appendChild(document.createTextNode(data[i].category));
                    newRow.insertCell().appendChild(document.createTextNode(data[i].analogueClass));

                    var newCellAction = newRow.insertCell();
                    var action = document.createElement('div');
                    action.innerHTML = '<form action="/search/analogue/'+data[i].id+'">' +
                                        '<button type="submit" class="btn">Просмотреть аналоги</button></form>';
                    newCellAction.appendChild(action);
                }
            });
        }
    </script>
    <script>
        function delet(id) {
            jQuery.ajax({
                url: '/favourites/delete-from-favourites/' + id,
                type: 'delete',
                success: function(){
                    window.location.reload();
                }
            });
        }
    </script>
    <script>
        function addToFav(id) {
            jQuery.ajax({
                url: '/favourites/add-to-favourites/' + id,
                type: 'post',
                success: function(){
                    window.location.reload();
                }
            });
        }
    </script>
    <style>
        .avatar {
            width: 200px;
            height: 200px;
            display: inline;
            justify-content: center;
        }
    </style>
</head>
<body class="text-center">
    <#include "components/header.ftl">
    <#function inFavorites(user, drug)>
        <#list user.favorites as userFavDrugs>
            <#if userFavDrugs.title == drug.title>
                <#return true>
            </#if>
        </#list>
        <#return false>
    </#function>

    <div class="container">
        <h1>Поиск препаратов</h1>
    </div>

    <input id="prefix_text" placeholder="Начните писать название..." onchange="updateList()"/>
    И нажмите enter...
    <hr>

    <table class="table" id="content-table">
        <thead class="thead-light bg-info">
        <tr>
            <th scope="col">Фото</th>
            <th scope="col">Название</th>
            <th scope="col">Описание</th>
            <th scope="col">Категория</th>
            <th scope="col">Аналог класс</th>
            <th scope="col">Действие</th>
        </tr>
        </thead>
        <tbody id="content-tbody">
        <#list drugs as drug>
            <tr>
                <#if (drug.drugImageFileDBID)??>
                    <td scope="row"><img src="/files/${drug.drugImageFileDBID}" alt="avatar" class="avatar"></td>
                <#else>
                    <td scope="row"><img src="/img/no-image.png" alt="avatar" class="avatar"/></td>
                </#if>
                <td><a href="/drug/${drug.id}">${drug.title}</a></td>
                <td>${drug.description}...</td>
                <td>
                    <#if (drug.category)??>
                        <#list (drug.category) as cat>
                            ${cat.name}
                        </#list>
                    </#if>
                </td>
                <td> <#if drug.analogueClass??>${drug.analogueClass}<#else>нет</#if></td>
                <td>
                    <form action="/search/analogue/${drug.id}">
                        <button type="submit" class="btn">Просмотреть аналоги</button>
                    </form>
                    <#if user??>
                        <#if inFavorites(user, drug)>
                            <button type="submit" onclick="delet('${drug.id}')" class="btn">Удалить из избранных</button>
                        <#else>
                            <button type="submit" onclick="addToFav('${drug.id}')" class="btn">Добавить в избранные</button>
                        </#if>
                    </#if>
                    <!-- Может быть, будет использовано позднее
                    <form action="/search/category/${drug.id}">
                        <button type="submit" class="btn">Просмотреть препараты этой категории</button>
                    </form>
                    -->
                </td>
            </tr>
        </#list>
        </tbody>
    </table>

    <#include "components/footer.ftl" >
</body>
</html>