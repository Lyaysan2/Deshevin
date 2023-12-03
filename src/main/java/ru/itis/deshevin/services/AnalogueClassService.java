package ru.itis.deshevin.services;

import ru.itis.deshevin.dto.AnalogueClassDto;
import ru.itis.deshevin.dto.CategoryDto;

import java.util.List;
import java.util.UUID;

public interface AnalogueClassService {
    List<AnalogueClassDto> getAllAnalogueClass();

    void saveAnalogueClass(AnalogueClassDto analogueClassDto);

    void deleteAnalogueClass(UUID id);
}
