package repository.author;

import java.util.Map;

public interface AuthorRepository {
    Map<Integer, String> selectAllAuthor();
}
