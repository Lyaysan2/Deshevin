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

        <form action="/search" method="get">
            <p>
    <#--            <label for="name">Напишите название:</label>-->
                <input type="text" class="input-form" name="prefixParam" id="prefixParam" placeholder="Введите название лекарства">
                <input type="submit" class="btn" value="Поиск">
            </p>
        </form>

        <table class="table" id="content-table">
            <thead class="thead-light bg-info">
            <tr>
                <th scope="col" class="table-title">Название</th>
                <th scope="col" class="table-title">Описание</th>
                <th scope="col" class="table-title">Категория</th>
                <th scope="col" class="table-title">Действие</th>
            </tr>
            </thead>
            <tbody id="content-tbody">
            <#list drugs as drug>
                <tr>
                    <td>
                        <div class="table-item">
                            <div class="title-photo">
                                <a href="/drug/${drug.id}" class="drug-name">${drug.title}</a>
                                <br>
                                <#if (drug.drugImageFileDBID)??>
                                    <img src="/files/${drug.drugImageFileDBID}" alt="avatar" class="avatar">
                                <#else>
                                    <img src="/img/no-image.png" alt="avatar" class="avatar"/>
                                </#if>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="table-item">
                            ${drug.description}...
                        </div>
                    </td>
                    <td>
                        <div class="table-item">
                            <#if (drug.category)??>
                                <#list (drug.category) as cat>
                                    ${cat.name}<br>
                                </#list>
                            </#if>
                        </div>
                    </td>
                    <td>
                        <div class="table-item">
                            <form action="/search/analogue/${drug.id}">
                                <button type="submit" class="btn-delete">Просмотреть аналоги</button>
                            </form>
                            <#if user??>
                                <#if inFavorites(user, drug)>
                                    <button type="submit" onclick="delet('${drug.id}')" class="btn-delete">Удалить из избранных</button>
                                <#else>
                                    <button type="submit" onclick="addToFav('${drug.id}')" class="btn-delete">Добавить в избранные</button>
                                </#if>
                            </#if>
                        </div>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>

<#--    <#include "components/footer.ftl" >-->
</body>
</html>