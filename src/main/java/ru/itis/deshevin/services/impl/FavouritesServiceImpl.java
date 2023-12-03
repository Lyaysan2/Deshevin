package ru.itis.deshevin.services.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import ru.itis.deshevin.dto.DrugDto;
import ru.itis.deshevin.mappers.DrugMapper;
import ru.itis.deshevin.models.DrugEntity;
import ru.itis.deshevin.models.UserEntity;
import ru.itis.deshevin.repositories.DrugRepository;
import ru.itis.deshevin.repositories.UserEntityRepository;
import ru.itis.deshevin.services.FavouritesService;

import java.util.List;
import java.util.UUID;

@Log4j2
@RequiredArgsConstructor
@Service
public class FavouritesServiceImpl implements FavouritesService {

    private final DrugRepository drugRepository;
    private final UserEntityRepository userEntityRepository;
    private final DrugMapper drugMapper;

    @Override
    public void addDrugToFavourites(UUID userId, UUID drugId) {
        UserEntity user = userEntityRepository.findById(userId).orElseThrow();
        DrugEntity drug = drugRepository.findById(drugId).orElseThrow();

        if(!user.getFavorites().contains(drug)) user.getFavorites().add(drug);

        userEntityRepository.save(user);
        log.info("Successfuly add drug: " + drug + "to account: " + user);
    }

    @Override
    public List<DrugDto> getFavouriteDrugs(UUID userId) {
        UserEntity user = userEntityRepository.findById(userId).orElseThrow();
        log.info("Successfuly return list of drugs for account: " + user);
        return drugMapper.toDrugListDto(user.getFavorites());
    }

    @Override
    public void deleteDrugFromFavourites(UUID userId, UUID drugId) {
        UserEntity user = userEntityRepository.findById(userId).orElseThrow();
        DrugEntity drug = drugRepository.findById(drugId).orElseThrow();

        user.getFavorites().remove(drug);

        userEntityRepository.save(user);
        log.info("Successfuly delete drug: " + drug + "from account: " + user);
    }
}
