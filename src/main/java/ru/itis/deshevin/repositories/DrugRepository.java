package ru.itis.deshevin.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ru.itis.deshevin.models.AnalogueClassEntity;
import ru.itis.deshevin.models.DrugEntity;

import java.util.List;
import java.util.UUID;

public interface DrugRepository extends JpaRepository<DrugEntity, UUID> {

//    @Query("select d.title from Drugs d where d.title LIKE CONCAT('%',:title,'%')")
    List<DrugEntity> findAllByTitleContainingIgnoreCase(String titleLike);

    List<DrugEntity> findAllByAnalogueClass(AnalogueClassEntity analogueClass);

//    List<DrugsEntity> findAllByCategory(CategoryEntity category);
}
