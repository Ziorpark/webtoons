package com.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kopo.domain.Webtoon;
import com.kopo.domain.Webtoon2;
import com.kopo.repository.WebtoonRepository;
import com.kopo.repository.WebtoonRepository2;

@Service
public class WebtoonServiceImpl implements WebtoonService {
	
	@Autowired
	private WebtoonRepository webtoonRepository;
	
	@Autowired
	private WebtoonRepository2 webtoonRepository2;
	
	@Override
	public List<Webtoon> getAllwebtoonList() {
		// TODO Auto-generated method stub
		return webtoonRepository.getAllwebtoonList();
	}

	@Override
	public List<Webtoon2> getAllwebtoonList2() {
		// TODO Auto-generated method stub
		return webtoonRepository2.getAllwebtoonList2();
	}

	@Override
	public Webtoon2 getWebtoonById(String titleId) {
		// TODO Auto-generated method stub
		Webtoon2 webtoonById = webtoonRepository2.getWebtoonById(titleId);
		
		return webtoonById;
	}

	@Override
	public void setNewWebtoon(Webtoon2 webtoon) {
		// TODO Auto-generated method stub
		webtoonRepository2.setNewWebtoon(webtoon);
	}

	@Override
	public List<Webtoon2> getWebtoonByScore(String totalscore) {
		// TODO Auto-generated method stub
		return webtoonRepository2.getWebtoonByScore(totalscore);
	}	
}
