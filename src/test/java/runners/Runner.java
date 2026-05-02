package runners;
import com.intuit.karate.junit5.Karate;

public class Runner {
    @Karate.Test
    Karate runnerBase(){
        return Karate.run("classpath:features").tags("@feature_api_filters");
    }
}
