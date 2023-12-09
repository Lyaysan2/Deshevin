package ru.itis.deshevin.services;

import ru.itis.deshevin.dto.DrugDto;
import ru.itis.deshevin.models.UserEntity;
import ru.itis.deshevin.security.details.UserEntityDetails;

import java.util.Set;
import java.util.Optional;
import java.util.UUID;

public interface SearchService {

    Set<DrugDto> getDrugsWithSameAnalogueClassAs(UUID drugId);

//    Set<DrugDto> getDrugsWithSameCategoryAs(UUID drugId);

}
