package com.somemall.service.recommender;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator;
import org.apache.mahout.cf.taste.impl.model.GenericBooleanPrefDataModel;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;


/*
 * 
 * 
 * 
 */
public class ItemCFRecommender {
	 
		  
	
	public Map getItemCF(int userid ,int number) throws Exception{
		DataModel model = new FileDataModel(new File("/Users/o0iris0o/Desktop/testdata.txt"));
		Map map = new HashMap();
		ItemSimilarity similarity = new PearsonCorrelationSimilarity(model);
		Recommender recommender = new GenericItemBasedRecommender(model, similarity);
		 
		 
		 LongPrimitiveIterator iter = model.getUserIDs();

		 while (iter.hasNext()) {
				long uid = iter.nextLong();
				if (uid == userid) {
					List<RecommendedItem> list = recommender.recommend(uid, number);

					for (RecommendedItem ritem : list) {
						System.out.printf("(%s,%f)", ritem.getItemID(),
								ritem.getValue());

						map.put(ritem.getItemID()+"", ritem.getValue()+"");

					}
				}

			}
			return map;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
}