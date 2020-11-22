package service.publisher;

import repository.publisher.PublisherRepository;
import repository.publisher.PublisherRepositoryImpl;

import java.util.Map;

public class PublisherServiceImpl implements PublisherService {
    PublisherRepository publisherRepository = new PublisherRepositoryImpl();

    @Override
    public Map<Integer, String> selectAllPublisher() {
        return publisherRepository.selectAllPublisher();
    }
}
