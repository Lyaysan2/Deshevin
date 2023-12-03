package ru.itis.deshevin.services;

import ru.itis.deshevin.dto.AddDrugDto;
import ru.itis.deshevin.dto.DrugDto;

import java.util.List;
import java.util.UUID;

public interface DrugService {
    void saveDrug(AddDrugDto addDrugDto);

    void updateDrug(AddDrugDto addDrugDto, UUID id);

    List<DrugDto> getAllDrugs();

    DrugDto getDrugById(UUID id);

    void deleteDrugBuId(UUID id);
}
