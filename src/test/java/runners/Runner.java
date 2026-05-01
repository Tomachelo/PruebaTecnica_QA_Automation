package runners;
import com.intuit.karate.junit5.Karate;

public class Runner {
    @Karate.Test
    Karate principal(){
        return Karate.run("classpath:features").tags("@feature_test_gets");
    }
}
