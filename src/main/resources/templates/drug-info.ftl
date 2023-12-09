<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Страница информации о лекарстве">
    <meta name="author" content="Ю. Марсель">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Информация о лекарстве</title>

    <#include "components/links.ftl">

    <#--todo-->
    <script>
        function isCategorySelected(name, drug) {
            console.log(drug);
            if (drug.category.size !== 0) {
                console.log(drug.category);
                return true;
                // return name.contains(drug.category);
            }
            return false;
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
<main class="container">
    <h2 class="drug-name">${drug.title}</h2>
    <div class="row justify-content-md-center">
        <#if user.role == 'ADMIN'>
            <form method="post" action="" class="drug-form" enctype="multipart/form-data">
                <div class="col">
                    <div class="alert alert-info" role="alert">Информация</div>
                    <#if (drug.drugImageFileDBID)??>
                        <img src="/files/${drug.drugImageFileDBID}" alt="avatar" class="avatar">
                    <#else>
                        <img src="/img/no-image.png" alt="avatar" class="avatar"/>
                    </#if>
                    <p>Название:
                        <input class="form-control mb-2" name="title" value="${drug.title}" type="text">
                    </p>
                    <p>Категория:
                        <select multiple name="categoryIdSet" class="custom-select mr-sm-2"
                                id="inlineFormCustomSelect">
                            <option value="" multiple="multiple" selected> <#if drug.category??>
                                    <#list drug.category as category>
                                        <${category.name}
                                    </#list>
                                <#else>нет</#if>
                            </option>
                            <#list categories as category>
                                <option name="categoryIdSet" value="${category.id}">${category.name}</option>
                            </#list>
                        </select>
                    </p>
                    <p>Класс аналога:
                        <select name="analogueId" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                            <option name="analogueId" value=""
                                    selected> <#if drug.analogueClass??>${drug.analogueClass}<#else>нет</#if></option>
                            <#list analogues as analogue>
                                <option value="${analogue.id}">${analogue.title}</option>
                            </#list>
                        </select>
                    </p>
                </div>
                <div class="row">
                    <div class="col align-self-center">
                        <p>Описание:</p>
                        <textarea class="form-control" id="drugDescription" rows="3"
                                  name="description">${drug.description}</textarea>
                        <p>Состав:</p>
                        <textarea class="form-control" id="drugComposition" rows="3"
                                  name="composition">${drug.composition}</textarea>
                        <p>Побочные эффекты:</p>
                        <textarea class="form-control" id="drugSideEffects" rows="3"
                                  name="sideEffects">${drug.sideEffects}</textarea>
                        <p>Действие:</p>
                        <textarea class="form-control" id="drugEffect" rows="3"
                                  name="effect">${drug.effect}</textarea>
                        <p>Применение:</p>
                        <textarea class="form-control" id="drugInstruction" rows="3"
                                  name="instruction">${drug.instruction}</textarea>
                        <p>Противопоказания:</p>
                        <textarea class="form-control" id="drugContraindications" rows="3"
                                  name="contraindications">${drug.contraindications}</textarea>
                        <p>Форма выпуска:</p>
                        <textarea class="form-control" id="drugReleaseForm" rows="3"
                                  name="releaseForm">${drug.releaseForm}</textarea>
                        <p>Производитель:</p>
                        <textarea class="form-control" id="drugManufacturer" rows="3"
                                  name="manufacturer">${drug.manufacturer}</textarea>
                        <p>Условия хранения:</p>
                        <textarea class="form-control" id="drugStorageConditions" rows="3"
                                  name="storageConditions">${drug.storageConditions}</textarea>
                    </div>
                </div>
                <div class="d-flex justify-content-around">
                    <button type="submit" class="btn btn-info mb-2">Изменить</button>
                </div>
            </form>
        <#elseif user.role == 'COMMON_USER'>
            <main>
                <div class="drug-title"
                    <#if (drug.drugImageFileDBID)??>
                        <img src="/files/${drug.drugImageFileDBID}" alt="avatar" class="avatar">
                    <#else>
                        <img src="/img/no-image.png" alt="avatar" class="avatar"/>
                    </#if>
                    <#if inFavorites(user, drug)>
                        <button type="submit" onclick="delet('${drug.id}')" class="btn-delete">Удалить из избранных</button>
                    <#else>
                        <button type="submit" onclick="addToFav('${drug.id}')" class="btn-delete">Добавить в избранные</button>
                    </#if>
                </div>

                <div class="mb-3">
                    <label for="title" class="drug-info">Название: ${drug.title}</label>
                </div>
                <div class="mb-3">
                    <label for="title" class="drug-info">Описание: ${drug.description}</label>
                </div>
                <div class="mb-3">
                    <label for="title" class="drug-info">Состав: ${drug.composition}</label>
                </div>
                <div class="mb-3">
                    <label for="title" class="drug-info">Побочные эффекты: ${drug.sideEffects}</label>
                </div>
                <div class="mb-3">
                    <label for="title" class="drug-info">Действие: ${drug.effect}</label>
                </div>
                <div class="mb-3">
                    <label for="title" class="drug-info">Применение: ${drug.instruction}</label>
                </div>
                <div class="mb-3">
                    <label for="title" class="drug-info">Противопоказания: ${drug.contraindications}</label>
                </div>
                <div class="mb-3">
                    <label for="title" class="drug-info">Форма выпуска: ${drug.releaseForm}</label>
                </div>
                <div class="mb-3">
                    <label for="title" class="drug-info">Производитель: ${drug.manufacturer}</label>
                </div>
                <div class="mb-3">
                    <label for="title" class="drug-info">Условия хранения: ${drug.storageConditions}</label>
                </div>
                <div class="mb-3">
                    <label for="category" class="drug-info">Категория: <#if (drug.category)??>
                            <#list (drug.category) as cat>
                                ${cat.name}
                            </#list>
                        </#if></label>
                </div>
                <div class="mb-3">
                    <label for="analogue-class" class="drug-info">Класс
                        аналог: <#if drug.analogueClass??>${drug.analogueClass}<#else>нет</#if></label>
                </div>
            </main>
        </#if>
    </div>

</main>

<#--<#include "components/footer.ftl" >-->

</body>
</html>