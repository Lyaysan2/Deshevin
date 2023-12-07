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
        <h1>Просмотр аналогов препаратов для:</h1>
    </div>

    <table class="table">
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
        <#list drugs as drug>
            <tr>
                <#if (drug.drugImageFileDBID)??>
                    <td scope="row"><img src="/files/${drug.drugImageFileDBID}" alt="avatar" class="avatar"></td>
                <#else>
                    <td scope="row"><img src="/img/no-image.png" alt="avatar" class="avatar"/></td>
                </#if>
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
                            <button type="submit" onclick="delet('${drug.id}')" class="btn">Удалить из избранных</button>
                        <#else>
                            <button type="submit" onclick="addToFav('${drug.id}')" class="btn">Добавить в избранные</button>
                        </#if>
                    </#if>
                </td>
            </tr>
        </#list>

    </table>

    <#include "components/footer.ftl" >
</body>
</html>