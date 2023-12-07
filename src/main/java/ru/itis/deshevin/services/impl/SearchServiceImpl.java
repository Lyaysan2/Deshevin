package ru.itis.deshevin.services.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import ru.itis.deshevin.dto.DrugDto;
import ru.itis.deshevin.mappers.DrugMapper;
import ru.itis.deshevin.models.DrugEntity;
import ru.itis.deshevin.repositories.DrugRepository;
import ru.itis.deshevin.services.SearchService;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class SearchServiceImpl implements SearchService {

    private final DrugRepository drugRepository;

    private final DrugMapper drugMapper;

    @Override
    public List<DrugDto> getDrugsForPreview() {
        log.info("Get drugs for preview");
        return drugMapper.toDrugListDto(drugRepository.findAll()
                .stream()
                .peek(
                        drug -> drug.setDescription(drug.getDescription().substring(0, Integer.min(100, drug.getDescription().length())))
                )
                .limit(50L).collect(Collectors.toList()));
    }
//
//    @Override
//    public List<DrugDto> getDrugsByNameStartsWith(String prefix) {
//        log.info("Drug search by prefix {}", prefix);
//        return drugMapper.toDrugListDto(drugRepository.findAllByTitleLike(prefix + "%"));
//    }

    @Override
    public List<DrugDto> getDrugsWithSameAnalogueClassAs(UUID drugId) {
        log.info("Search for drugs in same analogue class with {}", drugId);
        Optional<DrugEntity> optionalDrug = drugRepository.findById(drugId);
        if(optionalDrug.isEmpty()) {
            log.error("Drug not found! id = {}", drugId);
            return new ArrayList<>();
        }
        DrugEntity drug = optionalDrug.get();
        return drugMapper.toDrugListDto(drugRepository.findAllByAnalogueClass(drug.getAnalogueClass()));
    }

//    @Override
//    public List<DrugDto> getDrugsWithSameCategoryAs(UUID drugId) {
//        log.info("Search for drugs in same category with {}", drugId);
//        Optional<DrugsEntity> optionalDrug = drugRepository.findById(drugId);
//        if(optionalDrug.isEmpty()) {
//            log.error("Drug not found! id = {}", drugId);
//            return new ArrayList<>();
//        }
//        DrugsEntity drug = optionalDrug.get();
//        return drugMapper.toDrugListDto(drugRepository.findAllByCategory(drug.getCategory()));
//    }
}
