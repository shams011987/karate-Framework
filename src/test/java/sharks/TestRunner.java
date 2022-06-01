package sharks;
import com.intuit.karate.junit5.Karate;
public class TestRunner {
	@Karate.Test
	Karate testUsers() {
		return Karate.run().tags("@Test").relativeTo(getClass());
	}

	

	
}