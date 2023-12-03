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
        function isCategorySelected(name, drug){
            console.log(drug);
            if (drug.category.size!==0){
                console.log(drug.category);
                return true;
                // return name.contains(drug.category);
            }
            return false;
        }
    </script>
</head>

<body class="text-center">
<#include "components/header.ftl">
<main class="container">

    <h2>${drug.title}</h2>
    <div class="row justify-content-md-center">
        <#if user.role == 'ADMIN'>
            <form method="post" action="" class="drug-form" enctype="multipart/form-data">
                <div class="col">
                    <div class="alert alert-info" role="alert">Информация</div>
                    <p><strong>Название:</strong>
                        <input class="form-control mb-2" name="title" value="${drug.title}" type="text">
                    </p>
                    <p><strong>Категория:</strong>
<#--                        todo: список категорий с нужными checked -->
<#--                        <#list categories as category>-->
<#--                            <div class="form-check form-check-inline">-->
<#--                                <input class="form-check-input" name="categoryIdList" type="checkbox" id="inlineCheckbox"-->
<#--                                       value="${category.id}" ${isCategorySelected(category.name, drug) ? "checked": ''}>-->
<#--                                <label class="form-check-label" for="inlineCheckbox">${category.name}</label>-->
<#--                            </div>-->
<#--                        </#list>-->
                        <select multiple name="categoryIdList" class="custom-select mr-sm-2"
                                id="inlineFormCustomSelect">
                            <option value="" multiple="multiple" selected> <#if drug.category??>
                                    <#list drug.category as category>
                                        <${category.name}
                                    </#list>
                                <#else>нет</#if>
                            </option>
                            <#list categories as category>
                                <option name="categoryIdList" value="${category.id}">${category.name}</option>
                            </#list>
                        </select>
                    </p>
<#--                    todo: класс аналог с нужным выделенным-->
                    <p><strong>Класс аналог:</strong>
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
                        <p><strong>Описание:</strong></p>
                        <textarea class="form-control" id="drugDescription" rows="3"
                                  name="description">${drug.description}</textarea>
                        <p><strong>Состав:</strong></p>
                        <textarea class="form-control" id="drugComposition" rows="3"
                                  name="composition">${drug.composition}</textarea>
                        <p><strong>Побочные эффекты:</strong></p>
                        <textarea class="form-control" id="drugSideEffects" rows="3"
                                  name="sideEffects">${drug.sideEffects}</textarea>
                        <p><strong>Действие:</strong></p>
                        <textarea class="form-control" id="drugEffect" rows="3"
                                  name="effect">${drug.effect}</textarea>
                        <p><strong>Применение:</strong></p>
                        <textarea class="form-control" id="drugInstruction" rows="3"
                                  name="instruction">${drug.instruction}</textarea>
                        <p><strong>Противопоказания:</strong></p>
                        <textarea class="form-control" id="drugContraindications" rows="3"
                                  name="contraindications">${drug.contraindications}</textarea>
                        <p><strong>Форма выпуска:</strong></p>
                        <textarea class="form-control" id="drugReleaseForm" rows="3"
                                  name="releaseForm">${drug.releaseForm}</textarea>
                        <p><strong>Производитель:</strong></p>
                        <textarea class="form-control" id="drugManufacturer" rows="3"
                                  name="manufacturer">${drug.manufacturer}</textarea>
                        <p><strong>Условия хранения:</strong></p>
                        <textarea class="form-control" id="drugStorageConditions" rows="3"
                                  name="storageConditions">${drug.storageConditions}</textarea>
                    </div>
                </div>
                <div class="d-flex justify-content-around">
                    <button type="submit" class="btn btn-info mb-2">Изменить</button>
                </div>
            </form>
        <#elseif user.role == 'COMMON_USER'>
            <form action="/favourites/add-to-favourites/${drug.id}" method="post">
                <button type="submit" class="btn">Добавить в избранное</button>
            </form>
            <main class="container">
                <div class="alert alert-info" role="alert">Информация</div>
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

<#include "components/footer.ftl" >

</body>
</html>