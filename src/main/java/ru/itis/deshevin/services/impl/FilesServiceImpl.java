package ru.itis.deshevin.services.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import ru.itis.deshevin.models.FileInfoEntity;
import ru.itis.deshevin.repositories.FilesRepository;
import ru.itis.deshevin.services.FilesService;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Optional;
import java.util.UUID;

@RequiredArgsConstructor
@Service
public class FilesServiceImpl implements FilesService {
    @Value("${files.storage.path}")
    private String storagePath;

    private final FilesRepository filesRepository;

    @Transactional
    @Override
    public Optional<FileInfoEntity> saveFileToStorage(MultipartFile multipartFile) {
        try {
            String extension = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));

            String storageFileName = UUID.randomUUID() + extension;

            FileInfoEntity file = FileInfoEntity.builder()
                    .type(multipartFile.getContentType())
                    .originalFileName(multipartFile.getOriginalFilename())
                    .fileDBID(storageFileName)
                    .size((int)multipartFile.getSize())
                    .build();

            Files.copy(multipartFile.getInputStream(), Paths.get(storagePath, file.getFileDBID()));

            filesRepository.save(file);

            return Optional.of(file);
        } catch (IOException e) {
            throw new IllegalArgumentException(e);
        }
    }
}
