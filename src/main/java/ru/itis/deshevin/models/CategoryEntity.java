package ru.itis.deshevin.models;

import lombok.*;
import lombok.experimental.SuperBuilder;

import javax.persistence.*;
import java.util.Set;

@Data
@Entity
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true, exclude = "drugs")
@ToString(exclude = "drugs")
@Table(name = "category")
public class CategoryEntity extends BaseEntity {

    private String name;

    @ManyToMany(mappedBy = "drugsCategory",cascade =
            {
                    CascadeType.DETACH,
                    CascadeType.MERGE,
                    CascadeType.REFRESH,
                    CascadeType.PERSIST
            })
    private Set<DrugEntity> drugs;
}
