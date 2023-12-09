package ru.itis.deshevin.services;

import ru.itis.deshevin.dto.AnalogueClassDto;

import java.util.Set;
import java.util.UUID;

public interface AnalogueClassService {
    Set<AnalogueClassDto> getAllAnalogueClass();

    void saveAnalogueClass(AnalogueClassDto analogueClassDto);

    void deleteAnalogueClass(UUID id);
}
