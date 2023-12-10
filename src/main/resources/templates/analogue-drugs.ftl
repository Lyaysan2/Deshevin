<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Страница поиска препаратов">
    <meta name="author" content="Ф. Гусев">
    <title>Просмотр аналогов</title>
    <#include "components/links.ftl">
    <script>
        function delet(id) {
            jQuery.ajax({
                url: '/favourites/delete-from-favourites/' + id,
                type: 'delete'
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
        <h1>Просмотр аналогов препаратов для: </h1>

        <table class="table">
            <thead class="thead-light bg-info">
            <tr>
                <th scope="col" class="table-title">Название</th>
                <th scope="col" class="table-title">Описание</th>
                <th scope="col" class="table-title">Категория</th>
                <th scope="col" class="table-title">Класс аналогов</th>
<#--                <th scope="col" class="table-title">Действие</th>-->
            </tr>
            </thead>
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
                            <#if drug.analogueClass??>${drug.analogueClass}<#else>нет</#if>
                        </div>
                    </td>
                </tr>
            </#list>

        </table>
    </div>

<#--    <#include "components/footer.ftl" >-->
</body>
</html>