package com.choongang.OriMarket.utill;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import static com.choongang.OriMarket.utill.Constant.*;

@Service
public class ImageService {
    public String saveStoreImage(MultipartFile multipartFile) throws IOException {

        String originalFilename = multipartFile.getOriginalFilename();

        String imageUrl = IMAGE_PATH + originalFilename;
        Path saveImagePath = Paths.get(imageUrl);

        // 저장할 디렉토리 생성
        File directory = new File(IMAGE_PATH);
        if (!directory.exists()) {
            directory.mkdirs();
        }
        // 파일을 저장할 경로 생성
        File destinationFile = new File(saveImagePath.toUri());

        // MultipartFile을 파일로 저장
        multipartFile.transferTo(destinationFile);

        return destinationFile.getName();
    }

    public String saveReviewImage(MultipartFile multipartFile) throws IOException {

        String originalFilename = multipartFile.getOriginalFilename();
        String imageUrl = REVIEW_IMAGE_PATH + originalFilename;
        Path saveImagePath = Paths.get(imageUrl);

        // 저장할 디렉토리 생성
        File directory = new File(REVIEW_IMAGE_PATH);
        if (!directory.exists()) {
            directory.mkdirs();
        }
        // 파일을 저장할 경로 생성
        File destinationFile = new File(saveImagePath.toUri());

        // MultipartFile을 파일로 저장
        multipartFile.transferTo(destinationFile);

        return destinationFile.getName();
    }

    public String saveItemImage(MultipartFile multipartFile) throws IOException {

        String originalFilename = multipartFile.getOriginalFilename();
        String imageUrl = ITEM_IMAGE_PATH + originalFilename;
        Path saveImagePath = Paths.get(imageUrl);

        // 저장할 디렉토리 생성
        File directory = new File(ITEM_IMAGE_PATH);
        if (!directory.exists()) {
            directory.mkdirs();
        }
        // 파일을 저장할 경로 생성
        File destinationFile = new File(saveImagePath.toUri());

        // MultipartFile을 파일로 저장
        multipartFile.transferTo(destinationFile);

        return destinationFile.getName();
    }

    public String saveRiderImage(MultipartFile multipartFile) throws IOException {

        String originalFilename = multipartFile.getOriginalFilename();
        String imageUrl = ITEM_IMAGE_PATH + originalFilename;
        Path saveImagePath = Paths.get(imageUrl);

        // 저장할 디렉토리 생성
        File directory = new File(ITEM_IMAGE_PATH);
        if (!directory.exists()) {
            directory.mkdirs();
        }
        // 파일을 저장할 경로 생성
        File destinationFile = new File(saveImagePath.toUri());

        // MultipartFile을 파일로 저장
        multipartFile.transferTo(destinationFile);

        return destinationFile.getName();
    }

}


