package runners;
import com.intuit.karate.junit5.Karate;

public class GeneralRunner {
    @Karate.Test
    Karate runnerBase(){
        return Karate.run("classpath:features");
    }
}

