package ru.itis.deshevin.dto;

import lombok.*;

import java.util.List;
import java.util.Set;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class DrugDto {
    private UUID id;
    private String title;
    private String description;
    private String composition;
    private String manufacturer;
    private String contraindications;
    private String sideEffects;
    private String releaseForm;
    private String effect;
    private String instruction;
    private String storageConditions;

    private Set<CategoryDto> category;
    private String analogueClass;
}
