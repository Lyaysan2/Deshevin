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
        <h1>Просмотр аналогов препаратов для:</h1>
    </div>

    <table class="table">
        <thead class="thead-light bg-info">
        <tr>
            <th scope="col">Название</th>
            <th scope="col">Описание</th>
            <th scope="col">Категория</th>
            <th scope="col">Аналог класс</th>
            <th scope="col">Действие</th>
        </tr>
        </thead>
        <#list drugs as drug>
            <tr>
                <td><a href="/drug/${drug.id}">${drug.title}</a></td>
                <td>${drug.description}...</td>
                <td><#if (drug.category)??>
                        <#list (drug.category) as cat>
                            ${cat.name}
                        </#list>
                    </#if></td>
                <td><#if drug.analogueClass??>${drug.analogueClass}<#else>нет</#if></td>
                <td>
                    <#if user??>
                        <#if inFavorites(user, drug)>
                            <button type="submit" onclick="delet('${drug.id}')" class="btn">Удалить из избранных
                            </button>
                        <#else>
                            <form action="/favourites/add-to-favourites/${drug.id}" method="post">
                                <button type="submit" class="btn">Добавить в избранное</button>
                            </form>
                        </#if>
                    </#if>
                </td>
            </tr>
        </#list>

    </table>

    <#include "components/footer.ftl" >
</body>
</html>