package service;

import repository.AuthorRepository;
import repository.AuthorRepositoryImpl;

import java.util.Map;

public class AuthorServiceImpl implements AuthorService {
    AuthorRepository authorRepository = new AuthorRepositoryImpl();

    @Override
    public Map<Integer, String> selectAllAuthor() {
        return authorRepository.selectAllAuthor();
    }
}
