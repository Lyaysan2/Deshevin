package ru.itis.deshevin.mappers;


import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;
import ru.itis.deshevin.dto.AddDrugDto;
import ru.itis.deshevin.dto.DrugDto;
import ru.itis.deshevin.models.DrugEntity;

import java.util.List;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, uses = CategoryMapper.class)
public interface DrugMapper {

    @Mapping(target = "analogueClass.id", source = "analogueId")
    DrugEntity toDrugEntity(AddDrugDto addDrugDto);

    @Mapping(target = "category", source = "drugsCategory")
    @Mapping(target = "analogueClass", source = "analogueClass.title")
    DrugDto toDrugDto(DrugEntity drugEntity);

    List<DrugDto> toDrugListDto(List<DrugEntity> drugEntityList);
}
