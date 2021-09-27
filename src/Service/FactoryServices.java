package Service;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FactoryServices {
	
	private static SqlSessionFactory factory;
	
	static { // 스텍틱 초기화 영역(이 영역안에서 쓰인 변수는 무조건 static이어야 한다.)
		try {
			Reader r = Resources.getResourceAsReader("config/config.xml"); // config의 파일경로를 리더에 저장해줘야 한다.
			factory = new SqlSessionFactoryBuilder().build(r); // try~catch문에서 factory를 넣을경우 지역변수로써 캐치문 안을 벗어나면 소멸되기 때문에 factory를 위에다 지정했다.
			r.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}