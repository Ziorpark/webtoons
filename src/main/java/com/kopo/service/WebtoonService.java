package com.kopo.service;

import java.util.List;

import com.kopo.domain.Webtoon;
import com.kopo.domain.Webtoon2;

	public interface WebtoonService {
		//실습
		List<Webtoon> getAllwebtoonList();
		
		//프로젝트
		List<Webtoon2> getAllwebtoonList2();
		Webtoon2 getWebtoonById(String titleId);
		void setNewWebtoon(Webtoon2 webtoon);
		List<Webtoon2> getWebtoonByScore(String totalscore);
	}
	
	

