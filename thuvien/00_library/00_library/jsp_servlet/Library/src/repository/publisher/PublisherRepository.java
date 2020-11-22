package repository.publisher;

import java.util.Map;

public interface PublisherRepository {
    Map<Integer, String> selectAllPublisher();
}
