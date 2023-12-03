<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Панель добавления лекарств">
    <meta name="author" content="Ю. Марсель">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Избранное</title>

    <#include "components/links.ftl">

    <script>
        function delFromFav(id) {
            jQuery.ajax({
                url: '/favourites/delete-from-favourites/' + id,
                type: 'delete'
            });
            document.getElementById("my-tr-" + id).hidden = true
        }
    </script>


    <#include "components/links.ftl">

<body class="text-center">
<#include "components/header.ftl">
<main class="container">
    <h1 class="text-center">Избранные лекарства</h1>

    <table class="table">
        <thead class="thead-light bg-info">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Название</th>
            <th scope="col">Описание</th>
            <th scope="col">Категория</th>
            <th scope="col">Аналог класс</th>
            <th scope="col">Удалить из избранного</th>
        </tr>
        </thead>
        <#if favourites??>
            <#list favourites as drug>

                <tr id="my-tr-${drug.id}">
                    <th scope="row">${drug?index + 1}</th>
                    <td><a href="/drug/${drug.id}">${drug.title}</a></td>
                    <td>${drug.description}...</td>
                    <td>
                        <#if (drug.category)??>
                            <#list (drug.category) as cat>
                                ${cat.name}
                            </#list>
                        </#if>
                    </td>
                    <td><#if drug.analogueClass??>${drug.analogueClass}<#else>нет</#if></td>
                    <td>
                        <button type="submit" onclick="delFromFav('${drug.id}')" style="position:relative; left:10px; top:15px" class="btn btn-danger">X</button>
                    </td>
                </tr>
            </#list>
        </#if>
    </table>
</main>

<#include "components/footer.ftl" >

</body>
</html>