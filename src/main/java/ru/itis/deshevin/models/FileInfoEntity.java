package ru.itis.deshevin.models;

import lombok.*;
import lombok.experimental.SuperBuilder;

import javax.persistence.*;

@Data
@Entity
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true, exclude = {"drug"})
@ToString(exclude = "drug")
@Table(name = "file_info")
public class FileInfoEntity extends BaseEntity{

    @Column(columnDefinition="TEXT", name = "original_file_name")
    private String originalFileName;

    @Column(name = "file_db_id")
    private String fileDBID;

    private Integer size;

    private String type;

    @OneToOne(mappedBy = "photo")
    private DrugEntity drug;
}
