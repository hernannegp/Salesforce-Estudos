public class StringArrayTest {
    public static List<String> generateStringArray(Integer N) {
        List<String> result = new List<String>();
        for (Integer i = 0; i < N; i++) {
            result.add('Test ' + i);
            System.debug(result[i]);
        }
        return result;
    }
}