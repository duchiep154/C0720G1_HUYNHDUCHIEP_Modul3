package service;

import repository.PublisherRepository;
import repository.PublisherRepositoryImpl;

import java.util.Map;

public class PublisherServiceImpl implements PublisherService {
    PublisherRepository publisherRepository = new PublisherRepositoryImpl();

    @Override
    public Map<Integer, String> selectAllPublisher() {
        return publisherRepository.selectAllPublisher();
    }
}
